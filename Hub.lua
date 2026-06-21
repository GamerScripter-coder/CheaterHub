local UIModule = {}
local selfM = UIModule

-- UI IN CODE
local G2L = {};

-- StarterGui.MMSGHub
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[MMSGHub]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false


-- StarterGui.MMSGHub.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 96, 79);
G2L["2"]["Size"] = UDim2.new(0, 488, 0, 361);
G2L["2"]["Position"] = UDim2.new(0.26239, 0, 0.25965, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.MMSGHub.Frame.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.TopBar
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(172, 92, 76);
G2L["4"]["Size"] = UDim2.new(0, 488, 0, 49);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Name"] = [[TopBar]];


-- StarterGui.MMSGHub.Frame.TopBar.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"]);
G2L["5"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Divisor
G2L["6"] = Instance.new("Frame", G2L["2"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(172, 92, 76);
G2L["6"]["Size"] = UDim2.new(0, 16, 0, 361);
G2L["6"]["Position"] = UDim2.new(0.24385, 0, 0, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Name"] = [[Divisor]];


-- StarterGui.MMSGHub.Frame.Divisor.UICorner
G2L["7"] = Instance.new("UICorner", G2L["6"]);
G2L["7"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Divisor
G2L["8"] = Instance.new("Frame", G2L["2"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(172, 92, 76);
G2L["8"]["Size"] = UDim2.new(0, 135, 0, 12);
G2L["8"]["Position"] = UDim2.new(0, 0, 0.13573, 0);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Name"] = [[Divisor]];


-- StarterGui.MMSGHub.Frame.Divisor.UICorner
G2L["9"] = Instance.new("UICorner", G2L["8"]);
G2L["9"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Divisor
G2L["a"] = Instance.new("Frame", G2L["2"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(172, 92, 76);
G2L["a"]["Size"] = UDim2.new(0, 135, 0, 12);
G2L["a"]["Position"] = UDim2.new(0, 0, 0.96676, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[Divisor]];


-- StarterGui.MMSGHub.Frame.Divisor.UICorner
G2L["b"] = Instance.new("UICorner", G2L["a"]);
G2L["b"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Divisor
G2L["c"] = Instance.new("Frame", G2L["2"]);
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(172, 92, 76);
G2L["c"]["Size"] = UDim2.new(0, 16, 0, 361);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Name"] = [[Divisor]];


-- StarterGui.MMSGHub.Frame.Divisor.UICorner
G2L["d"] = Instance.new("UICorner", G2L["c"]);
G2L["d"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Tabs
G2L["e"] = Instance.new("Frame", G2L["2"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["Size"] = UDim2.new(0, 103, 0, 288);
G2L["e"]["Position"] = UDim2.new(0.03279, 0, 0.16898, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Name"] = [[Tabs]];
G2L["e"]["BackgroundTransparency"] = 1;


-- StarterGui.MMSGHub.Frame.Tabs.UIListLayout
G2L["f"] = Instance.new("UIListLayout", G2L["e"]);
G2L["f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.MMSGHub.Frame.Tabs.Home
G2L["10"] = Instance.new("TextButton", G2L["e"]);
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["TextSize"] = 14;
G2L["10"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(120, 64, 53);
G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["10"]["Size"] = UDim2.new(0, 103, 0, 49);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Text"] = [[]];
G2L["10"]["Name"] = [[Home]];


-- StarterGui.MMSGHub.Frame.Tabs.Home.TextLabel
G2L["11"] = Instance.new("TextLabel", G2L["10"]);
G2L["11"]["TextWrapped"] = true;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextSize"] = 14;
G2L["11"]["TextScaled"] = true;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["BackgroundTransparency"] = 1;
G2L["11"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[🏠Home]];


-- StarterGui.MMSGHub.Frame.Tabs.Home.TextLabel.UIStroke
G2L["12"] = Instance.new("UIStroke", G2L["11"]);



-- StarterGui.MMSGHub.Frame.Tabs.Game
G2L["13"] = Instance.new("TextButton", G2L["e"]);
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 14;
G2L["13"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(120, 64, 53);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["Size"] = UDim2.new(0, 103, 0, 49);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[]];
G2L["13"]["Name"] = [[Game]];


-- StarterGui.MMSGHub.Frame.Tabs.Game.TextLabel
G2L["14"] = Instance.new("TextLabel", G2L["13"]);
G2L["14"]["TextWrapped"] = true;
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["TextSize"] = 14;
G2L["14"]["TextScaled"] = true;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["14"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["BackgroundTransparency"] = 1;
G2L["14"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Text"] = [[🎮Game]];


-- StarterGui.MMSGHub.Frame.Tabs.Game.TextLabel.UIStroke
G2L["15"] = Instance.new("UIStroke", G2L["14"]);



-- StarterGui.MMSGHub.Frame.Tabs.Games
G2L["16"] = Instance.new("TextButton", G2L["e"]);
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["TextSize"] = 14;
G2L["16"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(120, 64, 53);
G2L["16"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["16"]["Size"] = UDim2.new(0, 103, 0, 49);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Text"] = [[]];
G2L["16"]["Name"] = [[Games]];


-- StarterGui.MMSGHub.Frame.Tabs.Games.TextLabel
G2L["17"] = Instance.new("TextLabel", G2L["16"]);
G2L["17"]["TextWrapped"] = true;
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["TextSize"] = 14;
G2L["17"]["TextScaled"] = true;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["Text"] = [[🎮🎮Games]];


-- StarterGui.MMSGHub.Frame.Tabs.Games.TextLabel.UIStroke
G2L["18"] = Instance.new("UIStroke", G2L["17"]);



-- StarterGui.MMSGHub.Frame.Tabs.Settings
G2L["19"] = Instance.new("TextButton", G2L["e"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["TextSize"] = 14;
G2L["19"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(120, 64, 53);
G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["19"]["Size"] = UDim2.new(0, 103, 0, 49);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["Text"] = [[]];
G2L["19"]["Name"] = [[Settings]];


-- StarterGui.MMSGHub.Frame.Tabs.Settings.TextLabel
G2L["1a"] = Instance.new("TextLabel", G2L["19"]);
G2L["1a"]["TextWrapped"] = true;
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["TextSize"] = 14;
G2L["1a"]["TextScaled"] = true;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["BackgroundTransparency"] = 1;
G2L["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[⚙️Settings]];


-- StarterGui.MMSGHub.Frame.Tabs.Settings.TextLabel.UIStroke
G2L["1b"] = Instance.new("UIStroke", G2L["1a"]);



-- StarterGui.MMSGHub.Frame.Tabs.UniversalCheats
G2L["1c"] = Instance.new("TextButton", G2L["e"]);
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["TextSize"] = 14;
G2L["1c"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(120, 64, 53);
G2L["1c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1c"]["Size"] = UDim2.new(0, 103, 0, 49);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Text"] = [[]];
G2L["1c"]["Name"] = [[UniversalCheats]];


-- StarterGui.MMSGHub.Frame.Tabs.UniversalCheats.TextLabel
G2L["1d"] = Instance.new("TextLabel", G2L["1c"]);
G2L["1d"]["TextWrapped"] = true;
G2L["1d"]["BorderSizePixel"] = 0;
G2L["1d"]["TextSize"] = 14;
G2L["1d"]["TextScaled"] = true;
G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1d"]["BackgroundTransparency"] = 1;
G2L["1d"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1d"]["Text"] = [[👾Universal Cheats]];


-- StarterGui.MMSGHub.Frame.Tabs.UniversalCheats.TextLabel.UIStroke
G2L["1e"] = Instance.new("UIStroke", G2L["1d"]);



-- StarterGui.MMSGHub.Frame.Tabs.Credits
G2L["1f"] = Instance.new("TextButton", G2L["e"]);
G2L["1f"]["BorderSizePixel"] = 0;
G2L["1f"]["TextSize"] = 14;
G2L["1f"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["BackgroundColor3"] = Color3.fromRGB(120, 64, 53);
G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1f"]["Size"] = UDim2.new(0, 103, 0, 49);
G2L["1f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1f"]["Text"] = [[]];
G2L["1f"]["Name"] = [[Credits]];


-- StarterGui.MMSGHub.Frame.Tabs.Credits.TextLabel
G2L["20"] = Instance.new("TextLabel", G2L["1f"]);
G2L["20"]["TextWrapped"] = true;
G2L["20"]["BorderSizePixel"] = 0;
G2L["20"]["TextSize"] = 14;
G2L["20"]["TextScaled"] = true;
G2L["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["20"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["20"]["BackgroundTransparency"] = 1;
G2L["20"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["20"]["Text"] = [[🏆Credits]];


-- StarterGui.MMSGHub.Frame.Tabs.Credits.TextLabel.UIStroke
G2L["21"] = Instance.new("UIStroke", G2L["20"]);



-- StarterGui.MMSGHub.Frame.Templates
G2L["22"] = Instance.new("Frame", G2L["2"]);
G2L["22"]["Visible"] = false;
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["22"]["Size"] = UDim2.new(0, 353, 0, 312);
G2L["22"]["Position"] = UDim2.new(0.27664, 0, 0.13573, 0);
G2L["22"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["22"]["Name"] = [[Templates]];
G2L["22"]["BackgroundTransparency"] = 1;


-- StarterGui.MMSGHub.Frame.Templates.TabBtn
G2L["23"] = Instance.new("TextButton", G2L["22"]);
G2L["23"]["BorderSizePixel"] = 0;
G2L["23"]["TextSize"] = 14;
G2L["23"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["BackgroundColor3"] = Color3.fromRGB(189, 101, 84);
G2L["23"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["23"]["Size"] = UDim2.new(0, 353, 0, 50);
G2L["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["23"]["Text"] = [[]];
G2L["23"]["Name"] = [[TabBtn]];


-- StarterGui.MMSGHub.Frame.Templates.TabBtn.UICorner
G2L["24"] = Instance.new("UICorner", G2L["23"]);
G2L["24"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Templates.TabBtn.txt
G2L["25"] = Instance.new("TextLabel", G2L["23"]);
G2L["25"]["TextWrapped"] = true;
G2L["25"]["BorderSizePixel"] = 0;
G2L["25"]["TextSize"] = 14;
G2L["25"]["TextScaled"] = true;
G2L["25"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["25"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["25"]["BackgroundTransparency"] = 1;
G2L["25"]["Size"] = UDim2.new(0, 175, 0, 26);
G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["25"]["Name"] = [[txt]];
G2L["25"]["Position"] = UDim2.new(0.04533, 0, 0.24, 0);


-- StarterGui.MMSGHub.Frame.Templates.TabBtn.btntxt
G2L["26"] = Instance.new("TextLabel", G2L["23"]);
G2L["26"]["TextWrapped"] = true;
G2L["26"]["BorderSizePixel"] = 0;
G2L["26"]["TextSize"] = 14;
G2L["26"]["TextXAlignment"] = Enum.TextXAlignment.Right;
G2L["26"]["TextTransparency"] = 0.5;
G2L["26"]["TextScaled"] = true;
G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["26"]["BackgroundTransparency"] = 1;
G2L["26"]["Size"] = UDim2.new(0, 132, 0, 18);
G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["26"]["Text"] = [[button]];
G2L["26"]["Name"] = [[btntxt]];
G2L["26"]["Position"] = UDim2.new(0.5949, 0, 0.32, 0);


-- StarterGui.MMSGHub.Frame.Templates.TabTG
G2L["27"] = Instance.new("TextButton", G2L["22"]);
G2L["27"]["BorderSizePixel"] = 0;
G2L["27"]["TextSize"] = 14;
G2L["27"]["AutoButtonColor"] = false;
G2L["27"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["BackgroundColor3"] = Color3.fromRGB(189, 101, 84);
G2L["27"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["27"]["Size"] = UDim2.new(0, 353, 0, 50);
G2L["27"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["27"]["Text"] = [[]];
G2L["27"]["Name"] = [[TabTG]];


-- StarterGui.MMSGHub.Frame.Templates.TabTG.UICorner
G2L["28"] = Instance.new("UICorner", G2L["27"]);
G2L["28"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.txt
G2L["29"] = Instance.new("TextLabel", G2L["27"]);
G2L["29"]["TextWrapped"] = true;
G2L["29"]["BorderSizePixel"] = 0;
G2L["29"]["TextSize"] = 14;
G2L["29"]["TextScaled"] = true;
G2L["29"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["29"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["29"]["BackgroundTransparency"] = 1;
G2L["29"]["Size"] = UDim2.new(0, 175, 0, 26);
G2L["29"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["29"]["Name"] = [[txt]];
G2L["29"]["Position"] = UDim2.new(0.04533, 0, 0.24, 0);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle
G2L["2a"] = Instance.new("Frame", G2L["27"]);
G2L["2a"]["BorderSizePixel"] = 0;
G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
G2L["2a"]["Size"] = UDim2.new(0, 45, 0, 24);
G2L["2a"]["Position"] = UDim2.new(0.84136, 0, 0.26, 0);
G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2a"]["Name"] = [[Toggle]];


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.UICorner
G2L["2b"] = Instance.new("UICorner", G2L["2a"]);
G2L["2b"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.UIStroke
G2L["2c"] = Instance.new("UIStroke", G2L["2a"]);



-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ToggleOFF
G2L["2d"] = Instance.new("Frame", G2L["2a"]);
G2L["2d"]["BorderSizePixel"] = 0;
G2L["2d"]["BackgroundColor3"] = Color3.fromRGB(190, 53, 30);
G2L["2d"]["Size"] = UDim2.new(0, 25, 0, 24);
G2L["2d"]["Position"] = UDim2.new(0.43135, 0, 0.01, 0);
G2L["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2d"]["Name"] = [[ToggleOFF]];


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ToggleOFF.UICorner
G2L["2e"] = Instance.new("UICorner", G2L["2d"]);
G2L["2e"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ToggleOFF.UIStroke
G2L["2f"] = Instance.new("UIStroke", G2L["2d"]);



-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ToggleON
G2L["30"] = Instance.new("Frame", G2L["2a"]);
G2L["30"]["Visible"] = false;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(79, 181, 56);
G2L["30"]["Size"] = UDim2.new(0, 25, 0, 24);
G2L["30"]["Position"] = UDim2.new(-0.01309, 0, 0.01, 0);
G2L["30"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["30"]["Name"] = [[ToggleON]];


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ToggleON.UICorner
G2L["31"] = Instance.new("UICorner", G2L["30"]);
G2L["31"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ToggleON.UIStroke
G2L["32"] = Instance.new("UIStroke", G2L["30"]);



-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.OFF
G2L["33"] = Instance.new("Color3Value", G2L["2a"]);
G2L["33"]["Name"] = [[OFF]];
G2L["33"]["Value"] = Color3.fromRGB(255, 0, 0);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ON
G2L["34"] = Instance.new("Color3Value", G2L["2a"]);
G2L["34"]["Name"] = [[ON]];
G2L["34"]["Value"] = Color3.fromRGB(0, 255, 0);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.OFFTG
G2L["35"] = Instance.new("Color3Value", G2L["2a"]);
G2L["35"]["Name"] = [[OFFTG]];
G2L["35"]["Value"] = Color3.fromRGB(190, 53, 30);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Toggle.ONTG
G2L["36"] = Instance.new("Color3Value", G2L["2a"]);
G2L["36"]["Name"] = [[ONTG]];
G2L["36"]["Value"] = Color3.fromRGB(79, 181, 56);


-- StarterGui.MMSGHub.Frame.Templates.TabTG.Status
G2L["37"] = Instance.new("BoolValue", G2L["27"]);
G2L["37"]["Name"] = [[Status]];


-- StarterGui.MMSGHub.Frame.Templates.UIListLayout
G2L["38"] = Instance.new("UIListLayout", G2L["22"]);
G2L["38"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter
G2L["39"] = Instance.new("TextButton", G2L["22"]);
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["TextSize"] = 14;
G2L["39"]["AutoButtonColor"] = false;
G2L["39"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(189, 101, 84);
G2L["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["39"]["Size"] = UDim2.new(0, 353, 0, 50);
G2L["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["39"]["Text"] = [[]];
G2L["39"]["Name"] = [[GameTeleporter]];


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.UICorner
G2L["3a"] = Instance.new("UICorner", G2L["39"]);
G2L["3a"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.txt
G2L["3b"] = Instance.new("TextLabel", G2L["39"]);
G2L["3b"]["TextWrapped"] = true;
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["TextSize"] = 14;
G2L["3b"]["TextScaled"] = true;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["BackgroundTransparency"] = 1;
G2L["3b"]["Size"] = UDim2.new(0, 249, 0, 26);
G2L["3b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3b"]["Text"] = [[Name]];
G2L["3b"]["Name"] = [[txt]];
G2L["3b"]["Position"] = UDim2.new(0.24363, 0, 0.24, 0);


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.State
G2L["3c"] = Instance.new("Frame", G2L["39"]);
G2L["3c"]["BorderSizePixel"] = 0;
G2L["3c"]["BackgroundColor3"] = Color3.fromRGB(0, 255, 0);
G2L["3c"]["Size"] = UDim2.new(0, 38, 0, 38);
G2L["3c"]["Position"] = UDim2.new(0.07082, 0, 0.12, 0);
G2L["3c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3c"]["Name"] = [[State]];


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.State.UIAspectRatioConstraint
G2L["3d"] = Instance.new("UIAspectRatioConstraint", G2L["3c"]);



-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.State.UICorner
G2L["3e"] = Instance.new("UICorner", G2L["3c"]);
G2L["3e"]["CornerRadius"] = UDim.new(0, 80);


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.State.UIStroke
G2L["3f"] = Instance.new("UIStroke", G2L["3c"]);



-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.State.OFF
G2L["40"] = Instance.new("Color3Value", G2L["3c"]);
G2L["40"]["Name"] = [[OFF]];
G2L["40"]["Value"] = Color3.fromRGB(255, 0, 0);


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.State.ON
G2L["41"] = Instance.new("Color3Value", G2L["3c"]);
G2L["41"]["Name"] = [[ON]];
G2L["41"]["Value"] = Color3.fromRGB(0, 255, 0);


-- StarterGui.MMSGHub.Frame.Templates.GameTeleporter.State.MID
G2L["42"] = Instance.new("Color3Value", G2L["3c"]);
G2L["42"]["Name"] = [[MID]];
G2L["42"]["Value"] = Color3.fromRGB(255, 255, 0);


-- StarterGui.MMSGHub.Frame.Templates.Label
G2L["43"] = Instance.new("TextButton", G2L["22"]);
G2L["43"]["BorderSizePixel"] = 0;
G2L["43"]["TextSize"] = 14;
G2L["43"]["AutoButtonColor"] = false;
G2L["43"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["BackgroundColor3"] = Color3.fromRGB(189, 101, 84);
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["43"]["Size"] = UDim2.new(0, 353, 0, 50);
G2L["43"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["43"]["Text"] = [[]];
G2L["43"]["Name"] = [[Label]];


-- StarterGui.MMSGHub.Frame.Templates.Label.UICorner
G2L["44"] = Instance.new("UICorner", G2L["43"]);
G2L["44"]["CornerRadius"] = UDim.new(0, 20);


-- StarterGui.MMSGHub.Frame.Templates.Label.txt
G2L["45"] = Instance.new("TextLabel", G2L["43"]);
G2L["45"]["TextWrapped"] = true;
G2L["45"]["BorderSizePixel"] = 0;
G2L["45"]["TextSize"] = 14;
G2L["45"]["TextScaled"] = true;
G2L["45"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["FontFace"] = Font.new([[rbxasset://fonts/families/ComicNeueAngular.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["45"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["45"]["BackgroundTransparency"] = 1;
G2L["45"]["Size"] = UDim2.new(0, 326, 0, 31);
G2L["45"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["45"]["Name"] = [[txt]];
G2L["45"]["Position"] = UDim2.new(0.04533, 0, 0.24, 0);


-- StarterGui.MMSGHub.Frame.TabsScrolling
G2L["46"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["46"]["Active"] = true;
G2L["46"]["BorderSizePixel"] = 0;
G2L["46"]["CanvasSize"] = UDim2.new(0, 0, 5, 0);
G2L["46"]["Name"] = [[TabsScrolling]];
G2L["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["46"]["Size"] = UDim2.new(0, 353, 0, 312);
G2L["46"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["Position"] = UDim2.new(0.27664, 0, 0.13573, 0);
G2L["46"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["46"]["BackgroundTransparency"] = 1;


-- StarterGui.MMSGHub.Frame.TabsScrolling.UIListLayout
G2L["47"] = Instance.new("UIListLayout", G2L["46"]);
G2L["47"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
-- FINISH UI IN CODE
local Templates = G2L["22"]
local TabBtn = Templates.TabBtn
local TabTG = Templates.TabTG
local GameTeleporter = Templates.GameTeleporter
local Tabs = Templates.Parent.Tabs
local TabsScrolling = Tabs.Parent.TabsScrolling
local Label = Templates.Label
local success, env = pcall(function()
	return getgenv()
end)
local AutoRejoin = env.AutoRejoin or false

local function write(file, txt)
	pcall(function()
		if writefile then
			writefile(file, txt)
		end
	end)
end

local function read(file)
	local r = pcall(function()
		if readfile then
			return readfile(file)
		end
	end)
	return r
end

local function exstr(site)
	loadstring(game:HttpGet(site, true))()
end

function UIModule:AddBTN(tab, Btntxt, callback)
	local clone = TabBtn:Clone()
	clone.txt.Text = Btntxt
	clone.Parent = tab
	clone.MouseButton1Click:Connect(callback)
end

function UIModule:AddTG(tab, TGtxt, callback)
	local clone = TabTG:Clone()
	clone.txt.Text = TGtxt
	clone.Parent = tab
	
	local s = false
	
	clone.MouseButton1Click:Connect(function()
		s = not s
		clone.Status.Value = s
		if s == true then
			clone.Toggle.BackgroundColor3 = clone.Toggle.ON.Value
			clone.Toggle.ToggleOFF.Visible = false
			clone.Toggle.ToggleON.Visible = true
			callback(s)
		else
			clone.Toggle.BackgroundColor3 = clone.Toggle.OFF.Value
			clone.Toggle.ToggleOFF.Visible = true
			clone.Toggle.ToggleON.Visible = false
			callback(s)
		end
	end)
end

function UIModule:AddGT(tab, GtTxt, gameId)
	local clone = GameTeleporter:Clone()
	clone.Parent = tab
	clone.Text = GtTxt
	clone.MouseButton1Click:Connect(function()
		local plr = game.Players.LocalPlayer
		game:GetService("TeleportService"):Teleport(gameId, plr)
	end)
end

function UIModule:AddGameChecker(gameid, callback)
	if game.PlaceId == gameid then
		callback()
	end
end

function UIModule:AddLabel(Ltxt)
	local clone = Label:Clone()
	clone.Parent = TabsScrolling
	clone.txt.Text = Ltxt
end

function UIModule:Refresh(tab)
	for _,v in pairs(tab:GetChildren()) do
		if v:IsA("TextButton") then
			v:Destroy()
		end
	end
end

function UIModule:OpenTab(doFunc)
	selfM:Refresh(TabsScrolling)
	
	doFunc()
end

function UIModule:AddSettings()
	selfM:Refresh(TabsScrolling)
	
	selfM:AddTG(TabsScrolling, "Auto Rejoin(on kick)", function(v)
		AutoRejoin = v
		if AutoRejoin then
		local GuiService = game:GetService("GuiService")
		local Players = game:GetService("Players")
		local TeleportService = game:GetService("TeleportService")
		

		local player = Players.LocalPlayer

		local function onErrorMessageChanged(errorMessage)
			if errorMessage and errorMessage ~= "" and AutoRejoin then
				print("Error detected: " .. errorMessage)

				if player then
					wait()
					TeleportService:Teleport(game.PlaceId, player)
				end
			end
		end

		GuiService.ErrorMessageChanged:Connect(onErrorMessageChanged)
		end
	end)
end

function UIModule:AddHome()
	selfM:Refresh(TabsScrolling)
	
	selfM:AddLabel("Welcome in MMSGHub this is an hub with some games and more in the future!")
end

function UIModule:AddGames()
	selfM:Refresh(TabsScrolling)
	
	local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Games.lua", true))()
	for name, Game in pairs(Games) do
		selfM:AddGT(TabsScrolling, Game.Name, Game.Id)
	end
end

function UIModule:AddGame(id)
	selfM:Refresh(TabsScrolling)
	
	local Games = loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Games.lua", true))()
	local Game
	for name, g in pairs(Games) do
		if g.DoFunc then
			selfM:AddGameChecker(id, function()
				g.DoFunc(selfM, TabsScrolling)
			end)
			Game = g
		end
	end
end

function UIModule:AddUniversalCheats()
	selfM:Refresh(TabsScrolling)
	
	selfM:AddBTN(TabsScrolling, "Cobalt(Remote Spy)", function()
		exstr("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau")
	end)
	
	selfM:AddBTN(TabsScrolling, "Dex Explorer++", function()
		exstr("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua")
	end)
	
	selfM:AddBTN(TabsScrolling, "Infinite Yield", function()
		exstr("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source")
	end)
end

function UIModule:AddCredits()
	selfM:Refresh(TabsScrolling)
	
	selfM:AddLabel("UI --")
	selfM:AddLabel("@NiknameisMatteo")
	selfM:AddLabel("Module --")
	selfM:AddLabel("@NiknameisMatteo")
	selfM:AddLabel("Idea --")
	selfM:AddLabel("On YT @vaehz")
	selfM:AddLabel("On Roblox @esoreoner")
end

for _,btn in pairs(Tabs:GetChildren()) do
	if btn:IsA("TextButton") then
		btn.MouseButton1Click:Connect(function()
			selfM:OpenTab(function()
				if btn.Name == "Home" then
					selfM:AddHome()
				end
				if btn.Name == "Game" then
					selfM:AddGame(game.PlaceId)
				end
				if btn.Name == "Games" then
					selfM:AddGames()
				end
				if btn.Name == "Settings" then
					selfM:AddSettings()
				end
				if btn.Name == "UniversalCheats" then
					selfM:AddUniversalCheats()
				end
				if btn.Name == "Credits" then
					selfM:AddCredits()
				end
			end)
		end)
	end
end

return UIModule
