-- Break Eggs For Brainrots

return function(M, T, IT)
    local env = getgenv()
    local selfMod = M
    local TS = T
    local successConf, enconfig = pcall(function()
        return IT.LoadConfig()
    end)

	local config = pcall(function()
        return game:GetService("HttpService"):JSONDecode(enconfig)
    end)

    local player = game.Players.LocalPlayer
    local id = player.UserId
    local UIS = game:GetService("UserInputService")
    local HammerFPN = tostring(id)..":"
    local takepos = CFrame.new(8, 2, -83)
    local invId = "i2"
    local medId = "i5"
    local balId = "i23"
    local swaId = "i6"
    local bazId = "i14"
    local batId = "i10"
    local velId = "i4"

    local function AddKeyFunc(KE, func)
        UIS.InputBegan:Connect(function(inp, GPE)
            if GPE then return end

            if inp == KE then
                func()
            end
        end)
    end

    local function FindTool(pos, PON)
        for _,ch in pairs(pos:GetChildren()) do
            if ch:IsA("Tool") and string.find(ch.Name, PON, 1, true) then
			   return ch
		    end
        end
    end

    local function FindHammer(pos)
        for _,ch in pairs(pos:GetChildren()) do
            if ch:IsA("Tool") and string.find(ch.Name, HammerFPN, 1, true) then
			   return ch
		    end
        end
    end

    local function GetHumanoid()
        return player.Character.Humanoid
    end

    local function CreateLegPart()
        local char = player.Character
        local root = char.HumanoidRootPart

        local PartFolder = workspace:FindFirstChild("LegFolder") or Instance.new("Folder")
        PartFolder.Name = "LegFolder"

        local part = Instance.new("Part")
        part.Name = "LegPart"
        part.Anchored = true
        part.CFrame = root.CFrame - CFrame.new(0, 2.5, 0)
        part.Parent = PartFolder
    end

    local function DestroyLegParts()
        for _,part in pairs(workspace:FindFirstChild("LegFolder"):GetChildren()) do
            part:Destroy()
        end
    end

    local function EquipWithFind(PON)
        local hum = GetHumanoid()

        local pos1 = player.Backpack
        local pos2 = player.Character
        hum:EquipTool(FindTool(pos1, PON))
        hum:EquipTool(FindTool(pos2, PON))
    end

    env.AutoHit = false
    env.AutoIstantBrainrotPrompt = false

    local AutoHit = env.AutoHit or false
    local AutoIstantBrainrotPrompt = env.AutoIstantBrainrotPrompt or false
    local PickingUp = false

    if successConf and config then
        AutoHit = config.AutoHit
        AutoIstantBrainrotPrompt = config.AutoIstantBrainrotPrompt
    end

    selfMod:AddTG(TS, "Auto Hit Eggs", AutoHit, function(v)
        AutoHit = v

        while AutoHit do
            local ham = FindHammer(player.Backpack) or FindHammer(player.Character)
            ham:Activate()
            task.wait(0.5)
        end
    end)

    selfMod:AddBTN(TS, "PickUp", function()
        local hum = GetHumanoid()
        local char = hum.Parent
        if not hum or char then return end
        PickingUp = true

        local root = char.HumanoidRootPart
        root.CFrame = root.CFrame + CFrame.new(0,5.5,0)

        while PickingUp do
            CreateLegPart()
            hum:MoveTo(takepos)
            hum.MoveToFinished:Wait()
            PickingUp = false
            task.wait()
        end

        DestroyLegParts()
    end)

    selfMod:AddBTN(TS, "Equip Invisible[Z]", function()
        EquipWithFind(invId)
    end)

    selfMod:AddBTN(TS, "Equip Medusa[X]", function()
        EquipWithFind(medId)
    end)

    selfMod:AddBTN(TS, "Equip Baloon[C]", function()
        EquipWithFind(balId)
    end)

    selfMod:AddBTN(TS, "Equip Body Swap[V]", function()
        EquipWithFind(swaId)
    end)

    selfMod:AddBTN(TS, "Equip Bazooka[B]", function()
        EquipWithFind(bazId)
    end)

    selfMod:AddBTN(TS, "Equip Speed Coil[N]", function()
        EquipWithFind(velId)
    end)

    AddKeyFunc(Enum.KeyCode.Z, function()
        EquipWithFind(invId)
    end)

    AddKeyFunc(Enum.KeyCode.X, function()
        EquipWithFind(medId)
    end)

    AddKeyFunc(Enum.KeyCode.C, function()
        EquipWithFind(balId)
    end)

    AddKeyFunc(Enum.KeyCode.V, function()
        EquipWithFind(swaId)
    end)

    AddKeyFunc(Enum.KeyCode.B, function()
        EquipWithFind(bazId)
    end)

    AddKeyFunc(Enum.KeyCode.N, function()
        EquipWithFind(velId)
    end)
end