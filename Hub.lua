local Hub = {}

--// CREATE BUTTON
function Hub:CreateButton(Tab, txt, func)
	local Btn = Instance.new("TextButton")
	local Text = Instance.new("TextLabel")
	local Corner = Instance.new("UICorner")

	Btn.Parent = Tab
	Btn.Size = UDim2.new(0, 434, 0, 50)
	Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Btn.Text = ""

	Corner.Parent = Btn
	Corner.CornerRadius = UDim.new(0, 8)

	Text.Parent = Btn
	Text.BackgroundTransparency = 1
	Text.Text = txt
	Text.TextScaled = true
	Text.Size = UDim2.new(0, 300, 0, 28)
	Text.Position = UDim2.new(0.03, 0, 0.22, 0)
	Text.TextColor3 = Color3.fromRGB(255, 255, 255)

	Btn.MouseButton1Click:Connect(function()
		if func then
			func()
		end
	end)

	return Btn
end

--// CREATE TOGGLE (ON/OFF)
function Hub:CreateToggle(Tab, Text, Ofunc, Ffunc)
	local Btn = Instance.new("TextButton")
	local Label = Instance.new("TextLabel")
	local Show = Instance.new("Frame")
	local Corner = Instance.new("UICorner")
	local ShowCorner = Instance.new("UICorner")

	local state = false

	Btn.Parent = Tab
	Btn.Size = UDim2.new(0, 434, 0, 50)
	Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Btn.Text = ""

	Corner.Parent = Btn
	Corner.CornerRadius = UDim.new(0, 8)

	Label.Parent = Btn
	Label.BackgroundTransparency = 1
	Label.Text = Text
	Label.TextScaled = true
	Label.Size = UDim2.new(0, 300, 0, 28)
	Label.Position = UDim2.new(0.03, 0, 0.22, 0)
	Label.TextColor3 = Color3.fromRGB(255, 255, 255)

	Show.Parent = Btn
	Show.Size = UDim2.new(0, 33, 0, 34)
	Show.Position = UDim2.new(0.892, 0, 0.16, 0)
	Show.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

	ShowCorner.Parent = Show
	ShowCorner.CornerRadius = UDim.new(0, 8)

	local function update()
		if state then
			Show.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
			if Ofunc then Ofunc() end
		else
			Show.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
			if Ffunc then Ffunc() end
		end
	end

	Btn.MouseButton1Click:Connect(function()
		state = not state
		update()
	end)

	update()

	return Btn
end

--// CREATE NO CHANGE TOGGLE (VALUE ONLY DISPLAY)
function Hub:CreateNoChangeToggle(Tab, Text, V)
	local Btn = Instance.new("TextButton")
	local Label = Instance.new("TextLabel")
	local Show = Instance.new("Frame")
	local Corner = Instance.new("UICorner")
	local ShowCorner = Instance.new("UICorner")

	Btn.Parent = Tab
	Btn.Size = UDim2.new(0, 434, 0, 50)
	Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Btn.Text = ""

	Corner.Parent = Btn
	Corner.CornerRadius = UDim.new(0, 8)

	Label.Parent = Btn
	Label.BackgroundTransparency = 1
	Label.Text = Text
	Label.TextScaled = true
	Label.Size = UDim2.new(0, 300, 0, 28)
	Label.Position = UDim2.new(0.03, 0, 0.22, 0)
	Label.TextColor3 = Color3.fromRGB(255, 255, 255)

	Show.Parent = Btn
	Show.Size = UDim2.new(0, 33, 0, 34)
	Show.Position = UDim2.new(0.892, 0, 0.16, 0)

	ShowCorner.Parent = Show
	ShowCorner.CornerRadius = UDim.new(0, 8)

	local function update()
		if V then
			Show.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
		else
			Show.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
		end
	end

	update()

	return Btn
end

return Hub
