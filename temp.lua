local elements = {}
local ele = elements

local ui = exstr("https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Hub.lua")
local Templates = ui:GetTemplates()
local TabsScrolling = ui:GetTabsScrolling()
local TabBtn = Templates.TabBtn
local TabTG = Templates.TabTG
local GameTeleporter = Templates.GameTeleporter
local Tabs = Templates.Parent.Tabs
local TabsScrolling = Tabs.Parent.TabsScrolling
local Label = Templates.Label

function ele:BTN(tab, Btntxt, callback)
   local clone = TabBtn:Clone()
   clone.txt.Text = Btntxt
   clone.Parent = tab
   clone.MouseButton1Click:Connect(callback)
end

function ele:TG(tab, TGtxt, current, callback)
   local clone = TabTG:Clone()
	clone.txt.Text = TGtxt
	clone.Parent = tab

	local state = current or false

	local function updateUI()
		if state then
			clone.Toggle.BackgroundColor3 = clone.Toggle.ONTG.Value
			clone.Toggle.ToggleOFF.Visible = false
			clone.Toggle.ToggleON.Visible = true
		else
			clone.Toggle.BackgroundColor3 = clone.Toggle.OFFTG.Value
			clone.Toggle.ToggleOFF.Visible = true
			clone.Toggle.ToggleON.Visible = false
		end
	end

	updateUI()
	callback(state)

	clone.MouseButton1Click:Connect(function()
		state = not state
		clone.Status.Value = state
		updateUI()
		callback(state)
	end)
end

function ele:GT(tab, GtTxt, gameId)
   local clone = GameTeleporter:Clone()
	clone.Parent = tab
	clone.txt.Text = GtTxt
	clone.MouseButton1Click:Connect(function()
		local plr = game.Players.LocalPlayer
		game:GetService("TeleportService"):Teleport(gameId, plr)
	end)
end

function ele:GC(place1, place2, callback)
   if place1 == place2 then
		callback()
	end
end

function ele:L(Ltxt)
   local clone = Label:Clone()
   clone.Parent = TabsScrolling
   clone.txt.Text = Ltxt
end

function ele:

return elements