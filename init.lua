if not game:IsLoaded() then
    game.Loaded:Wait()
end

local env = getgenv()

local ImportantTable = {}

function ImportantTable.LoadConfig()
	local p = game.PlaceId
	local tp = tostring(p)
	local foldpath = "CheaterHub/"..tp
	local configpath = foldpath.."/Config.json"
	local suc, readed = pcall(function()
		return readfile(configpath)
	end)

	if suc and readed then
		print("suc")
		return readed
	else
		print("nil")
		return nil
	end
end

ImportantTable.Plr = game.Players.LocalPlayer
ImportantTable.Char = game.Players.LocalPlayer.Character

function env.GetGithubPath(path)
	local GamesFolderpath = "https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Games/"
	local Hubpath = "https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Hub.lua"
	local Gamespath = "https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Games.lua"
    local Temppath = "https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/temp.lua"
	if path == "GF" then
		return GamesFolderpath
	end
	if path == "H" then
		return Hubpath
	end
	if path == "G" then
		return Gamespath
	end
end

function env.ensureFolder(path)
    if not isfolder(path) then
        makefolder(path)
    end
end

function env.SaveConfig(savedata, foldname)
	local p = game.PlaceId
	local tp = tostring(p)
	local folderPath
	if foldname then
		folderPath = "CheaterHub/"..foldname
	else
		folderPath = "CheaterHub/"..tp
	end
    ensureFolder(folderPath)
    writefile(folderPath .. "/Config.json", game:GetService("HttpService"):JSONEncode(savedata))
end

function env.SetConfig(id, key, value)
    local path = "CheaterHub/"..tostring(id)
	if not isfolder(path) then return false, "Save First" end
	local config = path.."/Config.json"
	local dec = game:GetService("HttpService"):JSONDecode(readfile(config))
	if dec[key] and value then
		dec[key] = value
	else
		return false, "Doesn't exsist the key or the value"
	end
end

function env.exstr(site)
	return loadstring(game:HttpGet(site, true))()
end

function env.GaveGame(site, M, T)
	local func = loadstring(game:HttpGet(site, true))
	local load = func()
	load(M, T, ImportantTable)
end

function env.GaveCustomGame(func, M, T)
	local load = func()
	load(M, T, ImportantTable)
end

function env.Notify(title, text, kind, duration)
   local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = PlayerGui:FindFirstChild("Notify")

if not ScreenGui then
    ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Notify"
    ScreenGui.Parent = PlayerGui
end
local TweenService = game:GetService("TweenService")

local CONFIG = {
	Card       = Color3.fromRGB(33, 33, 39),
	CardHover  = Color3.fromRGB(44, 44, 52),
	Stroke     = Color3.fromRGB(70, 70, 82),
	Text       = Color3.fromRGB(244, 244, 248),
	SubText    = Color3.fromRGB(135, 135, 148),
}

local NotifHolder = ScreenGui:FindFirstChild("Holder")
if not NotifHolder then
NotifHolder = Instance.new("Frame")
NotifHolder.Name = "Holder"
NotifHolder.AnchorPoint = Vector2.new(1, 1)
NotifHolder.Position = UDim2.new(1, -16, 1, -16)
NotifHolder.Size = UDim2.new(0, 312, 1, -32)
NotifHolder.BackgroundTransparency = 1
NotifHolder.Parent = ScreenGui
end
local nLay = NotifHolder:FindFirstChild("NotifyLayout")
if not nLay then
nLay = Instance.new("UIListLayout")
nLay.Name = "NotifyLayout"
nLay.Padding            = UDim.new(0, 10)
nLay.VerticalAlignment   = Enum.VerticalAlignment.Bottom
nLay.HorizontalAlignment = Enum.HorizontalAlignment.Right
nLay.SortOrder           = Enum.SortOrder.LayoutOrder
nLay.Parent              = NotifHolder
end

local function corner(p, r)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, r or 12)
	c.Parent = p
	return c
end

local function stroke(p, col, th, tr)
	local s = Instance.new("UIStroke")
	s.Color           = col or CONFIG.Stroke
	s.Thickness       = th or 1
	s.Transparency    = tr or 0.5
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent          = p
	return s
end

local function padding(p, t, b, l, r)
	local u = Instance.new("UIPadding")
	u.PaddingTop    = UDim.new(0, t or 0)
	u.PaddingBottom = UDim.new(0, b or 0)
	u.PaddingLeft   = UDim.new(0, l or 0)
	u.PaddingRight  = UDim.new(0, r or 0)
	u.Parent = p
	return u
end

local function gradient(p, c1, c2, rot)
	local g = Instance.new("UIGradient")
	g.Color = ColorSequence.new(c1, c2)
	g.Rotation = rot or 0
	g.Parent = p
	return g
end

local function animatedGradient(p)
	local g = Instance.new("UIGradient")
	g.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,   CONFIG.Accent),
		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(95, 95, 110)),
		ColorSequenceKeypoint.new(1,   CONFIG.Accent),
	})
	g.Parent = p
	task.spawn(function()
		while g.Parent do
			TweenService:Create(g, TweenInfo.new(4, Enum.EasingStyle.Linear), {Offset = Vector2.new(1, 0)}):Play()
			task.wait(4)
			g.Offset = Vector2.new(-1, 0)
		end
	end)
	return g
end

local function makeIcon(parent, icon, color)
	if typeof(icon) == "string" and icon:match("^rbxassetid://") then
		local img = Instance.new("ImageLabel")
		img.BackgroundTransparency = 1
		img.Image       = icon
		img.ImageColor3  = color
		img.Size        = UDim2.new(0, 18, 0, 18)
		img.Position    = UDim2.new(0, 16, 0.5, -9)
		img.Parent      = parent
		return img
	else
		local t = Instance.new("TextLabel")
		t.BackgroundTransparency = 1
		t.Font           = Enum.Font.GothamBold
		t.Text           = icon or ""
		t.TextSize       = 16
		t.TextColor3     = color
		t.Size           = UDim2.new(0, 24, 1, 0)
		t.Position       = UDim2.new(0, 16, 0, 0)
		t.TextXAlignment = Enum.TextXAlignment.Left
		t.Parent         = parent
		return t
	end
end

local function attachRipple(btn)
	btn.ClipsDescendants = true
	btn.MouseButton1Down:Connect(function(x, y)
		local r = Instance.new("Frame")
		r.AnchorPoint        = Vector2.new(0.5, 0.5)
		r.BackgroundColor3   = Color3.new(1, 1, 1)
		r.BackgroundTransparency = 0.8
		r.BorderSizePixel    = 0
		r.Position           = UDim2.new(0, x - btn.AbsolutePosition.X, 0, y - btn.AbsolutePosition.Y)
		r.Size               = UDim2.new(0, 0, 0, 0)
		r.ZIndex             = btn.ZIndex + 6
		r.Parent             = btn
		corner(r, 100)
		local goal = math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 2.2
		TweenService:Create(r, TweenInfo.new(0.55, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, goal, 0, goal), BackgroundTransparency = 1,
		}):Play()
		task.delay(0.55, function() r:Destroy() end)
	end)
end

local function Notify(title, text, kind, duration)
	kind = kind or "info"
	duration = duration or 4
	local palette = {
		success = Color3.fromRGB(125, 225, 155),
		error   = Color3.fromRGB(255, 105, 105),
		info    = Color3.fromRGB(242, 242, 245),
		warn    = Color3.fromRGB(242, 200, 120),
	}
	local col = palette[kind] or palette.info

	local card = Instance.new("Frame")
	card.Size                = UDim2.new(1, 0, 0, 64)
	card.BackgroundColor3    = CONFIG.Card
	card.BackgroundTransparency = 1
	card.BorderSizePixel     = 0
	card.Position            = UDim2.new(1, 24, 0, 0)
	card.Parent              = NotifHolder
	corner(card, 13)
	stroke(card, col, 1, 0.6)
	gradient(card, CONFIG.CardHover, CONFIG.Card, 90)

	local bar = Instance.new("Frame")
	bar.Size             = UDim2.new(0, 4, 1, -16)
	bar.Position         = UDim2.new(0, 9, 0, 8)
	bar.BackgroundColor3 = col
	bar.BackgroundTransparency = 1
	bar.BorderSizePixel  = 0
	bar.Parent           = card
	corner(bar, 4)

	local nT = Instance.new("TextLabel")
	nT.Size = UDim2.new(1, -30, 0, 18); nT.Position = UDim2.new(0, 22, 0, 11)
	nT.BackgroundTransparency = 1; nT.Font = Enum.Font.GothamBold
	nT.Text = title; nT.TextSize = 14; nT.TextColor3 = CONFIG.Text
	nT.TextXAlignment = Enum.TextXAlignment.Left; nT.TextTransparency = 1; nT.Parent = card

	local nB = Instance.new("TextLabel")
	nB.Size = UDim2.new(1, -30, 0, 24); nB.Position = UDim2.new(0, 22, 0, 30)
	nB.BackgroundTransparency = 1; nB.Font = Enum.Font.Gotham
	nB.Text = text; nB.TextSize = 12; nB.TextColor3 = CONFIG.SubText
	nB.TextXAlignment = Enum.TextXAlignment.Left; nB.TextYAlignment = Enum.TextYAlignment.Top
	nB.TextWrapped = true; nB.TextTransparency = 1; nB.Parent = card

	local prog = Instance.new("Frame")
	prog.Size = UDim2.new(1, -18, 0, 3); prog.Position = UDim2.new(0, 9, 1, -7)
	prog.BackgroundColor3 = col; prog.BackgroundTransparency = 1; prog.BorderSizePixel = 0; prog.Parent = card
	corner(prog, 3)

	local tIn = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	TweenService:Create(card, tIn, {BackgroundTransparency = 0.02, Position = UDim2.new(0, 0, 0, 0)}):Play()
	TweenService:Create(bar,  tIn, {BackgroundTransparency = 0}):Play()
	TweenService:Create(nT,   tIn, {TextTransparency = 0}):Play()
	TweenService:Create(nB,   tIn, {TextTransparency = 0}):Play()
	TweenService:Create(prog, tIn, {BackgroundTransparency = 0.3}):Play()
	TweenService:Create(prog, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 3)}):Play()

	task.delay(duration, function()
		local tOut = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		TweenService:Create(card, tOut, {BackgroundTransparency = 1, Position = UDim2.new(1, 24, 0, 0)}):Play()
		TweenService:Create(bar,  tOut, {BackgroundTransparency = 1}):Play()
		TweenService:Create(nT,   tOut, {TextTransparency = 1}):Play()
		TweenService:Create(nB,   tOut, {TextTransparency = 1}):Play()
		TweenService:Create(prog, tOut, {BackgroundTransparency = 1}):Play()
		task.wait(0.4); card:Destroy()
	end)
end
end

exstr("https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Hub.lua")

