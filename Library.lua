local Library = {
  ["84575720768520"] = {
    Services = {}
  }
}

function Library:GetLibrary(id)
  local lib = Library[id]
  if lib then
    return lib
  end
end

function Library:GetLibServices(lib)
  
end

return Library
