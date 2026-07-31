-- Build a Pet Factory

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

    local lplr = IT.Plr
    local plot = lplr:GetAttribute("PlotName")
    local plrPlot = workspace.Plots:WaitForChild(plot)
    local places = plrPlot:WaitForChild("Placements")

    env.AutoPets = false
    env.AutoSell = false

    local AutoPets = env.AutoPets or false
    local AutoSell = env.AutoSell or false

    selfMod:AddTG(TS, "Auto Collect Pets", AutoPets, function(v)
        AutoPets = v
        local char = lplr.Character
        local root = char.HumanoidRootPart

        while AutoPets do
        for _, child in ipairs(places:GetChildren()) do
           local prompt = child:FindFirstChildWhichIsA("ProximityPrompt")
           local hitbox = child:FindFirstChild("HitBox")

           if prompt and prompt.Enabled then
                 fireproximityprompt(prompt, prompt.HoldDuration)
                 task.wait(0.1)
              end
           end

           root.CFrame = hitbox.CFrame

           task.wait(0.2)
        end
    end)

    selfMod:AddTG(TS, "Auto Sell Pets/Boxes", AutoSell, function(v)
        AutoSell = v

        while AutoSell do
            local char = lplr.Character
            local root = char.HumanoidRootPart
            local sell = plrPlot:WaitForChild("Interactables"):WaitForChild("SellButton")
            firetouchinterest(root, sell, 1)
            task.wait(0.5)
            firetouchinterest(root, sell, 0)

            task.wait(0.2)
        end
    end)
end