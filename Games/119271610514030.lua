-- Break Eggs For Brainrots

return function(M, T, IT)
    print([[local env = getgenv()
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
    local tools = {
        Inv = nil,
        Med = nil,
        Bal = nil,
        Swa = nil,
        Baz = nil,
        Bat = nil,
        Vel = nil
    }

    local function AddKeyFunc(KE, func)
        UIS.InputBegan:Connect(function(ck, GPE)
            if GPE then return end
            local inp = ck.KeyCode

            if inp == KE then
                func()
            end
        end)
    end

    local function FindTool(pos, PON, name)
    if tools[name] and tools[name].Parent then
        return tools[name]
    end

    local prefix = PON .. ":"

    for _, ch in ipairs(pos:GetChildren()) do
        if ch:IsA("Tool") and ch.Name:sub(1, #prefix) == prefix then
             tools[name] = ch
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

    local function EquipWithFind(PON, name)
        local hum = GetHumanoid()

        local pos1 = player.Backpack
        local pos2 = player.Character
        hum:EquipTool(FindTool(pos1, PON, name))
        hum:EquipTool(FindTool(pos2, PON, name))
    end

    local function FindClosestEgg()
    local hrp = player.Character:WaitForChild("HumanoidRootPart")

    local closest
    local closestDistance = math.huge

    for _, model in ipairs(workspace.EggRenderModels:GetChildren()) do
        local render = model.RenderModel
        for _,part in pairs(render:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        local hitbox = model:FindFirstChild("Hitbox")
        hitbox.CanCollide = false
        hitbox.Size = Vector3.new(hitbox.Size.X * 2, hitbox.Size.Y * 2, hitbox.Size.Z * 2)

        if hitbox then
            local distance = (hitbox.Position - hrp.Position).Magnitude

            if distance < closestDistance then
                closestDistance = distance
                closest = hitbox
            end
        end
    end

    return closest
end

    env.AutoHit = false
    env.AutoIstantBrainrotPrompt = false
    env.AutoFarm = false

    local AutoHit = env.AutoHit or false
    local AutoIstantBrainrotPrompt = env.AutoIstantBrainrotPrompt or false
    local AutoFarm = env.AutoFarm or false
    local egg
    local ham

    if successConf and config then
        AutoHit = config.AutoHit
        AutoIstantBrainrotPrompt = config.AutoIstantBrainrotPrompt
        AutoFarm = config.AutoFarm
    end

    selfMod:AddTG(TS, "Auto Hit Eggs", AutoHit, function(v)
        AutoHit = v

        while AutoHit do
            ham = FindHammer(player.Backpack) or FindHammer(player.Character)
            ham:Activate()
            task.wait(0.5)
        end
    end)

    selfMod:AddTG(TS, "AutoFarm Pet Coins + Vault Keys(Destroy Eggs)", AutoFarm, function(v)
        AutoFarm = v

        while AutoFarm do
            egg = FindClosestEgg()
            local hum = GetHumanoid()
            ham = FindHammer(player.Backpack) or FindHammer(player.Character)
            hum:EquipTool(ham)

            ham:Activate()

            hum:MoveTo(egg.Position)
            hum.MoveToFinished:Wait()

            task.wait(0.5)
        end
    end)

    selfMod:AddBTN(TS, "Equip Invisible[Z]", function()
        EquipWithFind(invId, "Inv")
    end)

    selfMod:AddBTN(TS, "Equip Medusa[X]", function()
        EquipWithFind(medId, "Med")
    end)

    selfMod:AddBTN(TS, "Equip Baloon[C]", function()
        EquipWithFind(balId, "Bal")
    end)

    selfMod:AddBTN(TS, "Equip Body Swap[V]", function()
        EquipWithFind(swaId, "Swa")
    end)

    selfMod:AddBTN(TS, "Equip Bazooka[B]", function()
        EquipWithFind(bazId, "Baz")
    end)

    selfMod:AddBTN(TS, "Equip Speed Coil[N]", function()
        EquipWithFind(velId, "Vel")
    end)

    AddKeyFunc(Enum.KeyCode.Z, function()
        EquipWithFind(invId, "Inv")
    end)

    AddKeyFunc(Enum.KeyCode.X, function()
        EquipWithFind(medId, "Med")
    end)

    AddKeyFunc(Enum.KeyCode.C, function()
        EquipWithFind(balId, "Bal")
    end)

    AddKeyFunc(Enum.KeyCode.V, function()
        EquipWithFind(swaId, "Swa")
    end)

    AddKeyFunc(Enum.KeyCode.B, function()
        EquipWithFind(bazId, "Baz")
    end)

    AddKeyFunc(Enum.KeyCode.N, function()
        EquipWithFind(velId, "Vel")
    end)

    while AutoFarm do
        if ham then
            ham:Activate()
        end

        task.wait(0.5)
    end]])
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
    local tools = {
        Inv = nil,
        Med = nil,
        Bal = nil,
        Swa = nil,
        Baz = nil,
        Bat = nil,
        Vel = nil
    }

    local function AddKeyFunc(KE, func)
        UIS.InputBegan:Connect(function(ck, GPE)
            if GPE then return end
            local inp = ck.KeyCode

            if inp == KE then
                func()
            end
        end)
    end

    local function FindTool(pos, PON, name)
    if tools[name] and tools[name].Parent then
        return tools[name]
    end

    local prefix = PON .. ":"

    for _, ch in ipairs(pos:GetChildren()) do
        if ch:IsA("Tool") and ch.Name:sub(1, #prefix) == prefix then
             tools[name] = ch
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

    local function EquipWithFind(PON, name)
        local hum = GetHumanoid()

        local pos1 = player.Backpack
        local pos2 = player.Character
        hum:EquipTool(FindTool(pos1, PON, name))
        hum:EquipTool(FindTool(pos2, PON, name))
    end

    local function FindClosestEgg()
    local hrp = player.Character:WaitForChild("HumanoidRootPart")

    local closest
    local closestDistance = math.huge

    for _, model in ipairs(workspace.EggRenderModels:GetChildren()) do
        local render = model.RenderModel
        for _,part in pairs(render:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        local hitbox = model:FindFirstChild("Hitbox")
        hitbox.CanCollide = false
        hitbox.Size = Vector3.new(hitbox.Size.X * 2, hitbox.Size.Y * 2, hitbox.Size.Z * 2)

        if hitbox then
            local distance = (hitbox.Position - hrp.Position).Magnitude

            if distance < closestDistance then
                closestDistance = distance
                closest = hitbox
            end
        end
    end

    return closest
end

    env.AutoHit = false
    env.AutoIstantBrainrotPrompt = false
    env.AutoFarm = false

    local AutoHit = env.AutoHit or false
    local AutoIstantBrainrotPrompt = env.AutoIstantBrainrotPrompt or false
    local AutoFarm = env.AutoFarm or false
    local egg
    local ham

    if successConf and config then
        AutoHit = config.AutoHit
        AutoIstantBrainrotPrompt = config.AutoIstantBrainrotPrompt
        AutoFarm = config.AutoFarm
    end

    selfMod:AddTG(TS, "Auto Hit Eggs", AutoHit, function(v)
        AutoHit = v

        while AutoHit do
            ham = FindHammer(player.Backpack) or FindHammer(player.Character)
            ham:Activate()
            task.wait(0.5)
        end
    end)

    selfMod:AddTG(TS, "AutoFarm Pet Coins + Vault Keys(Destroy Eggs)", AutoFarm, function(v)
        AutoFarm = v

        while AutoFarm do
            egg = FindClosestEgg()
            local hum = GetHumanoid()
            ham = FindHammer(player.Backpack) or FindHammer(player.Character)
            hum:EquipTool(ham)

            ham:Activate()

            hum:MoveTo(egg.Position)
            hum.MoveToFinished:Wait()

            task.wait(0.5)
        end
    end)

    selfMod:AddBTN(TS, "Equip Invisible[Z]", function()
        EquipWithFind(invId, "Inv")
    end)

    selfMod:AddBTN(TS, "Equip Medusa[X]", function()
        EquipWithFind(medId, "Med")
    end)

    selfMod:AddBTN(TS, "Equip Baloon[C]", function()
        EquipWithFind(balId, "Bal")
    end)

    selfMod:AddBTN(TS, "Equip Body Swap[V]", function()
        EquipWithFind(swaId, "Swa")
    end)

    selfMod:AddBTN(TS, "Equip Bazooka[B]", function()
        EquipWithFind(bazId, "Baz")
    end)

    selfMod:AddBTN(TS, "Equip Speed Coil[N]", function()
        EquipWithFind(velId, "Vel")
    end)

    AddKeyFunc(Enum.KeyCode.Z, function()
        EquipWithFind(invId, "Inv")
    end)

    AddKeyFunc(Enum.KeyCode.X, function()
        EquipWithFind(medId, "Med")
    end)

    AddKeyFunc(Enum.KeyCode.C, function()
        EquipWithFind(balId, "Bal")
    end)

    AddKeyFunc(Enum.KeyCode.V, function()
        EquipWithFind(swaId, "Swa")
    end)

    AddKeyFunc(Enum.KeyCode.B, function()
        EquipWithFind(bazId, "Baz")
    end)

    AddKeyFunc(Enum.KeyCode.N, function()
        EquipWithFind(velId, "Vel")
    end)

    while AutoFarm do
        if ham then
            ham:Activate()
        end

        task.wait(0.5)
    end
end