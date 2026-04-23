-- We'll change a bunch of recipes and technologies from Vanilla
local Common = require "utils.common"
local Recipe = require "utils.recipe"
local Tech = require "utils.tech"

require("__Spacehaul__.space_age_files.factoriopedia")

-- Key changes:
-- Cheaper steel (3 iron plates, instead of 5)
-- Ratio of copper cable to Green circuits is 1:1 (instead of 3:2)
-- Cheaper Red circuits (1 plastic bar, instead of 2)
-- Cheaper Blue circuits (10 GCs, instead of 20)
-- Science ratio (for R:G:M:B:P:Y) is 5:5:5:6:6:6 (instead of 5:6:5:12:7:7)
-- Reduce the number of bonus technologies. They are fewer but give bigger bonuses
-- Remove technologies that most people don't use (like combat robots)

-- 2.0 Migration Notes (by FluidNatalie)
-- uh: has been changed to uh_
-- uncl:uh has been changed to uh_
-- things such as prototype names have been changed
-- fixed recipe syntax
-- fixed module syntax


--Startup recipes

-- Set belt to be enabled at the begining
data.raw["recipe"]["transport-belt"].enabled = false
data.raw["recipe"]["fast-transport-belt"].enabled = true
-- Disable small electric pole, replace with medium electric pole
data.raw["recipe"]["small-electric-pole"].enabled = false
data.raw["recipe"]["alt-electric-pole"].enabled = true
-- Set iron chest to be the default
data.raw["recipe"]["wooden-chest"].enabled = false
data.raw["recipe"]["iron-chest"].enabled = true
-- Disable stone furnace, replace with steel frunace
data.raw["recipe"]["stone-furnace"].enabled = false
data.raw["recipe"]["steel-furnace"].enabled = true

--------------------
-- RECIPE CHANGES --
--------------------

Recipe:get("boiler"):setIngredients({
  {type= "item", name= "pipe", amount= 4},
  {type= "item", name= "steel-furnace", amount= 1}
})
Recipe:get("burner-mining-drill"):setIngredients({
  {type= "item", name= "iron-gear-wheel", amount= 3},
  {type= "item", name= "iron-plate", amount= 3},
  {type= "item", name= "steel-furnace", amount= 1}
})

-- Set belt recipes to the correct amounts
Recipe:get("fast-transport-belt"):setIngredients({
  {type= "item", name= "iron-gear-wheel", amount= 1},
  {type= "item", name= "iron-plate", amount= 1}
})
:setProducts({
  {type= "item", name= "fast-transport-belt", amount= 2},
})

Recipe:get("fast-splitter"):setIngredients({
  {type= "item", name= "electronic-circuit", amount= 5},
  {type= "item", name= "iron-plate", amount= 5},
  {type= "item", name= "fast-transport-belt", amount= 4}
}):setEnergy(1)

Recipe:get("fast-underground-belt"):setIngredients({
  {type= "item", name= "iron-plate", amount= 10},
  {type= "item", name= "fast-transport-belt", amount= 5}
}):setEnergy(1)

-- Set belt recipes to the correct amounts
Recipe:get("torbo-transport-belt"):setIngredients({
  {type= "item", name= "fast-transport-belt", amount= 1},
  {type= "item", name= "tungsten-plate", amount= 5},
  {type= "fluid", name= "heavy-oil", amount= 20}
})

Recipe:get("turbo-splitter"):setIngredients({
  {type= "item", name= "fast-splitter", amount= 1},
  {type= "item", name= "tungsten-plate", amount= 15},
  {type= "item", name= "processing-unit", amount= 15},
  {type= "fluid", name= "heavy-oil", amount= 80}
})

Recipe:get("turbo-underground-belt"):setIngredients({
  {type= "item", name= "fast-underground-belt", amount= 2},
  {type= "item", name= "tungsten-plate", amount= 40},
  {type= "fluid", name= "heavy-oil", amount= 40}
})



-- Set the recipe for the inserter to correct
Recipe:get("fast-inserter"):setIngredients({
  {type= "item", name= "iron-gear-wheel", amount= 1},
  {type= "item", name= "iron-plate", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 1}
})
-- Set the recipe for the inserter to correct
Recipe:get("stack-inserter"):setIngredients({
  {type= "item", name= "fast-inserter", amount= 1},
  {type= "item", name= "carbon-fiber", amount= 2},
  {type= "item", name= "jelly", amount= 10},
  {type= "item", name= "processing-unit", amount= 1}
})
-- Set the recipe for the long handed inserter to correct
Recipe:get("long-handed-inserter"):setIngredients({
  {type= "item", name= "iron-gear-wheel", amount= 1},
  {type= "item", name= "iron-plate", amount= 1},
  {type= "item", name= "fast-inserter", amount= 1}
})

--Set recipe to be the correct one
Recipe:get("steel-furnace"):setIngredients({
  {type= "item", name= "stone", amount= 5}
}):setEnergy(0.5)

-- Medium electric pole. Change cost from 2copper+2steel+2ironSticks -> 4copperCable+2steel
Recipe:get("medium-electric-pole"):setIngredients({
  {type= "item", name= "copper-cable", amount= 4},
  {type= "item", name= "steel-plate", amount= 2}
})
-- Big electric pole. Change cost from 5copper+5steel+8ironSticks -> 8copperCable+5steel
Recipe:get("big-electric-pole"):setIngredients({
  {type= "item", name= "copper-cable", amount= 8},
  {type= "item", name= "steel-plate", amount= 5}
})

-- Pipe to ground. Reduce iron plate cost from 5 -> 2
Recipe:get("pipe-to-ground"):setIngredients({
  {type= "item", name= "iron-plate", amount= 2},
  {type= "item", name= "pipe", amount= 10}
})

-- Rail. Change cost from 1stone+1steel+1ironStick -> 1stone+2steel
Recipe:get("rail"):setIngredients({
  {type= "item", name= "stone", amount= 1},
  {type= "item", name= "steel-plate", amount= 2}
})
-- Train stop. Change cost from 6iron+3steel+6ironStick+5GC -> 8iron+3steel+5GC
Recipe:get("train-stop"):setIngredients({
  {type= "item", name= "iron-plate", amount= 8},
  {type= "item", name= "steel-plate", amount= 3},
  {type= "item", name= "electronic-circuit", amount= 5}
})
-- Locomotive. Reduce engine cost from 20 -> 10
Recipe:get("locomotive"):setIngredients({
  {type= "item", name= "steel-plate", amount= 30},
  {type= "item", name= "electronic-circuit", amount= 10},
  {type= "item", name= "engine-unit", amount= 10}
})

Recipe:get("electric-engine-unit"):setIngredients({
  {type= "item", name= "engine-unit", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 2},
  {type= "fluid", name= "heavy-oil", amount= 15}
})

Recipe:get("foundry"):setIngredients({
  {type= "item", name= "concrete", amount= 20},
  {type= "item", name= "steel-plate", amount= 50},
  {type= "item", name= "tungsten-plate", amount= 40},
  {type= "item", name= "electronic-circuit", amount= 30},
  {type= "fluid", name= "heavy-oil", amount= 20}
})


-- Spidertron. Reduce cost from 1fish+16RCU+150LDS+2efficiencyMod3+4rocketLauncher+2portableFusionReactor+4exoskeletons+2radar
-- -> 1fish+8RCU+80LDS+1efficiencyMod3+4rocketLauncher+1portableFusionReactor+4exoskeletons+2radar
Recipe:get("spidertron"):setIngredients({
  {type= "item", name= "raw-fish", amount= 1},
  {type= "item", name= "processing-unit", amount= 8},
  {type= "item", name= "low-density-structure", amount= 80},
  {type= "item", name= "efficiency-module-3", amount= 1},
  {type= "item", name= "rocket-launcher", amount= 4},
  {type= "item", name= "fission-reactor-equipment", amount= 1},
  {type= "item", name= "exoskeleton-equipment", amount= 4},
  {type= "item", name= "radar", amount= 2}
})

-- Roboport. Reduce cost from 45steel+45gear+45RC -> 30steel+30gear+30RC
Recipe:get("roboport"):setIngredients({
  {type= "item", name= "steel-plate", amount= 30},
  {type= "item", name= "iron-gear-wheel", amount= 30},
  {type= "item", name= "advanced-circuit", amount= 30}
})

-- Programmable speaker. Change cost from 3iron+5copper+4ironSticks+4GC -> 5iron+5copper+4GC
Recipe:get("programmable-speaker"):setIngredients({
  {type= "item", name= "iron-plate", amount= 5},
  {type= "item", name= "copper-plate", amount= 5},
  {type= "item", name= "electronic-circuit", amount= 4}
})

-- Refined concrete. Change cost from
-- 1steel+8ironSticks+20concrete+100water=10refinedConcrete ->
-- 2steel+20concrete+100water=10refinedConcrete
Recipe:get("refined-concrete"):setIngredients({
  {type= "item", name= "steel-plate", amount= 2},
  {type= "item", name= "concrete", amount= 20},
  {type= "fluid", name= "water", amount= 100}
})

-- Landfill. Reduce stone cost from 20 -> 10
Recipe:get("landfill"):setIngredients({
  {type= "item", name= "stone", amount= 10}
})

-- Cliff explosives. Reduce cost from 10explosives+1emptyBarrel+1grenade -> 6explosives+1emptyBarrel
Recipe:get("cliff-explosives"):setIngredients({
  {type= "item", name= "explosives", amount= 6},
  {type= "item", name= "barrel", amount= 1}
}):setEnergy(5) -- Reduce crafting time from 8 -> 5 seconds

-- Solar panel cost changed from 5copper+15GC+5steel -> 4copper+16GC+8steel
Recipe:get("solar-panel"):setIngredients({
  {type= "item", name= "copper-plate", amount= 4},
  {type= "item", name= "steel-plate", amount= 8},
  {type= "item", name= "electronic-circuit", amount= 16}
})
-- Solar panel electricity output increased from 60kw -> 80kW (full daylight).
-- Avg 42kW -> 56kW
data.raw["solar-panel"]["solar-panel"].production = "80kW"
-- Make collision box smaller so that we can fix between 2 solar panels!
if Common.config "squeak-solar-panels" then
  data.raw["solar-panel"]["solar-panel"].collision_box = {{-1.25, -1.25}, {1.25, 1.25}}
end

-- Solar panel to accumulator ratio changed from 25:21 -> 4:1
-- Accumulator. Increase capacity from 5MJ -> 22.4MJ
data.raw["accumulator"]["accumulator"].energy_source.buffer_capacity = "22.4MJ"
-- Increase max input and out from 300kW -> 1MW
data.raw["accumulator"]["accumulator"].energy_source.input_flow_limit = "1MW"
data.raw["accumulator"]["accumulator"].energy_source.output_flow_limit = "1MW"

-- Nuclear reactor. Reduce cost from 500copper+500steel+500RC+500concrete -> 300copper+300steel+200RC+200concrete
Recipe:get("nuclear-reactor"):setIngredients({
  {type= "item", name= "copper-plate", amount= 300},
  {type= "item", name= "steel-plate", amount= 300},
  {type= "item", name= "advanced-circuit", amount= 200},
  {type= "item", name= "concrete", amount= 200}
})

-- Lab now has the correct recipe
Recipe:get("lab"):setIngredients({
  {type= "item", name= "iron-gear-wheel", amount= 10},
  {type= "item", name= "electronic-circuit", amount= 10},
  {type= "item", name= "fast-transport-belt", amount= 4}
})

-- Remove beacon recipe
Recipe:get("beacon"):disable()

-- Burner mining drill. Redice crafting time from 2s -> 1s
Recipe:get("burner-mining-drill"):setEnergy(1)

-- Electric mining drill. Reduce crafting time from 2s -> 1s
Recipe:get("electric-mining-drill"):setEnergy(1)

-- Electric furnace. Reduce RC cost from 5 -> 2
Recipe:get("electric-furnace"):setIngredients({
  {type= "item", name= "steel-plate", amount= 10},
  {type= "item", name= "advanced-circuit", amount= 2},
  {type= "item", name= "stone-brick", amount= 10}
})

-- Change assembling mashine 2 recipe
Recipe:get("assembling-machine-2"):setIngredients({
  {type= "item", name= "iron-gear-wheel", amount= 5},
  {type= "item", name= "iron-plate", amount= 9},
  {type= "item", name= "electronic-circuit", amount= 3}
})

-- Centrifuge. Reduce cost from 50steel+100gear+100RC+100concrete -> 50steel+50gear+50RC+50concrete
Recipe:get("centrifuge"):setIngredients({
  {type= "item", name= "steel-plate", amount= 50},
  {type= "item", name= "iron-gear-wheel", amount= 50},
  {type= "item", name= "advanced-circuit", amount= 50},
  {type= "item", name= "concrete", amount= 50}
})

-- Set the recipe for the active provider chest to correct
Recipe:get("active-provider-chest"):setIngredients({
  {type= "item", name= "iron-chest", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 3},
  {type= "item", name= "advanced-circuit", amount= 1}
})
-- Set the recipe for the buffer chest to correct
Recipe:get("buffer-chest"):setIngredients({
  {type= "item", name= "iron-chest", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 3},
  {type= "item", name= "advanced-circuit", amount= 1}
})
-- Set the recipe for the passive provider chest to correct
Recipe:get("passive-provider-chest"):setIngredients({
  {type= "item", name= "iron-chest", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 3},
  {type= "item", name= "advanced-circuit", amount= 1}
})
-- Set the recipe for the active provider chest to correct
Recipe:get("requester-chest"):setIngredients({
  {type= "item", name= "iron-chest", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 3},
  {type= "item", name= "advanced-circuit", amount= 1}
})
-- Set the recipe for the active provider chest to correct
Recipe:get("storage-chest"):setIngredients({
  {type= "item", name= "iron-chest", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 3},
  {type= "item", name= "advanced-circuit", amount= 1}
})

-- MODULES --
-- changed 'efficiency' to be correct for 2.0
local modules =  {"speed-module", "productivity-module", "efficiency-module"}
for i,m in ipairs(modules) do
  -- Module 1. Reduce crafting time from 15 -> 10s
  Recipe:get(m):setEnergy(10)

  -- Module 2. Reduce cost from 5RC+5BC+4mod1 -> 3RC+3BC+3mod1
  Recipe:get(m.."-2"):setIngredients({
    {type= "item", name= "advanced-circuit", amount= 3},
    {type= "item", name= "processing-unit", amount= 3},
    {type= "item", name= m, amount= 3}
  }):setEnergy(15)-- Reduce crafting time from 30 -> 15s

  -- Module 3. Reduce cost from 5RC+5BC+5mod2 -> 4RC+4BC+4mod2
  Recipe:get(m.."-3"):setIngredients({
    {type= "item", name= "advanced-circuit", amount= 4},
    {type= "item", name= "processing-unit", amount= 4},
    {type= "item", name= m.."-2", amount= 4}
  }):setEnergy(20)-- Reduce crafting time from 60 -> 20s
end

-- Rocket silo. Reduce from 1000steel+200BC+200electricEngine+100pipe+1000concrete ->
-- -> 500steel+100BC+100electricEngine+500concrete
Recipe:get("rocket-silo"):setIngredients({
  {type= "item", name= "steel-plate", amount= 500},
  {type= "item", name= "processing-unit", amount= 100},
  {type= "item", name= "electric-engine-unit", amount= 100},
  {type= "item", name= "concrete", amount= 500}
})

-- Satellite. Reduce from from 100BC+100LDS+100solarPanel+100accumulator+50rocketFuel+5radar -> 50BC+50LDS+50solarPanel+50accumulator
Recipe:get("satellite"):setIngredients({
  {type= "item", name= "processing-unit", amount= 50},
  {type= "item", name= "low-density-structure", amount= 50},
  {type= "item", name= "solar-panel", amount= 50},
  {type= "item", name= "accumulator", amount= 50}
})

-- Steel plate. Reduce the iron cost from 5 -> 3
Recipe:get("steel-plate"):setIngredients({
  {type= "item", name= "iron-plate", amount= 3}
}):setEnergy(9.6)-- Reduce crafting time from 16 -> 9.6 seconds

-- Battery. Reduce crafting time from 4 -> 3 seconds
Recipe:get("battery"):setEnergy(3)

-- Explosives. Reduce crafting time from 4 -> 3 seconds
Recipe:get("explosives"):setEnergy(3)

-- Uranium processing. Reduce uranium ore cost from 10 -> 8
Recipe:get("uranium-processing"):setIngredients({
  {type= "item", name= "uranium-ore", amount= 8}
})
--Reduce crafting time from 12 -> 8s. Overall effect: 1 ore per second
Recipe:get("uranium-processing"):setEnergy(8)


-- GREEN CIRCUIT --
--> Copper cable + Green cicuit assembler ratio changes from 3:2 -> 1:1
-- Copper cable. Reduce crafting time from 0.5 -> 0.4 seconds
Recipe:get("copper-cable"):setEnergy(0.4)
-- Green circuit. Increase crafting time from 0.5 -> 0.6 seconds
Recipe:get("electronic-circuit"):setEnergy(0.6)

-- RED CIRCUIT --
-- Reduce crafting time from 6 -> 3 seconds
Recipe:get("advanced-circuit"):setEnergy(3)
-- Reduce plastic cost from 2 -> 1
-- Reduce copper cable cost from 4 -> 3
:setIngredients({
  {type= "item", name= "plastic-bar", amount= 1},
  {type= "item", name= "copper-cable", amount= 3},
  {type= "item", name= "electronic-circuit", amount= 2}
})

-- BLUE CIRCUIT --
-- Reduce Green circuit cost from 20 -> 10
Recipe:get("processing-unit"):setIngredients({
  {type= "item", name= "electronic-circuit", amount= 10},
  {type= "item", name= "advanced-circuit", amount= 2},
  {type= "fluid", name= "sulfuric-acid", amount= 5}
})
-- Reduce crafting time from 10 -> 6 seconds
Recipe:get("processing-unit"):setEnergy(6)

-- Engine unit. Reduce crafting time from 10 -> 6 seconds
Recipe:get("engine-unit"):setEnergy(6)
-- Reduce pipe cost from 2 -> 1
:setIngredients({
  {type= "item", name= "steel-plate", amount= 1},
  {type= "item", name= "iron-gear-wheel", amount= 1},
  {type= "item", name= "pipe", amount= 1}
})
-- Flying robot frame. Reduce crafting time from 20 -> 12 seconds
Recipe:get("flying-robot-frame"):setEnergy(12)

-- Low Density Structure. Reduce cost from 20copper+10steel+5plastic -> 12copper+6steel+3plastic -- this is completely false but really funny
Recipe:get("low-density-structure"):setIngredients({
  {type= "item", name= "copper-plate", amount= 20},
  {type= "item", name= "steel-plate", amount= 2},
  {type= "item", name= "plastic-bar", amount= 5}
})
-- Reduce crafting time from 20 -> 15 seconds
Recipe:get("low-density-structure"):setEnergy(15)

-- Rocket fuel. Reduce cost from 10solidFuel+10lightOil -> 5solidFuel+10lightOil?
Recipe:get("rocket-fuel"):setIngredients({
  {type= "item", name= "solid-fuel", amount= 5},
  {type= "fluid", name= "light-oil", amount= 10}
}):setEnergy(15)-- Reduce crafting time from 30 -> 15 seconds

-- Kovarex. Make the kickstart cheaper from 40u235+5u238 = 41u235+2u238
-- -> 20u235+5u238 = 21u235+2u238
Recipe:get("kovarex-enrichment-process"):setIngredients({
  {type= "item", name= "uranium-235", amount= 20},
  {type= "item", name= "uranium-238", amount= 5}
})
:setProducts({
  {type= "item", name= "uranium-235", amount= 21},
  {type= "item", name= "uranium-238", amount= 2}
})

-- Red science. Already at desired ratio!
-- Green science. Reduce crafting time from 6 -> 5s
Recipe:get("logistic-science-pack"):setIngredients({
  {type= "item", name= "fast-inserter", amount= 1},
  {type= "item", name= "fast-transport-belt", amount= 1}
}):setEnergy(5)
-- Gray (Military) science. Already at desired ratio!
-- Blue science. Reduce crafting time from 24 -> 12s
Recipe:get("chemical-science-pack"):setEnergy(12)
-- Purple science. Reduce crafting time from 21 -> 18s
Recipe:get("production-science-pack"):setEnergy(18)
-- change to new recipe
:setIngredients({
  {type= "item", name= "rail", amount= 20},
  {type= "item", name= "flying-robot-frame", amount= 1},
  {type= "item", name= "processing-unit", amount= 2}
})
-- Yellow science removed
Recipe:get("utility-science-pack"):disable()

-- Grenade. Reduce crafting time from 8 -> 5s
Recipe:get("grenade"):setEnergy(5)
-- Reduce cost from 10coal+5iron -> 4coal+4iron
:setIngredients({
  {type= "item", name= "coal", amount= 4},
  {type= "item", name= "iron-plate", amount= 4}
})

-- Heavy armor. Reduce copper cost from 100 -> 50
Recipe:get("heavy-armor"):setIngredients({
  {type= "item", name= "copper-plate", amount= 50},
  {type= "item", name= "steel-plate", amount= 50}
})

-- Modular armor. Reduce RC cost from 30 -> 25
Recipe:get("modular-armor"):setIngredients({
  {type= "item", name= "steel-plate", amount= 50},
  {type= "item", name= "advanced-circuit", amount= 25}
})

-- Power armor. Change recipe from 40steel+40BC+20electricEngine -> 40steel+20BC+10electricEngine
Recipe:get("power-armor"):setIngredients({
  {type= "item", name= "steel-plate", amount= 40},
  {type= "item", name= "processing-unit", amount= 20},
  {type= "item", name= "electric-engine-unit", amount= 10}
})

-- Power armor MK2. Change recipe from 60BC+40electricEngine+30LDS+25speedMod2+25efficiencyMod2
-- -> 20electricEngine+20LDS+10speedMod2+10efficiencyMod2
Recipe:get("power-armor-mk2"):setIngredients({
  {type= "item", name= "electric-engine-unit", amount= 20},
  {type= "item", name= "low-density-structure", amount= 20},
  {type= "item", name= "speed-module-2", amount= 10},
  {type= "item", name= "efficiency-module-2", amount= 10}
})

-- Portable fission, previouly fusion, reactor. Reduce BC cost from 200 -> 100
Recipe:get("fission-reactor-equipment"):setIngredients({
  {type= "item", name= "processing-unit", amount= 100},
  {type= "item", name= "low-density-structure", amount= 50},
  {type= "item", name= "uranium-fuel-cell", amount= 1}
})

-- Personal battery MK2. Change recipe from 15BC+5LDS+10personalBattery
-- -> 8BC+8LDS+8personalBattery
Recipe:get("battery-mk2-equipment"):setIngredients({
  {type= "item", name= "processing-unit", amount= 8},
  {type= "item", name= "low-density-structure", amount= 8},
  {type= "item", name= "battery-equipment", amount= 8}
})

-- Personal roboport. Change recipe from 20steel+45battery+40gear+10RC
-- -> 20steel+10battery+10gear+10RC
Recipe:get("personal-roboport-equipment"):setIngredients({
  {type= "item", name= "steel-plate", amount= 20},
  {type= "item", name= "battery", amount= 10},
  {type= "item", name= "iron-gear-wheel", amount= 10},
  {type= "item", name= "advanced-circuit", amount= 10}
})

-- Personal roboport MK2. Change recipe from 100BC+20LDS+5roboport
-- -> 25BC+25LDS+5roboport
Recipe:get("personal-roboport-mk2-equipment"):setIngredients({
  {type= "item", name= "processing-unit", amount= 25},
  {type= "item", name= "low-density-structure", amount= 25},
  {type= "item", name= "personal-roboport-equipment", amount= 5}
})

-- Energy shield MK2. Reduce energy shield cost from 10 -> 6
Recipe:get("energy-shield-mk2-equipment"):setIngredients({
  {type= "item", name= "processing-unit", amount= 5},
  {type= "item", name= "low-density-structure", amount= 5},
  {type= "item", name= "energy-shield-equipment", amount= 6}
})

-- Personal laser defense. Reduce laser turret cost from 5 -> 2
Recipe:get("personal-laser-defense-equipment"):setIngredients({
  {type= "item", name= "processing-unit", amount= 20},
  {type= "item", name= "low-density-structure", amount= 5},
  {type= "item", name= "laser-turret", amount= 2}
})

-- Gun turret. Reduce crafting time from 8s -> 1s
Recipe:get("gun-turret"):setEnergy(1)

-- Radar. Reduce power usage from 300kW -> 150kW
-- Sectors are slighly cheaper/faster to scan
local radarEntity = data.raw["radar"]["radar"]
radarEntity.energy_usage = "150kW"
radarEntity.energy_per_sector = "4MJ"
radarEntity.energy_per_nearby_scan = "125kJ"


------------------
-- TECHNOLOGIES --
------------------
-- Glossary:
-- R:Red, G:Green, M:Gray(Military)
-- B:Blue, P:Purple, W:White

-- Automation. Reduce from 10R@10s -> 5R@5s
Tech:get("automation"):setCost(5):setTime(5)
-- Landfill. Reduce from 50R+G @30s -> 30R+G@30s
Tech:get("landfill"):setCost(30)
-- Railway. Reduce from 75R+G @30s -> 50R+G@30s
Tech:get("railway"):setCost(50)
-- Fluid wagon. Reduce from 200R+G@30s -> 75R+G@30s
Tech:get("fluid-wagon"):setCost(10)
-- Toolbelt. Reduce from 100R+G@30s -> 50R+G@30s
Tech:get("toolbelt"):setCost(50)

-- Remove yellow science
Tech:get("utility-science-pack"):disable()
-- Fix finite techs to take purple science instead of yellow
Tech:get("logistic-system"):setPrerequisites({"production-science-pack", "logistic-robotics"}):setColors("RGBP")
Tech:get("fission-reactor-equipment"):setPrerequisites({"production-science-pack", "military-science-pack", "nuclear-power", "power-armor"}):setColors("RGBMP")
Tech:get("personal-roboport-mk2-equipment"):setPrerequisites({"production-science-pack", "personal-roboport-equipment"}):setColors("RGBP")
Tech:get("military-4"):setPrerequisites({"production-science-pack", "military-3", "explosives"}):setColors("RGBMP")
Tech:get("rocket-silo"):setCost(600):setPrerequisites({"production-science-pack", "concrete", "solar-energy", "battery", "radar", "rocket-fuel", "speed-module-3"}):setColors("RGBP")

Tech:get("power-armor-mk2"):setColors("RGBMP")
Tech:get("destroyer"):setColors("RGBMP")
Tech:get("artillery"):setColors("RGBMP")
Tech:get("power-armor-mk2"):setColors("RGBMP")
Tech:get("spidertron"):setColors("RGBMP")
Tech:get("uranium-ammo"):setColors("RGBMP")

-- Change laser tech to unlock the laser turret
Tech:get("laser"):setEffects({
  {type="unlock-recipe", recipe="laser-turret"}
})
Tech:get("laser-turret"):disable()
-- Change techs that had laser turret as a prerequisites
Tech:get("advanced-material-processing-2"):setPrerequisites({"chemical-science-pack"})
Tech:get("low-density-structure"):setPrerequisites({"chemical-science-pack"})
Tech:get("concrete"):setPrerequisites({"logistic-science-pack"})
Tech:get("advanced-material-processing"):disable()
Tech:get("personal-laser-defense-equipment"):setPrerequisites({"military-3","laser","power-armor","solar-panel-equipment","low-density-structure"})


-- Change module tech to unlock the modules and then disable the originals
Tech:get("modules"):setEffects({
  {type="unlock-recipe", recipe="efficiency-module"},
  {type="unlock-recipe", recipe="productivity-module"},
  {type="unlock-recipe", recipe="speed-module"}
})
Tech:get("efficiency-module"):disable()
Tech:get("productivity-module"):disable()
Tech:get("speed-module"):disable()
-- Change module prerequisites
Tech:get("efficiency-module-2"):setPrerequisites({"modules","processing-unit"})
Tech:get("productivity-module-2"):setPrerequisites({"modules","processing-unit"})
Tech:get("speed-module-2"):setPrerequisites({"modules","processing-unit"})
-- Change module prerequisites
Tech:get("destroyer"):setPrerequisites({"modules","military-4","distractor"})
Tech:get("automation-3"):setPrerequisites({"modules","production-science-pack","electric-engine"})


-- Create the Starter Equipment Tech
Tech:get("solar-panel-equipment"):setCost(200):setEffects({
  {type="unlock-recipe", recipe="solar-panel-equipment"},
  {type="unlock-recipe", recipe="belt-immunity-equipment"},
  {type="unlock-recipe", recipe="night-vision-equipment"}
})
Tech:get("belt-immunity-equipment"):disable()
Tech:get("night-vision-equipment"):disable()
data.raw["technology"]["solar-panel-equipment"].icons = nil
data.raw["technology"]["solar-panel-equipment"].icon = "__Spacehaul__/graphics/technology/starter_equipment.png"
data.raw["technology"]["solar-panel-equipment"].icon_size = 256

-- Create the Battery Tech
Tech:get("battery"):setCost(300):setPrerequisites({"sulfur-processing","solar-energy"}):setEffects({
  {type="unlock-recipe", recipe="battery"},
  {type="unlock-recipe", recipe="accumulator"}
})
Tech:get("electric-energy-accumulators"):disable()
data.raw["technology"]["battery"].icons = nil
data.raw["technology"]["battery"].icon = "__Spacehaul__/graphics/technology/battery_tech.png"
data.raw["technology"]["battery"].icon_size = 256

-- Create the Plastic Products Tech
Tech:get("advanced-circuit"):setCost(300):setPrerequisites({"oil-processing"}):setEffects({
  {type="unlock-recipe", recipe="plastic-bar"},
  {type="unlock-recipe", recipe="advanced-circuit"}
})
Tech:get("plastics"):disable()
data.raw["technology"]["advanced-circuit"].icons = nil
data.raw["technology"]["advanced-circuit"].icon = "__Spacehaul__/graphics/technology/plastic_production.png"
data.raw["technology"]["advanced-circuit"].icon_size = 256

-- Create the Flammables Tech
Tech:get("flammables"):setCost(100):setPrerequisites({"oil-processing"}):setEffects({
  {type="unlock-recipe", recipe="flamethrower"},
  {type="unlock-recipe", recipe="flamethrower-ammo"},
  {type="unlock-recipe", recipe="flamethrower-turret"}
})
Tech:get("flamethrower"):disable()
Tech:get("refined-flammables-1"):setPrerequisites({"flammables", "military-science-pack"})
data.raw["technology"]["flammables"].icons = nil
data.raw["technology"]["flammables"].icon = "__Spacehaul__/graphics/technology/flammables_tech.png"
data.raw["technology"]["flammables"].icon_size = 256

-- Create the Uranium processing Tech
Tech:get("uranium-mining"):setEffects({
  {type="unlock-recipe", recipe="centrifuge"},
  {type="unlock-recipe", recipe="uranium-processing"},
  {type = "mining-with-fluid", modifier = true}
})
Tech:get("uranium-processing"):disable()
Tech:get("nuclear-power"):setCost(500):setPrerequisites({"uranium-mining"})
-- Kovarex. Reduce from 1500R+G+B+P@30s -> 1000R+G+B+P@30s + Add fuel reprocessing
Tech:get("kovarex-enrichment-process"):setCost(1000):setPrerequisites({"uranium-mining","production-science-pack", "rocket-fuel"}):setEffects({
  {type="unlock-recipe", recipe="nuclear-fuel-reprocessing"},
  {type="unlock-recipe", recipe="kovarex-enrichment-process"},
  {type="unlock-recipe", recipe="nuclear-fuel"}
})
Tech:get("nuclear-fuel-reprocessing"):disable()
-- Merge atomic bomb into uranium ammo
Tech:get("uranium-ammo"):setPrerequisites({"tank","military-4","uranium-mining","rocketry"}):setEffects({
  {type="unlock-recipe", recipe="explosive-uranium-cannon-shell"},
  {type="unlock-recipe", recipe="uranium-cannon-shell"},
  {type="unlock-recipe", recipe="uranium-rounds-magazine"},
  {type="unlock-recipe", recipe="atomic-bomb"}
})
Tech:get("atomic-bomb"):disable()
data.raw["technology"]["uranium-ammo"].icon = "__Spacehaul__/graphics/technology/uranium_weapons.png"

-- Create The Robotics Tech
Tech:get("logistic-robotics"):setCost(500):setEffects({
  {type="unlock-recipe", recipe="roboport"},
  {type="unlock-recipe", recipe="storage-chest"},
  {type="unlock-recipe", recipe="passive-provider-chest"},
  {type="unlock-recipe", recipe="logistic-robot"},
  {type="unlock-recipe", recipe="construction-robot"},

  {type = "character-logistic-requests", modifier = true},
  {type = "character-logistic-trash-slots", modifier = 30},
  {type = "create-ghost-on-entity-death", modifier = true}
})
Tech:get("construction-robotics"):disable()
Tech:get("personal-roboport-equipment"):setPrerequisites({"logistic-robotics", "solar-panel-equipment"})
data.raw["technology"]["logistic-robotics"].icons = nil
data.raw["technology"]["logistic-robotics"].icon = "__Spacehaul__/graphics/technology/robotics_tech.png"
data.raw["technology"]["logistic-robotics"].icon_size = 256

-- Create the Starter Equipment Tech
Tech:get("solar-energy"):setCost(200):setEffects({
  {type="unlock-recipe", recipe="solar-panel"},
  {type="unlock-recipe", recipe="big-electric-pole"},
  {type="unlock-recipe", recipe="medium-electric-pole"}
})
Tech:get("electric-energy-distribution-1"):disable()
Tech:get("electric-energy-distribution-2"):setPrerequisites({"solar-energy","chemical-science-pack"})
data.raw["technology"]["solar-energy"].icons = nil
data.raw["technology"]["solar-energy"].icon = "__Spacehaul__/graphics/technology/solar_energy_distribution.png"
data.raw["technology"]["solar-energy"].icon_size = 256

-- Create the Early Biter Defense Tech
Tech:get("radar"):setCost(25):setEffects({
  {type="unlock-recipe", recipe="radar"},
  {type="unlock-recipe", recipe="gun-turret"}
})
Tech:get("gun-turret"):disable()
data.raw["technology"]["radar"].icons = nil
data.raw["technology"]["radar"].icon = "__Spacehaul__/graphics/technology/basic_biter_defence.png"
data.raw["technology"]["radar"].icon_size = 256

-- Create the Walls and Gates Tech
Tech:get("stone-wall"):setCost(20):setEffects({
  {type="unlock-recipe", recipe="stone-wall"},
  {type="unlock-recipe", recipe="gate"}
})
Recipe:get("gate"):setIngredients({
  {type= "item", name= "stone-wall", amount= 1},
  {type= "item", name= "iron-plate", amount= 5},
  {type= "item", name= "electronic-circuit", amount= 2}
})
Tech:get("gate"):disable()
data.raw["technology"]["stone-wall"].icons = nil
data.raw["technology"]["stone-wall"].icon = "__Spacehaul__/graphics/technology/gate.png"
data.raw["technology"]["stone-wall"].icon_size = 256

-- Create the Advanced Oil Processing Tech
Tech:get("advanced-oil-processing"):setCost(200):setEffects({
  {type="unlock-recipe", recipe="coal-liquefaction"},
  {type="unlock-recipe", recipe="advanced-oil-processing"},
  {type="unlock-recipe", recipe="heavy-oil-cracking"},
  {type="unlock-recipe", recipe="light-oil-cracking"},
  {type="unlock-recipe", recipe="solid-fuel-from-heavy-oil"},
  {type="unlock-recipe", recipe="solid-fuel-from-light-oil"}
})
Tech:get("coal-liquefaction"):disable()

-- Create the Simple Engine Tech
Tech:get("engine"):setCost(150):setEffects({
  {type="unlock-recipe", recipe="engine-unit"},
  {type="unlock-recipe", recipe="car"}
})
Tech:get("automobilism"):disable()
Tech:get("tank"):setPrerequisites({"engine","explosives", "military-3"})
data.raw["technology"]["engine"].icons = nil
data.raw["technology"]["engine"].icon = "__Spacehaul__/graphics/technology/simple_engine.png"
data.raw["technology"]["engine"].icon_size = 256

-- Create the Modules 2 Tech
Tech:get("speed-module-2"):setCost(150):setEffects({
  {type="unlock-recipe", recipe="speed-module-2"},
  {type="unlock-recipe", recipe="efficiency-module-2"},
  {type="unlock-recipe", recipe="productivity-module-2"}
})
Tech:get("productivity-module-2"):disable()
Tech:get("efficiency-module-2"):disable()
Tech:get("power-armor-mk2"):setPrerequisites({"power-armor","speed-module-2", "military-4"})
data.raw["technology"]["speed-module-2"].icons = nil
data.raw["technology"]["speed-module-2"].icon = "__Spacehaul__/graphics/technology/module_tech_2.png"
data.raw["technology"]["speed-module-2"].icon_size = 256

-- Create the Modules 3 Tech
Tech:get("speed-module-3"):setCost(1000):setEffects({
  {type="unlock-recipe", recipe="speed-module-3"},
  {type="unlock-recipe", recipe="efficiency-module-3"},
  {type="unlock-recipe", recipe="productivity-module-3"}
})
Tech:get("productivity-module-3"):disable()
Tech:get("efficiency-module-3"):disable()
Tech:get("spidertron"):setPrerequisites({"speed-module-3", "exoskeleton-equipment", "military-4", "fission-reactor-equipment", "radar", "rocketry"})
data.raw["technology"]["speed-module-3"].icons = nil
data.raw["technology"]["speed-module-3"].icon = "__Spacehaul__/graphics/technology/module_tech_3.png"
data.raw["technology"]["speed-module-3"].icon_size = 256

-- Logistic system. Reduce from 500R+G+B+Y@30s -> 400R+G+B+Y@30s
Tech:get("logistic-system"):setCost(400)

-- Spidertron. Reduce from 2500R+G+B+M+P+Y@30s -> 2000R+G+B+M+P+Y@30s
Tech:get("spidertron"):setCost(2000)

-- Explosives. Change from granting explosives -> granting explosives and cliff explosives
Tech:get("explosives"):setEffects({
  {type="unlock-recipe", recipe="explosives"},
  {type="unlock-recipe", recipe="cliff-explosives"}
})

-- REMOVE BELTS SETTING
--set logistics to unlock the correct shite
Tech:get("logistics"):setEffects({
  {type="unlock-recipe", recipe="fast-splitter"},
  {type="unlock-recipe", recipe="fast-underground-belt"}
})
--disable logistics tech for red and blue belts
Tech:get("logistics-2"):disable()
Tech:get("logistics-3"):disable()
--change prerequisites for belt reliant tech
Tech:get("railway"):setPrerequisites({"logistics", "engine"})

-- change the graphic for logistics to match the new color
data.raw["technology"]["logistics"].icon = "__Spacehaul__/graphics/technology/red_logistics.png"

--REMOVE INSERTER SETTINGS
-- Disable the fast inserter tech
Tech:get("fast-inserter"):disable()
-- Set the inserter to be correctly unlocked
Tech:get("electronics"):setEffects({
  {type="unlock-recipe", recipe="copper-cable"},
  {type="unlock-recipe", recipe="electronic-circuit"},
  {type="unlock-recipe", recipe="fast-inserter"},
  {type="unlock-recipe", recipe="lab"},
  {type="unlock-recipe", recipe="alt-electric-pole"},
  {type="unlock-recipe", recipe="electric-mining-drill"}
})
Tech:get("bulk-inserter"):disable()
Tech:get("electric-mining-drill"):disable()


-- Remove steel chest unlock
Tech:get("steel-processing"):setEffects({
  {type="unlock-recipe", recipe="steel-plate"}
})

-- REMOVE ASSEMBLING TIERS
Tech:get("automation-2"):disable()
Tech:get("automation-3"):disable()
--set all techs to actully work
Tech:get("automation"):setEffects({
  {type="unlock-recipe", recipe="long-handed-inserter"},
  {type="unlock-recipe", recipe="assembling-machine-2"}
})
Tech:get("research-speed-1"):setPrerequisites({"logistic-science-pack"})
Tech:get("fluid-handling"):setPrerequisites({"engine"})

-- Change assembling mashine stats
data.raw["assembling-machine"]["assembling-machine-2"].crafting_speed = 1
data.raw["assembling-machine"]["assembling-machine-2"].module_slots = 4
-- Change assembling mashine tech icon
data.raw["technology"]["automation"].icon = "__Spacehaul__/graphics/technology/blue_automation.png"

-- Remove discharge defense
Tech:get("discharge-defense-equipment"):disable()

-- Remove land-mine
Tech:get("land-mine"):disable()

-- Remove beacons
Tech:get("effect-transmission"):disable()

-- Remove cliff explosives technology
Tech:get("cliff-explosives"):disable()

-- Change the prerequisites for things that need lube
Tech:get("electric-engine"):setPrerequisites({"advanced-oil-processing"})

-- Remove lube
Tech:get("lubricant"):disable()

-- Remove iron stick unlocks
Tech:get("railway"):setEffects({
  {type="unlock-recipe", recipe="cargo-wagon"},
  {type="unlock-recipe", recipe="locomotive"},
  {type="unlock-recipe", recipe="rail"},
  {type="unlock-recipe", recipe="rail-chain-signal"},
  {type="unlock-recipe", recipe="rail-signal"},
  {type="unlock-recipe", recipe="train-stop"},
  {type="unlock-recipe", recipe="fluid-wagon"}
})
Tech:get("fluid-wagon"):disable()

Tech:get("circuit-network"):setEffects({
  {type="unlock-recipe", recipe="arithmetic-combinator"},
  {type="unlock-recipe", recipe="constant-combinator"},
  {type="unlock-recipe", recipe="decider-combinator"},
  {type="unlock-recipe", recipe="display-panel"},
  {type="unlock-recipe", recipe="power-switch"},
  {type="unlock-recipe", recipe="programmable-speaker"},
  {type="unlock-recipe", recipe="selector-combinator"}
})
Tech:get("concrete"):setEffects({
  {type="unlock-recipe", recipe="concrete"},
  {type="unlock-recipe", recipe="hazard-concrete"},
  {type="unlock-recipe", recipe="refined-concrete"},
  {type="unlock-recipe", recipe="refined-hazard-concrete"}
})

-- Remove selector cobinator tech
Tech:get("advanced-combinators"):disable()
-- Remove automated rail transportation then change the icon
Tech:get("automated-rail-transportation"):disable()
data.raw["technology"]["railway"].icon = "__Spacehaul__/graphics/technology/complete_railway_icon.png"

Tech:get("production-science-pack"):setPrerequisites({"robotics","railway","processing-unit"}) -- Change science pack prerequisets

--------------------
-- HEAVY ARMOR+  --
--------------------
-- The Heavy Armor+ provides a 3x3 equipment grid. The equipment found on the
-- Spaceship debris can go here and grant early bots!

-- Create a new equipment grid of size 3x3
local tinyGrid = Common.cloneInto("equipment-grid", "small-equipment-grid", "uh_tiny-equipment-grid")
tinyGrid.width = 3
tinyGrid.height = 3

-- Create the item
local heavyArmorPlus = Common.cloneInto("armor", "heavy-armor", "uh_heavy-armor-plus")
heavyArmorPlus.equipment_grid = "uh_tiny-equipment-grid"
heavyArmorPlus.icons = {
  {
    icon = "__Spacehaul__/graphics/icons/heavy-armor-plus.png",
    icon_size = heavyArmorPlus.icon_size
  }
}

-- Create a new recipe for HeavyArmor+
Recipe:cloneInto("heavy-armor", "uh_heavy-armor-plus")
:setIngredients({
  {type= "item", name= "heavy-armor", amount= 1},
  {type= "item", name= "electronic-circuit", amount= 50}
}):setProducts({
  {type= "item", name= "uh_heavy-armor-plus", amount= 1}
})

-- Create the technology that unlocks HeavyArmor+ recipe
local heavyArmorPlusTech = Tech:cloneInto("heavy-armor", "uh_heavy-armor-plus")
Tech:get("uh_heavy-armor-plus"):setColors("R"):setCost(45):setTime(30)
:setPrerequisites({"heavy-armor"})
:setEffect({type="unlock-recipe", recipe="uh_heavy-armor-plus"})
heavyArmorPlusTech.icons = {
  {
    icon = heavyArmorPlusTech.icon,
    icon_size = heavyArmorPlusTech.icon_size,
    tint = {r=1,g=1,b=0.2,a=0.8}
  },
  {
    icon = "__core__/graphics/icons/technology/constants/constant-equipment.png",
    icon_size = 128,
    scale = 0.5,
    shift = {50, 50},
    floating = true,
  } --icon improvement by Shemp and Honktown
}

local function GetHeavyArmorAnimationIndex()
  for i, armorAnimation in ipairs(data.raw["character"]["character"].animations) do
    if armorAnimation.armors ~= nil then
      for _, armorId in ipairs(armorAnimation.armors) do
        if armorId == "heavy-armor" then
          return i
        end
      end
    end
  end
  return 0
end
-- Find the armor animations used for heavy-armor
local animationIndex = GetHeavyArmorAnimationIndex()
-- Add heavy-armor-plus to the list of armor for that animation
table.insert(data.raw["character"]["character"].animations[animationIndex].armors, "uh_heavy-armor-plus")

----------
-- LABS --
----------
-- Buff the lab speed so that it can keep up with the increased production due
-- to the rest of the  balance changes
-- Increase from 1.0 -> 1.5
data.raw["lab"]["lab"].researching_speed = 1.5

--------------------
-- MODULE BALANCE --
--------------------
local function changeModuleEffect(name, effect)
  data.raw["module"][name].effect = effect
end
-- Reminder: beacons are disabled so, overall, all modules are buffed
-- They cost less, give more bonus and use less energy

-- Speed module. Original values:
-- * Mod1: energy +50%, speed +20%
-- * Mod2: energy +60%, speed +30%
-- * Mod3: energy +70%, speed +50%
-- New values:
-- * Mod1: energy +40%, speed +25%
-- * Mod2: energy +60%, speed +50%
-- * Mod3: energy +90%, speed +100%
changeModuleEffect("speed-module", {
  consumption = 0.40,
  speed = 0.25
})
changeModuleEffect("speed-module-2", {
  consumption = 0.60,
  speed = 0.50
})
changeModuleEffect("speed-module-3", {
  consumption = 0.90,
  speed = 1.00
})

-- Efficiency module. Original values:
-- * Mod1: energy -30%
-- * Mod2: energy -40%
-- * Mod3: energy -50%
-- New values:
-- Let's make efficiency module 2 and 3 more useful
-- * Mod1: energy -30%
-- * Mod2: energy -60%
-- * Mod3: energy -120%
changeModuleEffect("efficiency-module", {
  consumption = -0.30
}) --changed from effectivity to efficiency
changeModuleEffect("efficiency-module-2", {
  consumption = -0.60
}) --changed from effectivity to efficiency
changeModuleEffect("efficiency-module-3", {
  consumption = -1.20
}) --changed from effectivity to efficiency

-- Productivity module. Original values:
-- * Mod1: energy +40%, pollution  +5%, speed  -5%, productivity  +4%
-- * Mod2: energy +60%, pollution  +7%, speed -10%, productivity  +6%
-- * Mod3: energy +80%, pollution +10%, speed -15%, productivity +10%
-- New values:
-- 1 point of productivity = 1 point of pollution, -1 point of speed, 6.25 points of energy
-- Note: productivity modules still bring a slight slow down
-- * Mod1: energy +25%, pollution  +4%, speed -4%, productivity  +4%
-- * Mod2: energy +50%, pollution  +8%, speed -8%, productivity  +8%
-- * Mod3: energy +75%, pollution +12%, speed -12%, productivity +12%
changeModuleEffect("productivity-module", {
  productivity = 0.04,
  consumption = 0.25,
  pollution = 0.04,
  speed = -0.04
})
changeModuleEffect("productivity-module-2", {
  productivity = 0.08,
  consumption = 0.50,
  pollution = 0.08,
  speed = -0.08
})
changeModuleEffect("productivity-module-3", {
  productivity = 0.12,
  consumption = 0.75,
  pollution = 0.12,
  speed = -0.12
})