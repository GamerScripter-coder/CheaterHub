return {
	["Lucky Block Rush"] = {
		Name = "Lucky Block Rush",
		Id = 84575720768520,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling
			local env = getgenv()

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

			env.FakeStrength = false
			env.FakeMoney = false
			env.ClickX2Speed = false
			env.LastHealth = 0
			env.SettedLastHealth = false
			env.Invincible = false

			local FakeStrength = env.FakeStrength or false
            local FakeMoney = env.FakeMoney or false
            local ClickX2Speed = env.ClickX2Speed or false
            local LastHealth = env.LastHealth or 0
            local SettedLastHealth = env.SettedLastHealth or false
			local Invincible = env.Invincible or false

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
			end)

			selfMod:AddBTN(TS, "SetFakeStrength(Local)", function()
				FakeStrength = not FakeStrength
	            SetFakeStrength(StrengthLabel, StrengthLabel.Speed, "inf Strength")
			end)

			local x2Connection
            local RunSx2

			selfMod:AddTG(TS, "Click x2Speed Visibility", env.ClickX2Speed, function(v)
				ClickX2Speed = v

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

			selfMod:AddTG(TS, "InvincibleWithBosses", env.Invincible, function(v)
				Invincible = v
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
		end
	},
	["RIVALS"] = {
		Name = "RIVALS",
		Id = 17625359962,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling
			local env = getgenv()

			local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local UserInputService = game:GetService("UserInputService")

            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera

			env.Following = false

            local Following = env.Following or false
            local Connection = nil

            local CurrentHighlight = nil
            local CurrentTarget = nil

local function GetClosestPlayer()
	local closest = nil
	local shortestDist = math.huge

	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then
		return nil
	end

	local myPos = myChar.HumanoidRootPart.Position

	for _, plr in pairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") then
			local head = plr.Character.Head
			local dist = (head.Position - myPos).Magnitude

			if dist < shortestDist then
				shortestDist = dist
				closest = plr
			end
		end
	end

	return closest
end

			local function ClearHighlight()
	if CurrentHighlight then
		CurrentHighlight:Destroy()
		CurrentHighlight = nil
	end
	CurrentTarget = nil
end

local function SetHighlight(character)
	if not character then return end

	ClearHighlight()

	local highlight = Instance.new("Highlight")
	highlight.FillColor = Color3.fromRGB(255, 0, 0)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.5
	highlight.OutlineTransparency = 0
	highlight.Adornee = character
	highlight.Parent = character

	CurrentHighlight = highlight
end

local function StartFollow()
	if Connection then Connection:Disconnect() end

	Connection = RunService.RenderStepped:Connect(function()
		local target = GetClosestPlayer()

		if not target or not target.Character then return end

		local head = target.Character:FindFirstChild("Head")
		local myChar = LocalPlayer.Character

		if not head or not myChar then return end

		local root = myChar:FindFirstChild("HumanoidRootPart")
		if not root then return end

		-- aggiorna highlight solo se cambia target
		if CurrentTarget ~= target then
			CurrentTarget = target
			SetHighlight(target.Character)
		end

		-- camera segue testa
		Camera.CameraType = Enum.CameraType.Scriptable
		Camera.CFrame = CFrame.new(Camera.CFrame.Position, head.Position)

		-- personaggio guarda testa
		local lookPos = Vector3.new(head.Position.X, root.Position.Y, head.Position.Z)
		root.CFrame = CFrame.lookAt(root.Position, lookPos)
	end)
end

local function StopFollow()
	if Connection then
		Connection:Disconnect()
		Connection = nil
	end

	Camera.CameraType = Enum.CameraType.Custom
	ClearHighlight()
end

local function ToggleFollow()
	Following = not Following

	if Following then
		StartFollow()
	else
		StopFollow()
	end
end

		selfMod:AddTG(TS, "Follow neareast Head(L)", false, function(v)
			ToggleFollow()
		end)

		selfMod:AddKeybind(Enum.KeyCode.L, function()
			ToggleFollow()
		end)
		end)
	}
}
