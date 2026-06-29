-- Be an Admin

return function(M, T, IT)
    local env = getgenv()
    local selfMod = M
    local TS = T
    local successConf, config = pcall(function()
        return IT.LoadConfig()
    end)

    env.AutoAdmin = false

    local AutoAdmin = false

    if successConf and config then
        AutoAdmin = config.AutoAdmin
    end

    selfMod:AddTG(TS, "Auto Admin", AutoAdmin, function(v)
        AutoAdmin = v
        SaveConfig({AutoAdmin = AutoAdmin})
    end)
end