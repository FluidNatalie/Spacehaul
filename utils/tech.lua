-- 1.1 Libraies

-- Util library for technologies. Supports method chaining
-- Sample usage:
-- Tech:get("tech-name"):setCost(200):setColors("RG")

local Common = require "common"

--Tried to fix the define field erorrs using a solution from https://github.com/LuaLS/lua-language-server/issues/2245
--@class Tech
--@field setPrerequisites string
--@field [any] any
local Tech = {}
local techName = ""

-- Defines the tech you want to modify
function Tech:get(name)
  techName = name
  assert(data.raw["technology"][name], "Technology '"..name.."' not found")
  local technology = data.raw["technology"][name].normal or data.raw["technology"][name]
  setmetatable(technology, self)
  self.__index = self
  return technology
end

-- Creates a new technology by cloning an existing one
function Tech:cloneInto(from, into)
  Common.cloneInto("technology", from, into)
  return Tech:get(into)
end

-- Changes the cost of a Technology. It keeps the Science colors required
function Tech:setCost(count)
  self.unit.count = count
  return self
end

-- Changes the cost formula of a tech, this applies to infinite techs
function Tech:setCostFormula(formula)
  self.unit.count = nil
  self.unit.count_formula = formula
  return self
end

-- Changes the science packs (colors) required for the technology
-- R = Automation Science Pack, "Red Science"
-- G = Logistic Science Pack, "Green Science"
-- B = Chemical Science Pack, "Blue Science"
-- M = Military Science Pack, "Military Science"
-- P = Production Science Pack, "Purple Science"
-- Y = Utility Science Pack, "Yellow Science"
-- W = Space Science Pack, "White Science"
-- V = Metallurgic Science Pack, "Vulcanus Science"
-- F = Electromagnetic Science Pack, "Fulgoran Science"
-- A = Agricultural Science Pack, "Gleba Science"
-- C = Cryogenic Science Pack, "Aquilo Science"
-- S = Promethium Science Pack, "Shatterd Science"
function Tech:setColors(colors)
  local ingredients = {}
  if colors:find("R", 1, false) then
    table.insert(ingredients, {"automation-science-pack", 1})
  end
  if colors:find("G", 1, false) then
    table.insert(ingredients, {"logistic-science-pack", 1})
  end
  if colors:find("B", 1, false) then
    table.insert(ingredients, {"chemical-science-pack", 1})
  end
  if colors:find("M", 1, false) then
    table.insert(ingredients, {"military-science-pack", 1})
  end
  if colors:find("P", 1, false) then
    table.insert(ingredients, {"production-science-pack", 1})
  end
  if colors:find("Y", 1, false) then
    table.insert(ingredients, {"utility-science-pack", 1}) -- will probably not be used but still exists so that if I need it later I can reuse it.
  end
  if colors:find("W", 1, false) then
    table.insert(ingredients, {"space-science-pack", 1})
  end
  if colors:find("V", 1, false) then
    table.insert(ingredients, {"metallurgic-science-pack", 1})
  end
  if colors:find("F", 1, false) then
    table.insert(ingredients, {"electromagnetic-science-pack", 1})
  end
  if colors:find("A", 1, false) then
    table.insert(ingredients, {"agricultural-science-pack", 1})
  end
  if colors:find("C", 1, false) then
    table.insert(ingredients, {"cryogenic-science-pack", 1})
  end
  if colors:find("S", 1, false) then
    table.insert(ingredients, {"promethium-science-pack", 1})
  end

  self.unit.ingredients = ingredients
  return self
end

-- How much time one unit takes to research.
-- In a lab with a crafting speed of 1, it corresponds to the number of seconds.
function Tech:setTime(time)
  self.unit.time = time
  return self
end

-- Set the effects of researching the technology
-- see: https://lua-api.factorio.com/latest/types/Modifier.html
function Tech:setEffects(effects)
  self.effects = effects
  return self
end

-- Changes the prerequisites that enable this technology
function Tech:setPrerequisites(prerequisites)
  self.prerequisites = prerequisites
  return self
end

function Tech:disable()
  self.enabled = false
  self.hidden = true
  return self
end

-- Declare the technology as an infinite technology (it can get researched multiple times)
function Tech:setInfinite()
  self.max_level = "infinite"
  return self
end

-- Removes the technology altogether
-- Note: it might be the only way to deal with making infinite technologies shorter
function Tech:remove()
  data.raw["technology"][techName] = nil
  -- Note we don't return self here, as the technology is gone!
end

return Tech