-- Become a Brainrot

return function(M, T, IT)
    local env = getgenv()
    local selfMod = M
    local TS = T
    local successConf, encconfig = pcall(function()
        return IT.LoadConfig()
    end)

    local config = game:GetService("HttpService"):JSONDecode(encconfig)
    local data = {
        SpawnPos = Vector(3, {46, 4, 15}),
        EndPos = Vector(3, {46, 6, -1835})
    }

    local ex = {
        Summon = function()
            if env.CustomFunctions then
                local ev = game.ReplicatedStorage.Events.SummonBrainrots
                local args = { [1] = Workspace.Locations:FindFirstChild("End"), n = 1 }
                ev:FireServer(SafeUnpack(args, 1, args.n or #args) or unpack(args, 1, args.n or #args))
            else
                local ev = game.ReplicatedStorage.Events.SummonBrainrots
                local args = { [1] = Workspace.Locations:FindFirstChild("End"), n = 1 }
                ev:FireServer(unpack(args, 1, args.n or #args))
            end
        end,

    }
end