local env = getgenv()
env.CustomFunctions = true

function env.SafeUnpack(tab, get, extra)
   local unpacked = unpack(tab, get, extra)
   return unpacked or nil
end

function env.firesignal(Signal, Args, get, extra)
   if typeof(Signal) ~= "Instance" then return end

   local unpacked = SafeUnpack(Args, get, extra)
   
   if Signal:IsA("RemoteEvent") then
      Signal:FireServer(unpacked or Args)
   end
   if Signal:IsA("RemoteFunction") then
      Signal:InvokeServer(unpacked or Args)
   end
end

function env.firetouchinterest(Part, ToTouch, Toggle)
   if Toggle == true then
      local lastpos = ToTouch.CFrame
      ToTouch.CFrame = Part.CFrame
      task.wait(0.5)
      ToTouch.CFrame = lastpos
   end
end

function env.SafeWaitForChild(Parent, ChildName)
   local child
   repeat
        child = Parent:FindFirstChild(ChildName)
   until child and child ~= nil

   return child
end

function env.ScreenPlay()
   local Players = game:GetService("Players")
   local UserInputService = game:GetService("UserInputService")

   local player = Players.LocalPlayer

   ----------------------------------------------------
   -- GUI
   ----------------------------------------------------

   local gui = Instance.new("ScreenGui")
   gui.Name = "ControlsUI"
   gui.ResetOnSpawn = false
   gui.Parent = player.PlayerGui


   local main = Instance.new("Frame")
   main.Size = UDim2.fromOffset(250,180)
   main.Position = UDim2.fromScale(0.05,0.75)
   main.BackgroundTransparency = 1
   main.Parent = gui


   ----------------------------------------------------
   -- FUNZIONE CREAZIONE TASTI
   ----------------------------------------------------

   local function createButton(parent,name,text,pos)

      local b = Instance.new("TextLabel")

      b.Name=name
      b.Text=text
      b.Size=UDim2.fromOffset(55,55)
      b.Position=pos

      b.BackgroundColor3=Color3.fromRGB(45,45,45)
      b.TextColor3=Color3.new(1,1,1)

      b.Font=Enum.Font.GothamBold
      b.TextScaled=true

      b.Parent=parent


      local corner=Instance.new("UICorner")
      corner.CornerRadius=UDim.new(0,8)
      corner.Parent=b


      return b
   end



   ----------------------------------------------------
   -- KEYBOARD
   ----------------------------------------------------

   local keyboard=Instance.new("Frame")
   keyboard.Size=UDim2.fromScale(1,1)
   keyboard.BackgroundTransparency=1
   keyboard.Parent=main


   local keys={}


   keys.W=createButton(
      keyboard,
      "W",
      "W",
      UDim2.fromOffset(100,0)
   )


   keys.A=createButton(
      keyboard,
      "A",
      "A",
      UDim2.fromOffset(35,65)
   )


   keys.S=createButton(
      keyboard,
      "S",
      "S",
      UDim2.fromOffset(100,65)
   )


   keys.D=createButton(
      keyboard,
      "D",
      "D",
      UDim2.fromOffset(165,65)
   )



   ----------------------------------------------------
   -- CONTROLLER
   ----------------------------------------------------

   local controller=Instance.new("Frame")
   controller.Size=UDim2.fromScale(1,1)
   controller.BackgroundTransparency=1
   controller.Visible=false
   controller.Parent=main


   local pads={}


   local function pad(name,text,x,y)

      local p=createButton(
         controller,
         name,
         text,
         UDim2.fromOffset(x,y)
      )

      pads[name]=p

   end


   pad("ButtonA","A",160,50)
   pad("ButtonB","B",220,0)
   pad("ButtonX","X",100,0)
   pad("ButtonY","Y",160,-50)
   pad("Stick","◉",30,50)



   ----------------------------------------------------
   -- COLORI
   ----------------------------------------------------

   local normalColor=Color3.fromRGB(45,45,45)
   local pressedColor=Color3.new(1,1,1)


   local function setPressed(button,state)

      if not button then return end


      if state then

         button.BackgroundColor3=pressedColor
         button.TextColor3=Color3.new(0,0,0)

      else

         button.BackgroundColor3=normalColor
         button.TextColor3=Color3.new(1,1,1)

      end

   end



   ----------------------------------------------------
   -- CAMBIO DISPOSITIVO
   ----------------------------------------------------

   local function keyboardMode()

      keyboard.Visible=true
      controller.Visible=false

   end


   local function controllerMode()

      keyboard.Visible=false
      controller.Visible=true

   end



   ----------------------------------------------------
   -- TASTI
   ----------------------------------------------------

   UserInputService.InputBegan:Connect(function(input,gameProcessed)

      if gameProcessed then return end


      if input.UserInputType==Enum.UserInputType.Keyboard then

         keyboardMode()


         local name=input.KeyCode.Name

         if keys[name] then
            setPressed(keys[name],true)
         end


      elseif input.UserInputType==Enum.UserInputType.Gamepad1 then

         controllerMode()


         local name=input.KeyCode.Name


         local map={

            ButtonA="ButtonA",
            ButtonB="ButtonB",
            ButtonX="ButtonX",
            ButtonY="ButtonY"

         }


         if map[name] then
            setPressed(pads[map[name]],true)
         end

      end

   end)



   ----------------------------------------------------
   -- RILASCIO
   ----------------------------------------------------

   UserInputService.InputEnded:Connect(function(input)


      if input.UserInputType==Enum.UserInputType.Keyboard then

         local name=input.KeyCode.Name

         if keys[name] then
            setPressed(keys[name],false)
         end


      elseif input.UserInputType==Enum.UserInputType.Gamepad1 then


         local name=input.KeyCode.Name


         local map={

            ButtonA="ButtonA",
            ButtonB="ButtonB",
            ButtonX="ButtonX",
            ButtonY="ButtonY"

         }


         if map[name] then
            setPressed(pads[map[name]],false)
         end

      end


   end)



   ----------------------------------------------------
   -- STICK
   ----------------------------------------------------

   UserInputService.InputChanged:Connect(function(input)

      if input.UserInputType==Enum.UserInputType.Gamepad1 then

         controllerMode()

         if input.KeyCode==Enum.KeyCode.Thumbstick1 then

            if math.abs(input.Position.X)>.2 
            or math.abs(input.Position.Y)>.2 then

               setPressed(pads.Stick,true)

            else

               setPressed(pads.Stick,false)

            end

         end

      end

   end)
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

-- Chiama ScreenPlay() all'inizio
env.ScreenPlay()

-- Se queue_on_teleport esiste, lo usa per richiamare ScreenPlay() dopo un teletrasporto.
-- Questo assicura che la GUI venga ricreata correttamente.
if queue_on_teleport then
   queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/customfunc.lua', true))()")
end
