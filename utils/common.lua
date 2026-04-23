-- Common utilities

--Tried to fix the define field erorrs using a solution from https://github.com/LuaLS/lua-language-server/issues/2245
--@class Common
--@field [any] any
local Common = {}
function Common.config(name)
  return settings.startup['uncl_uh-'..name].value
end

-- Clones a prototype. Input is a prototype type ("recipe", "armor", etc), an
-- existing object of that prototype ("heavy-armor"), and the name for the clone
-- Retuns the clone
function Common.cloneInto(prototype, from, into)
  data.raw[prototype][into] = table.deepcopy(data.raw[prototype][from])
  data.raw[prototype][into].name = into;
  return data.raw[prototype][into]
end

return Common