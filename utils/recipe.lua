-- 1.1 Libraies

-- Util library for recipes. Supports method chaining
-- Sample usage:
-- Recipe:get("recipe-name"):setCost(200)

local Common = require "common"

--Tried to fix the define field erorrs using a solution from https://github.com/LuaLS/lua-language-server/issues/2245
--@class Recipe
--@field [any] any
local Recipe = {}
local recipeName = ""

function Recipe:get(name)
  recipeName = name
  assert(data.raw["recipe"][name], "Recipe '"..name.."' not found")
  local recipe = data.raw["recipe"][name].normal or data.raw["recipe"][name]
  setmetatable(recipe, self)
  self.__index = self
  return recipe
end

-- Creates a new recipe by cloning an existing one
function Recipe:cloneInto(from, into)
  Common.cloneInto("recipe", from, into)
  return Recipe:get(into)
end

-- Changes the Recipe ingredients (the input)
function Recipe:setIngredients(ingredients)
  self.ingredients = ingredients
  return self
end

-- Changes the Recipe products (the output)
function Recipe:setProducts(products)
  self.results = products
  return self
end

-- Changes the amount of energy (or seconds for crafting at speed 1)
function Recipe:setEnergy(energy_required)
  self.energy_required = energy_required
  return self
end

-- 2.0: Changes the allowed module effects on the recipe
-- E = Energy consumption
-- S = Speed
-- P = Productivity
-- D = Pollution, "Dirty"
-- Q = Quality
function Recipe:setModules(modules)

  if modules:find("E", 1, false) then --allow_consumption
    self.allow_consumption = true
  else
    self.allow_consumption = false
  end

  if modules:find("S", 1, false) then --allow_speed
    self.allow_speed = true
  else
    self.allow_speed = false
  end

  if modules:find("P", 1, false) then --allow_productivity
    self.allow_productivity = true
  else
    self.allow_productivity = false
  end
  
  if modules:find("D", 1, false) then --allow_pollution
    self.allow_pollution = true
  else
    self.allow_pollution = false
  end

  if modules:find("Q", 1, false) then --allow_quality
    self.allow_quality = true
  else
    self.allow_quality = false
  end

  return self
end

-- Disable the recipe
function Recipe:disable()
  self.enabled = false
  return self
end

-- DLC: Changes the surface_conditions (The surface conditions of the recipes)
function Recipe:setConditions(surface_conditions)
  self.surface_conditions = surface_conditions
  return self
end

-- DLC: set the auto_recycle flag to be true or false (The automated recycling recipes)
function Recipe:setRecycle(auto_recycle)
  self.auto_recycle = auto_recycle
  return self
end

return Recipe