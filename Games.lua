local env = getgenv()
local LoadingGame = false
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
		return readed
	else
		return nil
	end
end

function env.ensureFolder(path)
    if not isfolder(path) then
        makefolder(path)
    end
end

function env.SaveConfig(savedata)
	local p = game.PlaceId
	local tp = tostring(p)
    local folderPath = "CheaterHub/"..tp
    ensureFolder(folderPath)
    writefile(folderPath .. "/Config.json", game:GetService("HttpService"):JSONEncode(savedata))
end

function env.GetGithubPath(path)
	local GamesFolderpath = "https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Games/"
	local Hubpath = "https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Hub.lua"
	local Gamespath = "https://raw.githubusercontent.com/GamerScripter-coder/CheaterHub/refs/heads/main/Games.lua"
	if path == "GamesFolder" then
		return GamesFolderpath
	end
	if path == "Hub" then
		return Hubpath
	end
	if path == "Games" then
		return Gamespath
	end
end

local function GetGameName(id)
   local MarketplaceService = game:GetService("MarketplaceService")
	
   local info = MarketplaceService:GetProductInfo(id)

   return info.Name
end

function env.exstr(site)
	return loadstring(game:HttpGet(site, true))()
end

local function exstrICWD(code)
	return loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter-coder/Decoder/refs/heads/main/DecodeAndExecute.lua", true))():ExecuteEncodedCode(code)
end

function env.GaveGame(site, M, T)
	local func = loadstring(game:HttpGet(site, true))
	local load = func()
	load(M, T, ImportantTable)
end

local Games = {
	["Lucky Block Rush"] = {
		Name = GetGameName(84575720768520),
		Id = 84575720768520,
		DoFunc = function(module, TabsScrolling)
			if LoadingGame then return end
			LoadingGame = true
			GaveGame(GetGithubPath("GamesFolder").."/"..tostring(game.PlaceId)..".lua", module, TabsScrolling)
			LoadingGame = false
		end
	},
	["Be An Admin"] = {
		Name = "Be An Admin",
		Id = 79462658240386,
		DoFunc = function(module, TabsScrolling)
			if LoadingGame then return end
			LoadingGame = true
			GaveGame(GetGithubPath("GamesFolder").."/"..tostring(game.PlaceId)..".lua", module, TabsScrolling)
			LoadingGame = false
	    end
	},
	["Pilfering Pirates"] = {
		Name = GetGameName(6104994594),
		Id = 6104994594,
		DoFunc = function(module, TabsScrolling)
			if LoadingGame then return end
			LoadingGame = true
			GaveGame(GetGithubPath("GamesFolder").."/"..tostring(game.PlaceId)..".lua", module, TabsScrolling)
			LoadingGame = false
		end
	},
	["Become a Brainrot"] = {
		Name = GetGameName(99255447043899),
		Id = 99255447043899,
		DoFunc = function(module, TabsScrolling)			
			if LoadingGame then return end
			LoadingGame = true
			GaveGame(GetGithubPath("GamesFolder").."/"..tostring(game.PlaceId)..".lua", module, TabsScrolling)
			LoadingGame = false
		end
	},
	["Kick a Lucky Block"] = {
		Name = GetGameName(89469502395769),
		Id = 89469502395769,
		DoFunc = function(module, TabsScrolling)
			if LoadingGame then return end
			LoadingGame = true
			GaveGame(GetGithubPath("GamesFolder").."/"..tostring(game.PlaceId)..".lua", module, TabsScrolling)
			LoadingGame = false
		end
	},
	["Scream for Brainrots"] = {
		Name = GetGameName(94780005879799),
		Id = 94780005879799,
		DoFunc = function(module, TabsScrolling)
			local selfMod = module
			local TS = TabsScrolling

			local AddSpin = game.ReplicatedStorage.Remotes.AddSpin
			local ExitWheel = game.ReplicatedStorage.Remotes.SpinEventWheel
			local plr = game.Players.LocalPlayer
			local base
			local AutoCollect
			local GiveSpins
			local GiveOGN = 4
			local GiveScreamN = 3
			local GiveSleepyN = 5

			for _,plot in pairs(workspace.Bases:GetChildren()) do
				if plot:GetAttribute("OwnerID") == plr.UserId then
					base = plot
				end
			end

			selfMod:AddLabel("Work in progress")
		end
	}
}

function Games:GetGame(name)
	return Games[name] or nil
end

return Games
