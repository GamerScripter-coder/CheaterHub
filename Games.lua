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
			
	}
}
