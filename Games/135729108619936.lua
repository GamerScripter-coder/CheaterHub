-- Build a Pet Factory

return function(M, T, IT)

    local env = getgenv()
    local selfMod = M
    local TS = T
    local HttpService = game:GetService("HttpService")

    local successConf, enconfig = pcall(function()
        return IT.LoadConfig()
    end)

    local config = {}
    if successConf and enconfig then
        pcall(function()
            config = HttpService:JSONDecode(enconfig)
        end)
    end

    local lplr = IT.Plr
    local plot = lplr:GetAttribute("PlotName")
    local plrPlot = workspace.Plots:WaitForChild(plot)
    local places = plrPlot:WaitForChild("Placements")

    env.AutoPets = env.AutoPets or false
    env.AutoSell = env.AutoSell or false

    selfMod:AddTG(TS, "Auto Collect Pets", env.AutoPets, function(v)

        env.AutoPets = v

        task.spawn(function()

            while env.AutoPets do

                local char = lplr.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")

                if root then
                    for _, child in ipairs(places:GetChildren()) do

                        if not env.AutoPets then
                            break
                        end

                        local hitbox = child:FindFirstChild("HitBox")
                        local prompt = child:FindFirstChildWhichIsA("ProximityPrompt")

                        if hitbox and prompt and prompt.Enabled then

                            root.CFrame = hitbox.CFrame + Vector3.new(0, 2, 0)

                            task.wait(0.1)

                            pcall(function()
                                fireproximityprompt(prompt, prompt.HoldDuration)
                            end)

                            task.wait(0.1)
                        end
                    end
                end

                task.wait(0.2)
            end

        end)

    end)

    selfMod:AddTG(TS, "Auto Sell Pets/Boxes", env.AutoSell, function(v)

        env.AutoSell = v

        task.spawn(function()

            local sell = plrPlot:WaitForChild("Interactables"):WaitForChild("SellButton")

            while env.AutoSell do

                local char = lplr.Character
                local root = char and char:FindFirstChild("HumanoidRootPart")

                if root then
                    pcall(function()
                        firetouchinterest(root, sell, 0)
                        task.wait()
                        firetouchinterest(root, sell, 1)
                    end)
                end

                task.wait(0.25)
            end

        end)

    end)

end