local function ensureFolder(path)
    if not isfolder(path) then
        makefolder(path)
    end
end

local function SaveConfig(placeId, savedata)
    local folderPath = "CheaterHub/" .. tostring(placeId)
    ensureFolder(folderPath)
    writefile(folderPath .. "/Config.json", game:GetService("HttpService"):JSONEncode(savedata))
end

local function GetGameName(id)
   local MarketplaceService = game:GetService("MarketplaceService")
	
   local info = MarketplaceService:GetProductInfo(id)

   return info.Name
end

local Games = {
	["Lucky Block Rush"] = {
		Name = GetGameName(84575720768520),
		Id = 84575720768520,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling
			local env = getgenv()
			local readsuccess, read = pcall(function()
				return readfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end)

			local Connections = {}

-- Aggiunge una connessione alla lista (es. Heartbeat, ChildAdded, ecc.)
local function AddConnection(conn)
    table.insert(Connections, conn)
end

-- Disconnette tutte le connessioni salvate e svuota la tabella
local function DisconnectConnections()
    for i, conn in ipairs(Connections) do
        if conn then
            pcall(function()
                conn:Disconnect()
            end)
        end
    end
    -- Svuota la tabella per ricominciare da zero
    Connections = {}
end


			--// Services
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local GuiService = game:GetService("GuiService")
            local VirtualInputManager = game:GetService("VirtualInputManager")

            --// Player
            local LocalPlayer = Players.LocalPlayer
            local player = LocalPlayer
            local PlayerGui = player:WaitForChild("PlayerGui")

            --// Workspace
            local BossesFolder = workspace:WaitForChild("Bosses")
            local Plots = workspace:WaitForChild("Plots")

			local TVM = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter-coder/Infinite-Health-Script/refs/heads/main/parseNumber%40StringsModule.lua", true))()

			env[tostring(game.PlaceId)].FakeStrength = env[tostring(game.PlaceId)].FakeStrength or false
			env[tostring(game.PlaceId)].FakeMoney = env[tostring(game.PlaceId)].FakeMoney or false
			env[tostring(game.PlaceId)].ClickX2Speed = env[tostring(game.PlaceId)].ClickX2Speed or false
			env[tostring(game.PlaceId)].LastHealth = env[tostring(game.PlaceId)].LastHealth or 0
			env[tostring(game.PlaceId)].SettedLastHealth = env[tostring(game.PlaceId)].SettedLastHealth or false
				env[tostring(game.PlaceId)].Invincible = env[tostring(game.PlaceId)].Invincible or false

			local FakeStrength = env[tostring(game.PlaceId)].FakeStrength or false
            local FakeMoney = env[tostring(game.PlaceId)].FakeMoney or false
            local ClickX2Speed = env[tostring(game.PlaceId)].ClickX2Speed or false
            local LastHealth = env[tostring(game.PlaceId)].LastHealth or 0
            local SettedLastHealth = env[tostring(game.PlaceId)].SettedLastHealth or false
			local Invincible = env[tostring(game.PlaceId)].Invincible or false

			if readsuccess then
				local data = game:GetService("HttpService"):JSONDecode(read)

				FakeStrength = data.FakeStrength
			    FakeMoney = data.FakeMoney
				ClickX2Speed = data.ClickX2Speed
				LastHealth = data.LastHealth
				SettedLastHealth = data.SettedLastHealth
				Invincible = data.Invincible

				delfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end

local function Do(func)
	return func()
end

local function GetUi(uiName)
	return Do(function()
		return PlayerGui:WaitForChild(uiName)
	end)
end

---------------------------------------------------
-- FAKE STATS
---------------------------------------------------
local function SetFakeStrength(label, label2, set)
	local value = tostring(set)

	label.Text = value
	label2.Text = value

	local parsed = TVM:GetStringInNumberUnits(set)
	if parsed then
		player.leaderstats.Cash.Value = parsed
	end
end

local function SetFakeMoney(label, label2, set)
	local value = tostring(set)

	label.Text = value
	label2.Text = value

	local parsed = TVM:GetStringInNumberUnits(set)
	if parsed then
		player.leaderstats.Cash.Value = parsed
	end
end

local function SetFakeBaseMoney(base)
	local obj = base:FindFirstChild(player.Name .. "_FloatingPlotSign")
	if obj and obj:FindFirstChild("Cash") then
		obj.Cash.Text = FakeBaseMoneyValue.."/s"
	end
end

			local SpeedUi = GetUi("SpeedEffect")
local HUD = GetUi("HUD")
local BackpackGUI = GetUi("BackpackGui")

local X2Speed = SpeedUi:WaitForChild("LeftContainer")
	:WaitForChild("Currency")
	:WaitForChild("Speed")
	:WaitForChild("x2Speed")

local StrengthLabel = HUD:WaitForChild("LeftContainer")
	:WaitForChild("Currency")
	:WaitForChild("Speed")
	:WaitForChild("Speed")
	:WaitForChild("SpeedLabel")

local CashLabel = HUD:WaitForChild("LeftContainer")
	:WaitForChild("Currency")
	:WaitForChild("Currency")
	:WaitForChild("Cash")
	:WaitForChild("Cash")

local EquipBestBrainrotBtn = BackpackGUI:WaitForChild("Backpack")
    :WaitForChild("Inventory")
	:WaitForChild("BackpackButtonsContainer")
	:WaitForChild("EquipBestBrainrot")

local SellBtn = HUD:WaitForChild("TeleportsContainer")
    :WaitForChild("Sell")
					
selfMod:AddBTN(TS, "SetFakeMoney(Local)", function()
					FakeMoney = not FakeMoney
		            SetFakeMoney(CashLabel, CashLabel.Cash, "inf$")
					SaveConfig(game.PlaceId, {FakeStrength = FakeStrength, FakeMoney = FakeMoney, ClickX2Speed = ClickX2Speed, LastHealth = LastHealth, SettedLastHealth = SettedLastHealth, Invincible = Invincible})
				end)

selfMod:AddBTN(TS, "SetFakeStrength(Local)", function()
					FakeStrength = not FakeStrength
		            SetFakeStrength(StrengthLabel, StrengthLabel.Speed, "inf Strength")
					SaveConfig(game.PlaceId, {FakeStrength = FakeStrength, FakeMoney = FakeMoney, ClickX2Speed = ClickX2Speed, LastHealth = LastHealth, SettedLastHealth = SettedLastHealth, Invincible = Invincible})
				end)

			local x2Connection
            local RunSx2

selfMod:AddTG(TS, "Click x2Speed Visibility", ClickX2Speed, function(v)
					ClickX2Speed = v
					SaveConfig(game.PlaceId, {FakeStrength = FakeStrength, FakeMoney = FakeMoney, ClickX2Speed = ClickX2Speed, LastHealth = LastHealth, SettedLastHealth = SettedLastHealth, Invincible = Invincible})

	if v then
		if x2Connection then
			x2Connection:Disconnect()
			x2Connection = nil
		end

		RunSx2 = RunService.Heartbeat:Connect(function()
		   if X2Speed.Visible then
		    local pos = X2Speed.AbsolutePosition
			local size = X2Speed.AbsoluteSize
			local inset = GuiService:GetGuiInset()
				
			local centerX = pos.X + (size.X / 2) + inset.X
			local centerY = pos.Y + (size.Y / 2) + inset.Y
				
			-- Emulazione movimento e click
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
			task.wait(0.1)
			VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
		   end
		end)
		AddConnection(RunSx2)

		x2Connection = X2Speed:GetPropertyChangedSignal("Visible"):Connect(function()
			if not ClickX2Speed then return end

			if X2Speed.Visible then
				-- Calcolo posizione centrale dell'elemento
				local pos = X2Speed.AbsolutePosition
				local size = X2Speed.AbsoluteSize
				local inset = GuiService:GetGuiInset()
				
				local centerX = pos.X + (size.X / 2) + inset.X
				local centerY = pos.Y + (size.Y / 2) + inset.Y
				
				-- Emulazione movimento e click
				VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
				task.wait(0.1)
				VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
			end
		end)
		AddConnection(x2Connection)
	else
		if x2Connection then
			x2Connection:Disconnect()
			x2Connection = nil
		end
		if RunSx2 then
		   RunSx2:Disconnect()
		   RunSx2 = nil
		end
	end
			end)

			local BossesConn
            local HealthConn

selfMod:AddTG(TS, "InvincibleWithBosses", Invincible, function(v)
					Invincible = v
					SaveConfig(game.PlaceId, {FakeStrength = FakeStrength, FakeMoney = FakeMoney, ClickX2Speed = ClickX2Speed, LastHealth = LastHealth, SettedLastHealth = SettedLastHealth, Invincible = Invincible})
				if v == true then
      BossesConn = BossesFolder.ChildAdded:Connect(function(child)
	     local PrimaryPart = child.PrimaryPart
	     for _,part in pairs(child:GetDescendants()) do
		    if part:IsA("BasePart") then
			   local partCFrame = part.CFrame
			   part.Anchored = true
			   part.CFrame = partCFrame
			end
		 end

		 player.Character.HumanoidRootPart.CFrame = PrimaryPart.CFrame
	  end)

	AddConnection(BossesConn)
	  
	HealthConn = RunService.Heartbeat:Connect(function()
	   local char = player.Character
	   if not char then return end

	   local hum = char:FindFirstChildOfClass("Humanoid")
	   if not hum then return end

	   if not SettedLastHealth then
	      SettedLastHealth = true
		  LastHealth = hum.Health
	   end

	   hum.MaxHealth = math.huge
	   hum.Health = math.huge
     end)
   else
      if BossesConn then
	     BossesConn:Disconnect()
		 BossesConn = nil
	  end
	  
	  if HealthConn then
	     HealthConn:Disconnect()
		 HealthConn = nil
		 SettedLastHealth = false
	     local char = player.Character
	     if not char then return end

	     local hum = char:FindFirstChildOfClass("Humanoid")
	     if not hum then return end

	     hum.MaxHealth = LastHealth
	     hum.Health = LastHealth
	  end
   end
			end)

			AddConnection(HealthConn)


		end
	},
	["Be An Admin"] = {
		Name = "Be An Admin",
		Id = 79462658240386,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling
			local env = getgenv()
			local readsuccess, read = pcall(function()
				return readfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end)

			local Connections = {}

-- Aggiunge una connessione alla lista (es. Heartbeat, ChildAdded, ecc.)
local function AddConnection(conn)
    table.insert(Connections, conn)
end

-- Disconnette tutte le connessioni salvate e svuota la tabella
local function DisconnectConnections()
    for i, conn in ipairs(Connections) do
        if conn then
            pcall(function()
                conn:Disconnect()
            end)
        end
    end
    -- Svuota la tabella per ricominciare da zero
    Connections = {}
end


			local Bases = workspace:WaitForChild("Bases")
			local AdminBase = Bases:WaitForChild("Admin")
			local ClaimPart = AdminBase.Claim.Touch

			local RunService = game:GetService("RunService")

				env[tostring(game.PlaceId)].AutoAdmin = env[tostring(game.PlaceId)].AutoAdmin or false

			local AutoAdmin = env[tostring(game.PlaceId)].AutoAdmin or false

			if readsuccess then
				local data = game:GetService("HttpService"):JSONDecode(read)

				AutoAdmin = data.AutoAdmin

			   delfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end

			local AdminConnection

selfMod:AddTG(TS, "Auto Admin", AutoAdmin, function(v)
					AutoAdmin = v
					env.AutoAdmin = v
					SaveConfig(game.PlaceId, {AutoAdmin = AutoAdmin})
				if AutoAdmin == true then
					AdminConnection = RunService.Heartbeat:Connect(function()
						local char = game.Players.LocalPlayer.Character
						local root = char.HumanoidRootPart

						root.CFrame = ClaimPart.CFrame
					end)
					AddConnection(AdminConnection)
				end
				if AutoAdmin == false then
					if AdminConnection then
						AdminConnection:Disconnect()
					end
				end
			end)


	    end
	},
	["Pilfering Pirates"] = {
		Name = GetGameName(6104994594),
		Id = 6104994594,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling
			local env = getgenv()

			local function TeleportSquad(squad)
				local Squads = workspace.ActiveMapFolder.Map.Ships
				local squad = Squads:WaitForChild(squad)
				if squad then
					local Spawns = squad.Spawns
					local Child = Spawns:GetChildren()
					local CasualSpawn = Child[math.random(1, #Child)]
					local char = game.Players.LocalPlayer.Character
					local root = char.HumanoidRootPart

					root.CFrame = CasualSpawn.CFrame
				end
			end

			selfMod:AddBTN(TS, "Teleport Green", function()
				TeleportSquad("Green")
			end)

			selfMod:AddBTN(TS, "Teleport Yellow", function()
				TeleportSquad("Yellow")
			end)

			selfMod:AddBTN(TS, "Teleport Red", function()
				TeleportSquad("Red")
			end)

			selfMod:AddBTN(TS, "Teleport Blue", function()
				TeleportSquad("Blue")
			end)

			selfMod:AddBTN(TS, "Teleport Orange", function()
				TeleportSquad("Orange")
			end)

			selfMod:AddBTN(TS, "Teleport Purple", function()
				TeleportSquad("Purple")
			end)
		end
	},
	["Become a Brainrot"] = {
		Name = GetGameName(99255447043899),
		Id = 99255447043899,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling
			local env = getgenv()
			local readsuccess, read = pcall(function()
				return readfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end)
						local Connections = {}

-- Aggiunge una connessione alla lista (es. Heartbeat, ChildAdded, ecc.)
local function AddConnection(conn)
    table.insert(Connections, conn)
end

-- Disconnette tutte le connessioni salvate e svuota la tabella
local function DisconnectConnections()
    for i, conn in ipairs(Connections) do
        if conn then
            pcall(function()
                conn:Disconnect()
            end)
        end
    end
    -- Svuota la tabella per ricominciare da zero
    Connections = {}
end

			local StartPos = CFrame.new(131, 3, -39)
			local EndPart = workspace.Locations.End.SpawnPosition
			local VeryStartPos = CFrame.new(48, 3, 3)
			local EndBase = workspace.Locations.End
			local EndBrainrots = EndBase.Brainrots
			local EndSpawnPoint = EndBase.SpawnPosition
			local RunService = game:GetService("RunService")

			env[tostring(game.PlaceId)].AutoPlayAndTP = false
				env[tostring(game.PlaceId)].AutoCollect = false

			local AutoPlayAndTP = env[tostring(game.PlaceId)].AutoPlayAndTP or false
			local AutoPlayConn
			local AlrAutoPlaying = false
			local AutoCollect = env[tostring(game.PlaceId)].AutoCollect or false
			local AutoConn
			local AlrAutoCollect = false

			if readsuccess then
				local data = game:GetService("HttpService"):JSONDecode(read)

				AutoPlayAndTP = data.AutoPlayAndTP
				AutoCollect = data.AutoCollect

				delfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end

selfMod:AddTG(TS, "Auto Play and Teleport End", AutoPlayAndTP, function(v)
					AutoPlayAndTP = v
					SaveConfig(game.PlaceId, {AutoPlayAndTP = AutoPlayAndTP, AutoCollect = AutoCollect})
				if v == true then
					AutoPlayConn = RunService.Heartbeat:Connect(function()
						if AlrAutoPlaying == true then return end
						AlrAutoPlaying = true

						local char = game.Players.LocalPlayer.Character
						local root = char.HumanoidRootPart

						root.CFrame = StartPos
						task.wait(0.5)
						root.CFrame = EndSpawnPoint.CFrame
						task.wait(5.5)
						local brainrots = EndBrainrots:GetChildren()
						local success, casual = pcall(function()
							return brainrots[math.random(1, #brainrots)]
						end)
						if success and casual then
						local casualroot = casual.PrimaryPart
						local prox = casualroot:FindFirstChildOfClass("ProximityPrompt")

						if prox then
							root.CFrame = casualroot.CFrame
							task.wait(0.5)
							prox.HoldDuration = 0
							fireproximityprompt(prox)
							task.wait(0.5)
							root.CFrame = VeryStartPos
						end
						end

						AlrAutoPlaying = false
					end)
					AddConnection(AutoPlayConn)
				end
				if v == false then
					if AutoPlayConn then
						AutoPlayConn:Disconnect()
						AutoPlayConn = nil
					end
				end
			end)

selfMod:AddTG(TS, "Auto Collect Money", AutoCollect, function(v)
					AutoCollect = v
					SaveConfig(game.PlaceId, {AutoPlayAndTP = AutoPlayAndTP, AutoCollect = AutoCollect})
				if v == true then
					AutoConn = RunService.Heartbeat:Connect(function()
						if AlrAutoCollect == true then return end
						AlrAutoCollect = false
						local plr = game.Players.LocalPlayer
						local base = workspace.Plots:FindFirstChild(plr.Name)
						local Slots = base.AnimalStands
						for _,slot in pairs(Slots:GetChildren()) do
							local Collect = slot.Collect
							local Main = Collect.Main
							local TouchInterest = Main.TouchInterest
							firetouchinterest(plr.Character.Head, Main, 0)
							task.wait(0.5)
							firetouchinterest(plr.Character.Head, Main, 1)
						end
						AlrAutoCollect = false
					end)
					AddConnection(AutoConn)
			    end
				if v == false then
					if AutoConn then
						AutoConn:Disconnect()
						AutoConn = nil
					end
				end
			end)


		end
	},
	["Kick a Lucky Block"] = {
		Name = GetGameName(89469502395769),
		Id = 89469502395769,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling
			local env = getgenv()
			local RunService = game:GetService("RunService")
			local readsuccess, read = pcall(function()
				return readfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end)

									local Connections = {}

-- Aggiunge una connessione alla lista (es. Heartbeat, ChildAdded, ecc.)
local function AddConnection(conn)
    table.insert(Connections, conn)
end

-- Disconnette tutte le connessioni salvate e svuota la tabella
local function DisconnectConnections()
    for i, conn in ipairs(Connections) do
        if conn then
            pcall(function()
                conn:Disconnect()
            end)
        end
    end
    -- Svuota la tabella per ricominciare da zero
    Connections = {}
end

			local plr = game.Players.LocalPlayer
			local base

			env[tostring(game.PlaceId)].AutoCollect = false

			local AutoCollect = env[tostring(game.PlaceId)].AutoCollect or false
			local AutoConn
			local AlrAutoCollect = false

			if readsuccess then
				local data = game:GetService("HttpService"):JSONDecode(read)

				AutoCollect = data.AutoCollect

				delfile("CheaterHub/"..tostring(game.PlaceId).."/Config.json")
			end

			for _,plot in pairs(workspace.Plots:GetChildren()) do
				if plot:GetAttribute("Owner") == plr.Name then
					base = plot
					break
				end
			end

			selfMod:AddTG(TS, "Auto Collect", AutoCollect, function(v)
				AutoCollect = v
				SaveConfig(game.PlaceId, {AutoCollect = AutoCollect})
				if v == true then
					AutoConn = RunService.Heartbeat:Connect(function()
						local Slots = base.Buttons
						local char = plr.Character
						for _,slot in pairs(Slots:GetChildren()) do
							local TouchInterest = slot.TouchInterest
							firetouchinterest(char.Head, slot, 0)
							task.wait(0.5)
							firetouchinterest(char.Head, slot, 1)
						end
					end)
					AddConnection(AutoConn)
				end
				if v == false then
					if AutoConn then
						AutoConn:Disconnect()
						AutoConn = nil
					end
				end
			end)
		end
	}
}

function Games:GetGame(name)
	return Games[name] or nil
end

return Games
