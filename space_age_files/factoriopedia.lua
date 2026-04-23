local Common = require "utils.common"

data.raw.technology["speed-module-2"].localised_description = {"technology-description.speed-module-2"}
data.raw.technology["speed-module-3"].localised_description = {"technology-description.speed-module-3"}

data.raw["item"]["iron-stick"].hidden = true
data.raw["recipe"]["iron-stick"].hidden = true
data.raw["fluid"]["lubricant"].hidden = true
data.raw["recipe"]["lubricant"].hidden = true
data.raw["recipe"]["biolubricant"].hidden = true
--data.raw["recipe"]["lubricant-barrel"].hidden = true        --made in data updates, need to hide them there
--data.raw["recipe"]["empty-lubricant-barrel"].hidden = true  --made in data updates, need to hide them there

data.raw["item"]["inserter"].hidden = true
data.raw["recipe"]["inserter"].hidden = true
data.raw["inserter"]["inserter"].hidden = true
data.raw["inserter"]["inserter"].next_upgrade = nil

data.raw["item"]["bulk-inserter"].hidden = true
data.raw["recipe"]["bulk-inserter"].hidden = true
data.raw["inserter"]["bulk-inserter"].hidden = true
data.raw["inserter"]["bulk-inserter"].next_upgrade = nil

data.raw["inserter"]["fast-inserter"].next_upgrade = nil


data.raw["item"]["wooden-chest"].hidden = true
data.raw["recipe"]["wooden-chest"].hidden = true
data.raw["container"]["wooden-chest"].hidden = true
data.raw["container"]["wooden-chest"].next_upgrade = nil

data.raw["item"]["steel-chest"].hidden = true
data.raw["recipe"]["steel-chest"].hidden = true
data.raw["container"]["steel-chest"].hidden = true
data.raw["container"]["steel-chest"].next_upgrade = nil

data.raw["container"]["iron-chest"].next_upgrade = nil


data.raw["item"]["assembling-machine-1"].hidden = true
data.raw["recipe"]["assembling-machine-1"].hidden = true
data.raw["assembling-machine"]["assembling-machine-1"].hidden = true
data.raw["assembling-machine"]["assembling-machine-1"].next_upgrade = nil

data.raw["item"]["assembling-machine-3"].hidden = true
data.raw["recipe"]["assembling-machine-3"].hidden = true
data.raw["assembling-machine"]["assembling-machine-3"].hidden = true
data.raw["assembling-machine"]["assembling-machine-3"].next_upgrade = nil

data.raw["assembling-machine"]["assembling-machine-2"].next_upgrade = nil


data.raw["item"]["transport-belt"].hidden = true
data.raw["recipe"]["transport-belt"].hidden = true
data.raw["transport-belt"]["transport-belt"].hidden = true
data.raw["transport-belt"]["transport-belt"].next_upgrade = nil

data.raw["item"]["underground-belt"].hidden = true
data.raw["recipe"]["underground-belt"].hidden = true
data.raw["underground-belt"]["underground-belt"].hidden = true
data.raw["underground-belt"]["underground-belt"].next_upgrade = nil

data.raw["item"]["splitter"].hidden = true
data.raw["recipe"]["splitter"].hidden = true
data.raw["splitter"]["splitter"].hidden = true
data.raw["splitter"]["splitter"].next_upgrade = nil

data.raw["item"]["express-transport-belt"].hidden = true
data.raw["recipe"]["express-transport-belt"].hidden = true
data.raw["transport-belt"]["express-transport-belt"].hidden = true
data.raw["transport-belt"]["express-transport-belt"].next_upgrade = nil

data.raw["item"]["express-underground-belt"].hidden = true
data.raw["recipe"]["express-underground-belt"].hidden = true
data.raw["underground-belt"]["express-underground-belt"].hidden = true
data.raw["underground-belt"]["express-underground-belt"].next_upgrade = nil

data.raw["item"]["express-splitter"].hidden = true
data.raw["recipe"]["express-splitter"].hidden = true
data.raw["splitter"]["express-splitter"].hidden = true
data.raw["splitter"]["express-splitter"].next_upgrade = nil

data.raw["transport-belt"]["fast-transport-belt"].next_upgrade = nil
data.raw["underground-belt"]["fast-underground-belt"].next_upgrade = nil
data.raw["splitter"]["fast-splitter"].next_upgrade = nil


data.raw["item"]["beacon"].hidden = true
data.raw["recipe"]["beacon"].hidden = true
data.raw["beacon"]["beacon"].hidden = true


data.raw["item"]["discharge-defense-equipment"].hidden = true
data.raw["recipe"]["discharge-defense-equipment"].hidden = true
data.raw["capsule"]["discharge-defense-remote"].hidden = true

-- data.raw["capsule"]["defender-capsule"].hidden_in_factoriopedia = true
-- data.raw["recipe"]["defender-capsule"].hidden_in_factoriopedia = true
-- data.raw["capsule"]["distractor-capsule"].hidden_in_factoriopedia = true
-- data.raw["recipe"]["distractor-capsule"].hidden_in_factoriopedia = true
-- data.raw["capsule"]["destroyer-capsule"].hidden_in_factoriopedia = true
-- data.raw["recipe"]["destroyer-capsule"].hidden_in_factoriopedia = true


data.raw["item"]["small-electric-pole"].hidden = true
data.raw["recipe"]["small-electric-pole"].hidden = true
data.raw["electric-pole"]["small-electric-pole"].hidden = true

data.raw["electric-pole"]["medium-electric-pole"].next_upgrade = nil

data.raw["item"]["land-mine"].hidden = true
data.raw["recipe"]["land-mine"].hidden = true
data.raw["land-mine"]["land-mine"].hidden = true
data.raw["ammo-category"]["landmine"].hidden = true
data.raw["item"]["land-mine"].hidden_in_factoriopedia = true
data.raw["recipe"]["land-mine"].hidden_in_factoriopedia = true
data.raw["land-mine"]["land-mine"].hidden_in_factoriopedia = true
data.raw["ammo-category"]["landmine"].hidden_in_factoriopedia = true

data.raw["item"]["stone-furnace"].hidden = true
data.raw["recipe"]["stone-furnace"].hidden = true
data.raw["furnace"]["stone-furnace"].hidden = true

data.raw["furnace"]["stone-furnace"].next_upgrade = nil

-- data.raw["item"]["utility-science-pack"].hidden = true
data.raw["recipe"]["utility-science-pack"].hidden = true
data.raw["tool"]["utility-science-pack"].hidden = true

-- data.raw["item"]["railgun"].hidden = true
data.raw["recipe"]["railgun"].hidden = true
data.raw["gun"]["railgun"].hidden = true
data.raw["ammo-category"]["railgun"].hidden = true

data.raw["explosion"]["railgun-beam"].hidden = true

data.raw["container"]["big-ship-wreck-1"].hidden = true
data.raw["container"]["big-ship-wreck-2"].hidden = true
data.raw["container"]["big-ship-wreck-3"].hidden = true

------------------------------------------------------------------------------------------------------------------------
-- TECHNOLOGY HIDDING ---- TECHNOLOGY HIDDING ---- TECHNOLOGY HIDDING ---- TECHNOLOGY HIDDING ---- TECHNOLOGY HIDDING --
------------------------------------------------------------------------------------------------------------------------

data.raw["technology"]["land-mine"].hidden = true
data.raw["technology"]["land-mine"].hidden_in_factoriopedia = true

data.raw["technology"]["efficiency-module"].hidden = true
data.raw["technology"]["efficiency-module"].hidden_in_factoriopedia = true
data.raw["technology"]["efficiency-module-2"].hidden = true
data.raw["technology"]["efficiency-module-2"].hidden_in_factoriopedia = true
data.raw["technology"]["efficiency-module-3"].hidden = true
data.raw["technology"]["efficiency-module-3"].hidden_in_factoriopedia = true

data.raw["technology"]["productivity-module"].hidden = true
data.raw["technology"]["productivity-module"].hidden_in_factoriopedia = true
data.raw["technology"]["productivity-module-2"].hidden = true
data.raw["technology"]["productivity-module-2"].hidden_in_factoriopedia = true
data.raw["technology"]["productivity-module-3"].hidden = true
data.raw["technology"]["productivity-module-3"].hidden_in_factoriopedia = true

data.raw["technology"]["speed-module"].hidden = true
data.raw["technology"]["speed-module"].hidden_in_factoriopedia = true

data.raw["technology"]["fluid-wagon"].hidden = true
data.raw["technology"]["fluid-wagon"].hidden_in_factoriopedia = true

data.raw["technology"]["gun-turret"].hidden = true
data.raw["technology"]["gun-turret"].hidden_in_factoriopedia = true

data.raw["technology"]["fast-inserter"].hidden = true
data.raw["technology"]["fast-inserter"].hidden_in_factoriopedia = true

data.raw["technology"]["electric-energy-distribution-1"].hidden = true
data.raw["technology"]["electric-energy-distribution-1"].hidden_in_factoriopedia = true

data.raw["technology"]["logistics-2"].hidden = true
data.raw["technology"]["logistics-2"].hidden_in_factoriopedia = true

data.raw["technology"]["automated-rail-transportation"].hidden = true
data.raw["technology"]["automated-rail-transportation"].hidden_in_factoriopedia = true

data.raw["technology"]["automobilism"].hidden = true
data.raw["technology"]["automobilism"].hidden_in_factoriopedia = true

data.raw["technology"]["construction-robotics"].hidden = true
data.raw["technology"]["construction-robotics"].hidden_in_factoriopedia = true

data.raw["technology"]["advanced-combinators"].hidden = true
data.raw["technology"]["advanced-combinators"].hidden_in_factoriopedia = true

data.raw["technology"]["cliff-explosives"].hidden = true
data.raw["technology"]["cliff-explosives"].hidden_in_factoriopedia = true

data.raw["technology"]["electric-energy-accumulators"].hidden = true
data.raw["technology"]["electric-energy-accumulators"].hidden_in_factoriopedia = true

data.raw["technology"]["electric-mining-drill"].hidden = true
data.raw["technology"]["electric-mining-drill"].hidden_in_factoriopedia = true

data.raw["technology"]["advanced-material-processing"].hidden = true
data.raw["technology"]["advanced-material-processing"].hidden_in_factoriopedia = true

data.raw["technology"]["automation-2"].hidden = true
data.raw["technology"]["automation-2"].hidden_in_factoriopedia = true

data.raw["technology"]["uranium-processing"].hidden = true
data.raw["technology"]["uranium-processing"].hidden_in_factoriopedia = true

data.raw["technology"]["coal-liquefaction"].hidden = true
data.raw["technology"]["coal-liquefaction"].hidden_in_factoriopedia = true

data.raw["technology"]["plastics"].hidden = true
data.raw["technology"]["plastics"].hidden_in_factoriopedia = true

data.raw["technology"]["nuclear-fuel-reprocessing"].hidden = true
data.raw["technology"]["nuclear-fuel-reprocessing"].hidden_in_factoriopedia = true

data.raw["technology"]["belt-immunity-equipment"].hidden = true
data.raw["technology"]["belt-immunity-equipment"].hidden_in_factoriopedia = true

data.raw["technology"]["night-vision-equipment"].hidden = true
data.raw["technology"]["night-vision-equipment"].hidden_in_factoriopedia = true

data.raw["technology"]["gate"].hidden = true
data.raw["technology"]["gate"].hidden_in_factoriopedia = true

data.raw["technology"]["laser-turret"].hidden = true
data.raw["technology"]["laser-turret"].hidden_in_factoriopedia = true

data.raw["technology"]["flamethrower"].hidden = true
data.raw["technology"]["flamethrower"].hidden_in_factoriopedia = true