-- Be an Admin

return function(M, T, IT)
    local env = getgenv()
    local selfMod = M
    local TS = T
    local successConf, encconfig = pcall(function()
        return IT.LoadConfig()
    end)

    local config = game:GetService("HttpService"):JSONDecode(encconfig)

    env.AutoAdmin = false

    local AutoAdmin = env.AutoAdmin or false

    if successConf and config then
        AutoAdmin = config.AutoAdmin
    end

    selfMod:AddTG(TS, "Auto Admin", AutoAdmin, function(v)
        AutoAdmin = v
        SaveConfig({AutoAdmin = AutoAdmin})
        local touchpath = workspace.Bases.Admin.Claim.Touch
        local pos = touchpath.CFrame
        local char = game.Players.LocalPlayer.Character
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, touchpath, 1)
        wait(3.5)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, touchpath, 0)
        touchpath.CFrame = pos
    end)
end