-- Break Eggs For Brainrots

return function(M, T, IT)
    print([[local env = getgenv()
    local selfMod = M
    local TS = T
    local successConf, enconfig = pcall(function()
        return IT.LoadConfig()
    end)

	local config = pcall(function()
        game:GetService("HttpService"):JSONDecode(enconfig)
    end)

    local player = game.Players.LocalPlayer
    local id = player.UserId
    local HammerFPN = tostring(id)..":"
    local takepos = CFrame.new(8, 2, -83)

    local function FindHammer(pos)
        for _,ch in pairs(pos:GetChildren()) do
            if ch:IsA("Tool") and string.find(ch.Name, HammerFPN, 1, true) then
			   return ch
		    end
        end
    end

    env.AutoHit = false
    env.AutoIstantBrainrotPrompt = false
    env.AutoPickUp = false

    local AutoHit = env.AutoHit or false
    local AutoIstantBrainrotPrompt = env.AutoIstantBrainrotPrompt or false
    local AutoPickUp = env.AutoPickUp or false

    if successConf and config then
        AutoHit = config.AutoHit
        AutoIstantBrainrotPrompt = config.AutoIstantBrainrotPrompt
        AutoPickUp = config.AutoPickUp
    end

    selfMod:AddTG(TS, "Auto Hit Eggs", AutoHit, function(v)
        AutoHit = v

        while AutoHit do
            local ham = FindHammer(player.Backpack) or FindHammer(player.Character)
            ham:Activate()
            task.wait(0.5)
        end
    end)]])
    local env = getgenv()
    local selfMod = M
    local TS = T
    local successConf, enconfig = pcall(function()
        return IT.LoadConfig()
    end)

	local config = pcall(function()
        game:GetService("HttpService"):JSONDecode(enconfig)
    end)

    local player = game.Players.LocalPlayer
    local id = player.UserId
    local HammerFPN = tostring(id)..":"
    local takepos = CFrame.new(8, 2, -83)

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
        PickingUp = not PickingUp

        local root = char.HumanoidRootPart
        root.CFrame = root.CFrame + CFrame.new(0,5.5,0)

        while PickingUp do
            CreateLegPart()
            hum:MoveTo(takepos)
            hum.MoveToFinished:Wait()
            PickingUp = not PickingUp
            task.wait()
        end

        DestroyLegParts()
    end)
end