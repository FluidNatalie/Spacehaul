-- 2.0 Additions

-- Lube replacement function by Juh9870 on discord
-- https://discord.com/channels/139677590393716737/1217401074877599745/1475917696318177371

--[[
local replacements = {
  ["lubricant"] = "heavy-oil", -- add more as needed
}
for _, recipe in pairs(data.raw["recipe"]) do
  if recipe.ingredients ~= nil then
    for _, ing in recipe.ingredients then
      if replacements[ing.name] then ing.name = replacements[ing.name] end
    end
  end
  if recipe.results ~= nil then
    for _, res in recipe.results then
      if replacements[res.name] then res.name = replacements[res.name] end
    end
  end
  if replacements[recipe.main_product] then recipe.main_product = replacements[recipe.main_product] end
end
]]--


-- Item replacement function by BlackATM
-- https://github.com/MrSmoothieHuman1/periodic-madness/blob/main/data-final-fixes.lua#L84-L127


local item_replacements = {
	["lubricant"] = "heavy-oil"
}

local removals = {}
for recipe_name, recipe in pairs(data.raw["recipe"]) do
	if item_replacements[recipe.main_product] then
		table.insert(removals, recipe_name)
		goto continue --Go to next recipe because this one will be removed
	end
	if recipe.results then
		for _, result in pairs(recipe.results) do
			if item_replacements[result.name] then
				table.insert(removals, recipe_name)
				goto continue --Go to next recipe because this one will be removed
			end
		end
	end
	if recipe.ingredients then
		for _, ingedient in pairs(recipe.ingredients) do
			if item_replacements[ingedient.name] then
				ingedient.name = item_replacements[ingedient.name]
			end
		end
	end
	::continue::
end

for _, removal in pairs(removals) do
	data.raw["recipe"][removal].hidden = true
	data.raw["recipe"][removal].hidden_in_factoriopedia = true
end

for item in pairs(item_replacements) do
	for item_type in pairs(defines.prototypes.item) do
		local item_lookup = data.raw[item_type]
		if item_lookup and item_lookup[item] then
			item_lookup[item].hidden = true
			item_lookup[item].hidden_in_factoriopedia = true
		end
	end
end



-- 1.1 Libraies

-- Util library for recipes. Supports method chaining
-- Sample usage:
-- Recipe:get("recipe-name"):setCost(200):setColors("RG")

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

-- Disable the recipe
function Recipe:disable()
  self.enabled = false
  return self
end

return Recipe