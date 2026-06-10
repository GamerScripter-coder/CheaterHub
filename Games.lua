local Games = {}
local RealGamesIDS = {
  84575720768520 = "Lucky Block Rush"
}

local RealGameNames = {
  [84575720768520] = "Lucky Block Rush"
}
  
function Games.GetGamesIDS()
  return RealGamesIDS
end

function Games.GetGamesNames()
  return RealGameNames
end

return Games
