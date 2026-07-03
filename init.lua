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

exstr("https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Hub.lua")

