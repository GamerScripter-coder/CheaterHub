return function(M, T, IT)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local HttpService = game:GetService("HttpService")

	local env = (type(getgenv) == "function" and getgenv()) or shared
	local selfMod = M
	local TS = T

	-- Gestione sessione per evitare loop duplicati al riavvio
	env.AutoFarmSessionId = (env.AutoFarmSessionId or 0) + 1
	local sessionId = env.AutoFarmSessionId

	local function IsSessionActive()
		return env.AutoFarmSessionId == sessionId
	end

	-- Caricamento config opzionale tramite IT
	local config = {}
	if IT and type(IT.LoadConfig) == "function" then
		local okConf, rawConf = pcall(function()
			return IT.LoadConfig()
		end)
		if okConf and type(rawConf) == "string" then
			local okDecode, decoded = pcall(function()
				return HttpService:JSONDecode(rawConf)
			end)
			if okDecode and type(decoded) == "table" then
				config = decoded
			end
		elseif okConf and type(rawConf) == "table" then
			config = rawConf
		end
	end

	local player = Players.LocalPlayer

	-- Attende PlotIndex
	local PlotAtt = player:GetAttribute("PlotIndex")
	while IsSessionActive() and PlotAtt == nil do
		PlotAtt = player:GetAttribute("PlotIndex")
		task.wait(0.25)
	end
	if not IsSessionActive() then return end

	local PlotsFolder = workspace:WaitForChild("Plots")
	local PlotRea = PlotsFolder:WaitForChild(tostring(PlotAtt))

	-- ==========================================
	-- RECUPERO DATI E MODULI DALLA GC (SICURO)
	-- ==========================================
	local function FindModulesInGC()
		local mods = {
			DataRef = nil,
			BalanceCurve = nil,
			FoodsConfig = nil,
			StandsConfig = nil,
		}

		if type(getgc) ~= "function" then
			return mods
		end

		for _, v in ipairs(getgc(true)) do
			if not IsSessionActive() then break end
			if type(v) == "table" then
				if not mods.BalanceCurve and type(rawget(v, "GetItemPrice")) == "function" then
					mods.BalanceCurve = v
				end

				if type(rawget(v, "Get")) == "function" and type(rawget(v, "Count")) == "function" then
					if not mods.FoodsConfig then
						mods.FoodsConfig = v
					elseif not mods.StandsConfig and v ~= mods.FoodsConfig then
						mods.StandsConfig = v
					end
				end

				if not mods.DataRef and (rawget(v, "OwnedFoods") ~= nil or (rawget(v, "Money") ~= nil and rawget(v, "Stand") ~= nil)) then
					mods.DataRef = v
				end
			end
		end

		if not mods.DataRef and type(debug) == "table" and type(debug.getinfo) == "function" and type(debug.getupvalue) == "function" then
			for _, obj in ipairs(getgc(false)) do
				if not IsSessionActive() then break end
				if type(obj) == "function" and (not islclosure or islclosure(obj)) then
					local ok, info = pcall(debug.getinfo, obj)
					if ok and info and info.source and (string.find(info.source, "DataController", 1, true) or string.find(info.source, "ReplicaClient", 1, true)) then
						for i = 1, 8 do
							local okUp, name, val = pcall(debug.getupvalue, obj, i)
							if not okUp or name == nil then break end
							if type(val) == "table" then
								if rawget(val, "OwnedFoods") ~= nil or rawget(val, "Money") ~= nil or rawget(val, "Stand") ~= nil then
									mods.DataRef = val
									break
								elseif val.Tags and val.Tags.UserId == player.UserId and type(val.Data) == "table" then
									mods.DataRef = val.Data
									break
								end
							end
						end
					end
				end
				if mods.DataRef then break end
			end
		end

		return mods
	end

	local GCMods = FindModulesInGC()
	if not IsSessionActive() then return end

	local BalanceCurve = GCMods.BalanceCurve
	local FoodsConfig = GCMods.FoodsConfig
	local StandsConfig = GCMods.StandsConfig
	local dataRef = GCMods.DataRef

	local function getByPath(pathStr)
		if type(dataRef) ~= "table" then return nil end
		local curr = dataRef
		for seg in string.gmatch(pathStr, "[^%.]+") do
			if type(curr) ~= "table" then return nil end
			local numKey = tonumber(seg)
			curr = rawget(curr, seg) ~= nil and rawget(curr, seg) or (numKey and rawget(curr, numKey) or curr[seg])
		end
		return curr
	end

	local function GetSafeMoney()
		local gcMoney = tonumber(getByPath("Money"))

		local ls = player:FindFirstChild("leaderstats")
		local m = ls and (ls:FindFirstChild("Money") or ls:FindFirstChild("Cash") or ls:FindFirstChild("Coins"))
		local lsMoney = m and tonumber(m.Value) or nil

		if gcMoney and lsMoney then
			return math.min(gcMoney, lsMoney)
		end
		return gcMoney or lsMoney or 0
	end

	local function GetSafeStand()
		local standVal = getByPath("Stand")
		if type(standVal) == "number" then
			return standVal
		elseif type(standVal) == "table" and standVal.Index then
			return tonumber(standVal.Index)
		end
		return tonumber(standVal) or tonumber(player:GetAttribute("StandIndex") or PlotRea:GetAttribute("StandIndex")) or 1
	end

	local DC = {
		Get = function(_, key)
			if key == "Money" then
				return GetSafeMoney()
			elseif key == "Stand" then
				return GetSafeStand()
			end
			return getByPath(tostring(key))
		end,
		GetPath = function(_, pathStr)
			return getByPath(tostring(pathStr))
		end,
	}

	task.wait(1.5)
	if not IsSessionActive() then return end

	-- ==========================================
	-- REMOTES & HELPERS
	-- ==========================================
	local Remotes = ReplicatedStorage:WaitForChild("Remotes")
	local ThrowStart = Remotes:WaitForChild("Throw_Start")
	local ThrowMeter = Remotes:WaitForChild("Throw_MeterStarted")
	local ThrowResolve = Remotes:WaitForChild("Throw_Resolve")
	local ThrowComplete = Remotes:WaitForChild("Throw_Complete")
	local ThrowPos = CFrame.new(-12, 6, -40)

	local EquipBestR = Remotes:WaitForChild("Plot_EquipBest")

	local TrainStart = Remotes:WaitForChild("Training_Start")
	local TrainStop = Remotes:WaitForChild("Training_Stop")
	local BonusTap = Remotes:WaitForChild("Training_TapBonus")
	local TrainBonus = Remotes:WaitForChild("Training_Bonus")

	local StandUpgrade = Remotes:FindFirstChild("Stand_Upgrade")
	local ShopBuy = Remotes:FindFirstChild("Shop_Buy")

	local State = {
		AutoThrow = config.AutoThrow or false,
		AutoEquipBest = config.AutoEquipBest or false,
		AutoTrain = config.AutoTrain or false,
		AutoBuyFood = config.AutoBuyFood or false,
		AutoBuyStand = config.AutoBuyStand or false,
	}

	local function Get(what)
		return DC:Get(what)
	end

	local function GetPath(p)
		return DC:GetPath(p)
	end

	local function CountFoods()
		if FoodsConfig and type(FoodsConfig.Count) == "function" then
			local ok, c = pcall(FoodsConfig.Count)
			if ok and type(c) == "number" then return c end
		end
		return 0
	end

	local function GetF(what)
		if FoodsConfig and type(FoodsConfig.Get) == "function" then
			local ok, f = pcall(FoodsConfig.Get, what)
			if ok then return f end
		end
		return nil
	end

	local function GetS(what)
		if StandsConfig and type(StandsConfig.Get) == "function" then
			local ok, s = pcall(StandsConfig.Get, what)
			if ok then return s end
		end
		return nil
	end

	local function GetValidPrice(itemOrStand)
		if itemOrStand == nil then return nil end

		if BalanceCurve and type(BalanceCurve.GetItemPrice) == "function" then
			local ok, res = pcall(BalanceCurve.GetItemPrice, player, itemOrStand)
			if ok and type(res) == "number" and res > 0 then
				return res
			end
		end

		if type(itemOrStand) == "table" then
			local raw = tonumber(itemOrStand.Price or itemOrStand.Cost or itemOrStand.BasePrice)
			if raw and raw > 0 then
				return raw
			end
		end

		return nil
	end

	local function GetNextStand()
		local current = Get("Stand")
		local standData = GetS(current)
		if type(standData) == "number" then
			return standData + 1
		elseif type(standData) == "table" and standData.Index then
			return tonumber(standData.Index) and (tonumber(standData.Index) + 1) or nil
		end
		local num = tonumber(current)
		return num and (num + 1) or nil
	end

	local function GetCharacter()
		return player.Character or player.CharacterAdded:Wait()
	end

	local function TpChar(pos)
		if not IsSessionActive() then return end
		local char = GetCharacter()
		local hr = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart", 5)
		if hr and (hr.Position - pos.Position).Magnitude > 4 then
			hr.CFrame = pos
		end
	end

	-- ==========================================
	-- AZIONI
	-- ==========================================
	TrainBonus.OnClientEvent:Connect(function(this, _that)
		if not IsSessionActive() or not State.AutoTrain then return end
		pcall(function()
			BonusTap:InvokeServer(this)
		end)
	end)

	local function DoThrow()
		if not IsSessionActive() or not State.AutoThrow then return end
		TpChar(ThrowPos)
		task.wait(0.6)
		if not IsSessionActive() or not State.AutoThrow then return end
		pcall(function() ThrowStart:InvokeServer() end)
		task.wait(0.1)
		pcall(function() ThrowMeter:FireServer() end)
		task.wait(0.1)
		pcall(function() ThrowResolve:InvokeServer() end)
		task.wait(0.1)
		pcall(function() ThrowComplete:InvokeServer() end)
	end

	local function DoEquipBest()
		if not IsSessionActive() or not State.AutoEquipBest then return end
		pcall(function()
			EquipBestR:InvokeServer()
		end)
	end

	local function DoTrain()
		if not IsSessionActive() or not State.AutoTrain then return end
		local serverFolder = PlotRea:FindFirstChild("Server")
		local pullUp = serverFolder and serverFolder:FindFirstChild("PullUpStand")
		if pullUp then
			TpChar(pullUp:GetPivot())
			task.wait(0.4)
		end
		if not IsSessionActive() or not State.AutoTrain then return end

		pcall(function() TrainStart:InvokeServer() end)
		for _ = 1, 30 do
			if not IsSessionActive() or not State.AutoTrain then return end
			task.wait(1)
		end

		if IsSessionActive() and State.AutoTrain then
			pcall(function() TrainStop:InvokeServer() end)
		end
	end

	local function DoAutoBuyBestFood()
		if not IsSessionActive() or not State.AutoBuyFood then return end
		if not ShopBuy then return end

		local total = CountFoods()
		if total <= 0 then return end

		local money = GetSafeMoney()
		if money <= 0 then return end

		local best = 0
		for i = 1, total do
			if GetPath("OwnedFoods." .. i) == true then
				best = i
			end
		end

		local food, foodprice
		for i = total, best + 1, -1 do
			if not IsSessionActive() or not State.AutoBuyFood then break end
			local f = GetF(i)
			local p = GetValidPrice(f)
			if p and p > 0 and p <= money then
				food, foodprice = f, p
				break
			end
		end

		if food and foodprice and money >= foodprice then
			local arg = (type(food) == "table" and (food.Index or food.Id or food.Key))
			if arg ~= nil then
				pcall(function()
					if ShopBuy:IsA("RemoteFunction") then
						ShopBuy:InvokeServer(arg)
					else
						ShopBuy:FireServer(arg)
					end
				end)
			end
		end
	end

	local function DoAutoBuyBestStand()
		if not IsSessionActive() or not State.AutoBuyStand then return end
		if not StandUpgrade then return end

		local money = GetSafeMoney()
		if money <= 0 then return end

		local nextStand = GetNextStand()
		if not nextStand then return end

		local standData = GetS(nextStand)
		local price = GetValidPrice(standData)
		if price and money >= price then
			pcall(function()
				if StandUpgrade:IsA("RemoteFunction") then
					StandUpgrade:InvokeServer(nextStand)
				else
					StandUpgrade:FireServer(nextStand)
				end
			end)
		end
	end

	-- ==========================================
	-- REGISTRAZIONE TOGGLE NELL'HUB
	-- ==========================================
	if selfMod and type(selfMod.AddTG) == "function" then
		selfMod:AddTG(TS, "Auto Throw", State.AutoThrow, function(v)
			State.AutoThrow = v
			while IsSessionActive() and State.AutoThrow do
				DoThrow()
				task.wait(0.8)
			end
		end)

		selfMod:AddTG(TS, "Auto Equip Best", State.AutoEquipBest, function(v)
			State.AutoEquipBest = v
			while IsSessionActive() and State.AutoEquipBest do
				DoEquipBest()
				task.wait(4)
			end
		end)

		selfMod:AddTG(TS, "Auto Train", State.AutoTrain, function(v)
			State.AutoTrain = v
			while IsSessionActive() and State.AutoTrain do
				DoTrain()
				task.wait(0.8)
			end
		end)

		selfMod:AddTG(TS, "Auto Buy Best Food", State.AutoBuyFood, function(v)
			State.AutoBuyFood = v
			while IsSessionActive() and State.AutoBuyFood do
				DoAutoBuyBestFood()
				task.wait(3)
			end
		end)

		selfMod:AddTG(TS, "Auto Buy Best Stand", State.AutoBuyStand, function(v)
			State.AutoBuyStand = v
			while IsSessionActive() and State.AutoBuyStand do
				DoAutoBuyBestStand()
				task.wait(3)
			end
		end)
	end
end