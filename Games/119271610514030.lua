-- Break Eggs For Brainrots

return function(M, T, IT)
    local env = getgenv()
    local selfMod = M
    local TS = T
    local successConf, enconfig = pcall(function()
        return IT.LoadConfig()
    end)

	local config = game:GetService("HttpService"):JSONDecode(enconfig)

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
            ham:Active()
        end
    end)
end