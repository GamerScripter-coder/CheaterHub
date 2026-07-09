--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.ResetOnSpawn = false

local notif = Instance.new("Frame")
notif.Size = UDim2.new(0, 420, 0, 90)
notif.Position = UDim2.new(1, 450, 1, -120)
notif.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
notif.BorderSizePixel = 0
notif.Parent = gui

Instance.new("UICorner", notif).CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke", notif)
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 1.5

local warning = Instance.new("TextLabel")
warning.Size = UDim2.new(1, -20, 0, 25)
warning.Position = UDim2.new(0, 10, 0, 8)
warning.BackgroundTransparency = 1
warning.Text = "⚠ Script Detected"
warning.TextColor3 = Color3.fromRGB(255, 220, 0)
warning.Font = Enum.Font.GothamBold
warning.TextSize = 16
warning.TextXAlignment = Enum.TextXAlignment.Left
warning.Parent = notif

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 1, -35)
text.Position = UDim2.new(0, 10, 0, 30)
text.BackgroundTransparency = 1
text.Text = ""
text.TextWrapped = true
text.TextColor3 = Color3.fromRGB(220, 220, 220)
text.Font = Enum.Font.Gotham
text.TextSize = 14
text.TextXAlignment = Enum.TextXAlignment.Left
text.TextYAlignment = Enum.TextYAlignment.Top
text.Parent = notif

local showTween = TweenService:Create(
	notif,
	TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
	{Position = UDim2.new(1, -440, 1, -120)}
)

local hideTween = TweenService:Create(
	notif,
	TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
	{Position = UDim2.new(1, 450, 1, -120)}
)

local function showNotif(titleText, bodyText, duration)
	warning.Text = titleText
	text.Text = bodyText

	notif.Position = UDim2.new(1, 450, 1, -120)
	showTween:Play()

	if duration then
		task.delay(duration, function()
			hideTween:Play()
		end)
	end
end

showNotif(
	"⚠ Player Finder Online",
	"The script will run in a moment. Please be patient while it searches for the requested player.",
	3
)

task.wait(3)

-- TARGET
local PlaceId = game.PlaceId
local LocalPlayer = Players.LocalPlayer

local Targets = {
	Usernames = {"roblox_user_2461323909"},
	UserIds = {2461323909}
}

local function isTarget(player)
	for _, name in ipairs(Targets.Usernames) do
		if player.Name:lower() == name:lower() then
			return true
		end
	end

	for _, id in ipairs(Targets.UserIds) do
		if player.UserId == id then
			return true
		end
	end

	return false
end

local function checkServer()
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and isTarget(plr) then
			return true
		end
	end
	return false
end

local function getServers()
	local servers = {}

	local url = string.format(
		"https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100",
		PlaceId
	)

	local success, result = pcall(function()
	return game:HttpGet(url)
end)

if not success then
	return {}
end

local data = HttpService:JSONDecode(result)

	for _, server in ipairs(data.data) do
		if server.playing < server.maxPlayers and server.id ~= game.JobId then
			table.insert(servers, server.id)
		end
	end

	return servers
end

local function serverHop()
	while true do

		if checkServer() then
			showNotif("🎯 Target Found", "Players Found !!!", 2)
			task.wait(2)
			return -- 🔥 stop TOTAL (important)
		end

		local servers = getServers()
		if #servers == 0 then return end

		local chosen = servers[math.random(1, #servers)]
		TeleportService:TeleportToPlaceInstance(PlaceId, chosen, LocalPlayer)

		task.wait(5)
	end
end

serverHop()
