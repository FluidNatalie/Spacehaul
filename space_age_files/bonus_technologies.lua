------------------------------------
-- Incremental bonus technologies --
------------------------------------

-- Goal: Reduce the number of them!
-- There are too many and feel grindy

local Common = require "utils.common"
local Recipe = require "utils.recipe"
local Tech = require "utils.tech"

-- Lab research speed. Original values:
-- 1) 100R+G@30s, +20% speed -> 1.2x
-- 2) 200R+G@30s, +30% speed -> 1.5x
-- 3) 250R+G+B@30s, +40% speed -> 1.9x
-- 4) 500R+G+B@30s, +50% speed -> 2.4x
-- 5) 500R+G+B+P@30s, +50% speed -> 2.9x
-- 6) 500R+G+B+P+Y@30s, +60% speed -> 3.5x
-- New values:
-- 1) 250R+G@30s, +50% speed -> 1.5x
-- 2) 250R+G+B@30s, +60% speed -> 2.1x
-- 3) 250R+G+B+P@30s, +70% speed -> 2.8x
-- 4) 250R+G+B+P+Y@30s, +70% speed -> 3.5x
Tech:get("research-speed-1"):setCost(250):setColors("RG"):setTime(30)
    :setEffect({type="laboratory-speed", modifier=0.5})
Tech:get("research-speed-2"):setCost(250):setColors("RGB"):setTime(30)
    :setEffect({type="laboratory-speed", modifier=0.6})
Tech:get("research-speed-3"):setCost(250):setColors("RGBP"):setTime(30)
    :setEffect({type="laboratory-speed", modifier=0.7})
Tech:get("research-speed-4"):setCost(750):setColors("RGBP"):setTime(30)
    :setEffect({type="laboratory-speed", modifier=0.7})
Tech:get("research-speed-5"):disable()
Tech:get("research-speed-6"):disable()


Tech:get("inserter-capacity-bonus-1"):setPrerequisites({"electronics", "logistic-science-pack"}):setColors("RG")
    :setEffects({
        {type="inserter-stack-size-bonus", modifier=1}
    })
Tech:get("inserter-capacity-bonus-2"):setColors("RG")
    :setEffects({
        {type="inserter-stack-size-bonus", modifier=1}
    })
Tech:get("inserter-capacity-bonus-3"):setColors("RGB")
    :setEffects({
        {type="inserter-stack-size-bonus", modifier=1}
    })
Tech:get("inserter-capacity-bonus-4"):setColors("RGB"):setPrerequisites({"inserter-capacity-bonus-3"})
    :setEffects({
        {type="inserter-stack-size-bonus", modifier=2}
    })
Tech:get("inserter-capacity-bonus-5"):setColors("RGBP")
    :setEffects({
        {type="inserter-stack-size-bonus", modifier=2}
    })
Tech:get("inserter-capacity-bonus-6"):setColors("RGBP")
    :setEffects({
        {type="inserter-stack-size-bonus", modifier=2}
    })
Tech:get("inserter-capacity-bonus-7"):setColors("RGBP")
    :setEffects({
        {type="inserter-stack-size-bonus", modifier=2}
    })

-- Mining productivity. Original values:
-- 1) 250R+G@30s, +10% productivity
-- 2) 500R+G+B@60s, +10% productivity
-- 3) 1000R+G+B+P+Y@60s, +10% productivity
-- oo) [2500*(L-3)]R+G+B+P+Y+W@60s, +10% productivity
-- New values:
-- 1) 250R+G@30s, +10% productivity
-- 2) 500R+G+B@60s, +10% productivity
-- 3) 1000R+G+B+P@60s, +10% productivity
-- oo) [2000*(L-3)]R+G+B+P+Y+W@60s, +10% productivity
Tech:get("mining-productivity-3"):setColors("RGBP")
Tech:get("mining-productivity-4"):setCostFormula("2000*(L-3)")

-- Braking force. Original values:
-- 1) 100R+G+B@30s, +10% -> 1.1x
-- 2) 200R+G+B@30s, +15% -> 1.25x
-- 3) 250R+G+B+P@30s, +15% -> 1.40x
-- 4) 350R+G+B+P@30s, +15% -> 1.55x
-- 5) 450R+G+B+P@35s, +15% -> 1.70x
-- 6) 550R+G+B+P+Y@45s, +15% -> 1.85x
-- 7) 650R+G+B+P+Y@60s, +15% -> 2x
-- New values:
-- 1) 200R+G+B@30s, +25%
-- 2) 400R+G+B+P@30s, +35%
-- 3) 600R+G+B+P+Y@45s, +40% -> 2x
Tech:get("braking-force-1"):setCost(200):setColors("RGB"):setTime(30)
    :setEffect({type="train-braking-force-bonus", modifier=0.25})
Tech:get("braking-force-2"):setCost(400):setColors("RGBP"):setTime(30)
    :setEffect({type="train-braking-force-bonus", modifier=0.35})
Tech:get("braking-force-3"):setCost(200):setColors("RGBP"):setTime(45)
    :setEffect({type="train-braking-force-bonus", modifier=0.40})
Tech:get("braking-force-4"):disable()
Tech:get("braking-force-5"):disable()
Tech:get("braking-force-6"):disable()
Tech:get("braking-force-7"):disable()

-- Worker robot cargo size. Original values:
-- 1) 200R+G+B@30s, +1
-- 2) 300R+G+B+P@60s, +1
-- 3) 450R+G+B+P+Y@60s, +1
-- New values:
-- 1) 200R+G+B@30s, +1
-- 2) 400R+G+B+P+Y@45s, +2
Tech:get("worker-robots-storage-1"):setCost(200):setColors("RGB"):setTime(30)
    :setEffect({type="worker-robot-storage", modifier=1})
Tech:get("worker-robots-storage-2"):setCost(400):setColors("RGBP"):setTime(45)
    :setEffect({type="worker-robot-storage", modifier=2})
Tech:get("worker-robots-storage-3"):disable()

-- Worker robot speed. Original values:
-- Starting speed: 0.06
-- 1) 50R+G+B@30s, +35% -> 1.35x
-- 2) 100R+G+B@30s, +40% -> 1.75x (=0.105)
-- 3) 150R+G+B+Y@60s, +45% -> 2.20x
-- 4) 250R+G+B+Y@60s, +55% -> 2.75x
-- 5) 500R+G+B+P+Y@60s, +65% -> 3.4x (=0.204)
-- oo) 2^(L-6)*1000 R+G+B+P+Y+W@60s, +65%
-- New values:
-- Starting speed: 0.08
-- 1) 50R+G+B@30s, +40% -> 1.4x (= 0.112)
-- 2) 150R+G+B+Y@30s, +50% -> 1.9x (=0.152)
-- 3) 500R+G+B+P+Y@60s, +65% -> 2.55x (=0.204)
-- oo) 2^(L-4)*500 R+G+B+P+Y+W@60s, +65%
data.raw["construction-robot"]["construction-robot"].speed = 0.08
data.raw["logistic-robot"]["logistic-robot"].speed = 0.08
Tech:get("worker-robots-speed-1"):setCost(50):setColors("RGB"):setTime(30)
    :setEffect({type="worker-robot-speed", modifier=0.40})
Tech:get("worker-robots-speed-2"):setCost(150):setColors("RGB"):setTime(30)
    :setEffect({type="worker-robot-speed", modifier=0.50})
Tech:get("worker-robots-speed-3"):setCost(500):setColors("RGBP"):setTime(60):setPrerequisites({"production-science-pack","worker-robots-speed-2"})
    :setEffect({type="worker-robot-speed", modifier=0.65})
Tech:get("worker-robots-speed-4"):setColors("RGBPW"):setTime(60)
    :setCostFormula("2^(L-4)*500"):setInfinite():setPrerequisites({"space-science-pack","worker-robots-speed-3"})
    :setEffect({type="worker-robot-speed", modifier=0.65})
Tech:get("worker-robots-speed-5"):remove()
Tech:get("worker-robots-speed-6"):remove()

-- Physical projectile damage. Original values:
-- 1) 100R@30s, +10%
-- 2) 200R+G@30s, +10%
-- 3) 300R+G+M@60s, +20%
-- 4) 400R+G+M@60s, +20%
-- 5) 500R+G+B+M@60s, +20%, cannon +90%
-- 6) 600R+G+B+M+Y@60s, +40%, cannon +140%
-- oo) 2^(L-7)*1000 R+G+B+M+Y+W@60s, +40%, gun turret +70%, cannon +100%
-- New values:
-- 1) 50R@30s, +10%
-- 2) 150R+G@30s, +20%
-- 3) 300R+G+M@60s, +40%, cannon +90%
-- 4) 500R+G+B+M@60s, +50%, cannon +140%
-- oo) 2^(L-5)*500 R+G+B+M+Y+W@60s, +40%, gun turret +70%, cannon +100%
Tech:get("physical-projectile-damage-1"):setCost(50):setColors("R"):setTime(30)
    :setEffects({
        {type="ammo-damage", ammo_category="bullet", modifier=0.10},
        {type="turret-attack", turret_id="gun-turret", modifier=0.10},
        {type="ammo-damage", ammo_category="shotgun-shell", modifier=0.10}
    })
Tech:get("physical-projectile-damage-2"):setCost(150):setColors("RG"):setTime(30)
    :setEffects({
        {type="ammo-damage", ammo_category="bullet", modifier=0.20},
        {type="turret-attack", turret_id="gun-turret", modifier=0.20},
        {type="ammo-damage", ammo_category="shotgun-shell", modifier=0.20}
    })
Tech:get("physical-projectile-damage-3"):setCost(300):setColors("RGM"):setTime(60)
    :setEffects({
        {type="ammo-damage", ammo_category="bullet", modifier=0.40},
        {type="turret-attack", turret_id="gun-turret", modifier=0.40},
        {type="ammo-damage", ammo_category="shotgun-shell", modifier=0.40},
        {type="ammo-damage", ammo_category="cannon-shell", modifier=0.90}
    })
Tech:get("physical-projectile-damage-4"):setCost(500):setColors("RGBM"):setTime(60)
    :setEffects({
        {type="ammo-damage", ammo_category="bullet", modifier=0.50},
        {type="turret-attack", turret_id="gun-turret", modifier=0.50},
        {type="ammo-damage", ammo_category="shotgun-shell", modifier=0.50},
        {type="ammo-damage", ammo_category="cannon-shell", modifier=1.40}
    })
Tech:get("physical-projectile-damage-5"):setColors("RGBMPW"):setTime(60)
    :setCostFormula("2^(L-5)*500"):setInfinite():setPrerequisites({"space-science-pack","physical-projectile-damage-4"})
    :setEffects({
        {type="ammo-damage", ammo_category="bullet", modifier=0.40},
        {type="turret-attack", turret_id="gun-turret", modifier=0.70},
        {type="ammo-damage", ammo_category="shotgun-shell", modifier=0.40},
        {type="ammo-damage", ammo_category="cannon-shell", modifier=1.00}
    })
Tech:get("physical-projectile-damage-6"):remove()
Tech:get("physical-projectile-damage-7"):remove()

-- Weapon shooting speed. Original values:
-- 1) 100R@30s, +10%
-- 2) 200R+G@30s, +20%
-- 3) 300R+G+M@60s, +20%, rocket +50%
-- 4) 400R+G+M@60s, +30%, rocket +70%
-- 5) 500R+G+B+M@60s, bullet +30%, shotgun +40%, cannon +80%, rocket +90%
-- 6) 600R+G+B+M+Y@60s, +40%, cannon +150%, rocket +130%
-- End state: bullet 2.5x, shotgun 2.6x, cannon 3.3x, rocket 4.4x
-- New values:
-- 1) 50R@30s, +25%
-- 2) 150R+G@30s, +35%, rocket +80%
-- 3) 300R+G+M@60s, +40%, cannon +80%, rocket +110%
-- 4) 500R+G+B+M@60s, bullet +50%, shotgun +60%, cannon +150%, rocket +150%
Tech:get("weapon-shooting-speed-1"):setCost(50):setColors("R"):setTime(30)
    :setEffects({
        {type="gun-speed", ammo_category="bullet", modifier=0.25},
        {type="gun-speed", ammo_category="shotgun-shell", modifier=0.25}
    })
Tech:get("weapon-shooting-speed-2"):setCost(150):setColors("RG"):setTime(30)
    :setEffects({
        {type="gun-speed", ammo_category="bullet", modifier=0.35},
        {type="gun-speed", ammo_category="shotgun-shell", modifier=0.35},
        {type="gun-speed", ammo_category="rocket", modifier=0.80}
    })
Tech:get("weapon-shooting-speed-3"):setCost(300):setColors("RGM"):setTime(60)
    :setEffects({
        {type="gun-speed", ammo_category="bullet", modifier=0.40},
        {type="gun-speed", ammo_category="shotgun-shell", modifier=0.40},
        {type="gun-speed", ammo_category="cannon-shell", modifier=0.80},
        {type="gun-speed", ammo_category="rocket", modifier=1.10}
    })
Tech:get("weapon-shooting-speed-4"):setCost(500):setColors("RGBM"):setTime(60)
    :setEffects({
        {type="gun-speed", ammo_category="bullet", modifier=0.50},
        {type="gun-speed", ammo_category="shotgun-shell", modifier=0.60},
        {type="gun-speed", ammo_category="cannon-shell", modifier=1.50},
        {type="gun-speed", ammo_category="rocket", modifier=1.50}
    })
Tech:get("weapon-shooting-speed-5"):disable()
Tech:get("weapon-shooting-speed-6"):disable()

-- Stronger explosives. Original values:
-- 1) 100R+G@30s, grenade +25%
-- 2) 200R+G+M@30s, grenade +20%, mine +20%
-- 3) 300R+G+B+M@60s, grenade +20%, mine +20%, rocket +30%
-- 4) 400R+G+B+M+Y@60s, grenade +20%, mine +20%, rocket +40%
-- 5) 500R+G+B+M+Y@60s, grenade +20%, mine +20%, rocket +50%
-- 6) 600R+G+B+M+Y@60s, grenade +20%, mine +20%, rocket +60%
-- oo) 2^(L-7)*1000 R+G+B+M+Y+W@60s, grenade +20%, mine +20%, rocket +50%
-- New values:
-- 1) 100R+G@30s, grenade +25%
-- 2) 200R+G+B+M@60s, grenade +40%, mine +40%, rocket +60%
-- 3) 400R+G+B+M+Y@60s, grenade +60%, mine +60%, rocket +120%
-- oo) 2^(L-4)*500 R+G+B+M+Y+W@60s, grenade +20%, mine +20%, rocket +50%
Tech:get("stronger-explosives-1"):setCost(100):setColors("RG"):setTime(30)
    :setEffect({type="ammo-damage", ammo_category="grenade", modifier=0.25})
Tech:get("stronger-explosives-2"):setCost(200):setColors("RGBM"):setTime(60)
    :setEffects({
        {type="ammo-damage", ammo_category="grenade", modifier=0.40},
        {type="ammo-damage", ammo_category="landmine", modifier=0.40},
        {type="ammo-damage", ammo_category="rocket", modifier=0.60}
    })
Tech:get("stronger-explosives-3"):setCost(400):setColors("RGBM"):setTime(60)
    :setEffects({
        {type="ammo-damage", ammo_category="grenade", modifier=0.60},
        {type="ammo-damage", ammo_category="landmine", modifier=0.60},
        {type="ammo-damage", ammo_category="rocket", modifier=1.20}
    })
Tech:get("stronger-explosives-4"):setColors("RGBMPW"):setTime(60)
    :setCostFormula("2^(L-4)*500"):setInfinite():setPrerequisites({"space-science-pack","stronger-explosives-3"})
    :setEffects({
        {type="ammo-damage", ammo_category="grenade", modifier=0.20},
        {type="ammo-damage", ammo_category="landmine", modifier=0.20},
        {type="ammo-damage", ammo_category="rocket", modifier=0.50}
    })
Tech:get("stronger-explosives-5"):remove()
Tech:get("stronger-explosives-6"):remove()
Tech:get("stronger-explosives-7"):remove()

-- Refined flammables. Original values:
-- 1) 100R+G+M@30s, +20%
-- 2) 200R+G+M@30s, +20%
-- 3) 300R+G+B+M@60s, +20%
-- 4) 400R+G+B+M+Y@60s, +30%
-- 5) 500R+G+B+M+Y@60s, +30%
-- 6) 600R+G+B+M+Y@60s, +40%
-- oo) 2^(L-7)*1000 R+G+B+M+Y+W@60s, +20%
-- New values:
-- 1) 200R+G+M@30s, +30%
-- 2) 300R+G+B+M@60s, +50%
-- 3) 500R+G+B+M+Y@60s, +80%
-- oo) 2^(L-4)*500 R+G+B+M+Y+W@60s, +20%
Tech:get("refined-flammables-1"):setCost(200):setColors("RGM"):setTime(30)
    :setEffects({
        {type="ammo-damage", ammo_category="flamethrower", modifier=0.30},
        {type="turret-attack", turret_id="flamethrower-turret", modifier=0.30}
    })
Tech:get("refined-flammables-2"):setCost(300):setColors("RGBM"):setTime(60)
    :setEffects({
        {type="ammo-damage", ammo_category="flamethrower", modifier=0.50},
        {type="turret-attack", turret_id="flamethrower-turret", modifier=0.50}
    })
Tech:get("refined-flammables-3"):setCost(500):setColors("RGBM"):setTime(60)
    :setEffects({
        {type="ammo-damage", ammo_category="flamethrower", modifier=0.80},
        {type="turret-attack", turret_id="flamethrower-turret", modifier=0.80}
    })
Tech:get("refined-flammables-4"):setColors("RGBMPW"):setTime(60)
    :setCostFormula("2^(L-4)*500"):setInfinite()
    :setEffects({
        {type="ammo-damage", ammo_category="flamethrower", modifier=0.20},
        {type="turret-attack", turret_id="flamethrower-turret", modifier=0.20}
    })
Tech:get("refined-flammables-5"):remove()
Tech:get("refined-flammables-6"):remove()
Tech:get("refined-flammables-7"):remove()

-- Energy weapons damage. Original values:
-- 1) 100R+G+B+M@30s, laser +20%
-- 2) 200R+G+B+M@30s, laser +20%
-- 3) 300R+G+B+M@60s, laser +30%
-- 4) 400R+G+B+M@60s, laser +40%
-- 5) 500R+G+B+M+Y@60s, laser +50%, beam +40%
-- 6) 600R+G+B+M+Y@60s, laser +70%, beam +60%, electric +70%
-- oo) 2^7(L-7)*1000 R+G+B+M+Y+W@60s, laser +70%, beam +30%, electric + 70%
-- New values:
-- 1) 200R+G+B+M@30s, laser +40%
-- 2) 300R+G+B+M@30s, laser +80%, beam +30%
-- 3) 500R+G+B+M+Y@60s, laser +110%, beam +70%, electric +70%
-- oo) 2^7(L-4)*500 R+G+B+M+Y+W@60s, laser +70%, beam +30%, electric + 70%
Tech:get("laser-weapons-damage-1"):setCost(200):setColors("RGBM"):setTime(30) --changed from energy to laser
    :setEffect({type="ammo-damage", ammo_category="laser", modifier=0.40})
Tech:get("laser-weapons-damage-2"):setCost(300):setColors("RGBM"):setTime(30) --changed from energy to laser
    :setEffects({
        {type="ammo-damage", ammo_category="laser", modifier=0.80},
        {type="ammo-damage", ammo_category="beam", modifier=0.30}
    })
Tech:get("laser-weapons-damage-3"):setCost(500):setColors("RGBM"):setTime(60) --changed from energy to laser
    :setEffects({
        {type="ammo-damage", ammo_category="laser", modifier=1.10},
        {type="ammo-damage", ammo_category="beam", modifier=0.70},
        {type="ammo-damage", ammo_category="electric", modifier=0.70}
    })
Tech:get("laser-weapons-damage-4"):setColors("RGBMPW"):setTime(60) --changed from energy to laser
    :setCostFormula("2^7(L-4)*500"):setPrerequisites({"space-science-pack","production-science-pack","laser-weapons-damage-3"}):setInfinite()
    :setEffects({
        {type="ammo-damage", ammo_category="laser", modifier=0.70},
        {type="ammo-damage", ammo_category="beam", modifier=0.30},
        {type="ammo-damage", ammo_category="electric", modifier=0.70}
    })
Tech:get("laser-weapons-damage-5"):remove()
Tech:get("laser-weapons-damage-6"):remove()
Tech:get("laser-weapons-damage-7"):remove()

-- Laser shooting speed. Original values:
-- 1) 50R+G+B+M@30s, +10%
-- 2) 100R+G+B+M@30s, +20%
-- 3) 200R+G+B+M@60s, +30%
-- 4) 200R+G+B+M@60s, +30%
-- 5) 200R+G+B+M+Y@60s, +40%
-- 6) 350R+G+B+M+Y@60s, +40%
-- 7) 450R+G+B+M+Y@60s, +50%
-- New values:
-- 1) 100R+G+B+M@30s, +40%
-- 2) 200R+G+B+M@60s, +70%
-- 3) 400R+G+B+M+Y@60s, +110%
Tech:get("laser-shooting-speed-1"):setCost(100):setColors("RGBM"):setTime(30)
    :setEffect({type="gun-speed", ammo_category="laser", modifier=0.40})
Tech:get("laser-shooting-speed-2"):setCost(200):setColors("RGBM"):setTime(60)
    :setEffect({type="gun-speed", ammo_category="laser", modifier=0.70})
Tech:get("laser-shooting-speed-3"):setCost(400):setColors("RGBM"):setTime(60)
    :setEffect({type="gun-speed", ammo_category="laser", modifier=1.10})
Tech:get("laser-shooting-speed-4"):remove()
Tech:get("laser-shooting-speed-5"):remove()
Tech:get("laser-shooting-speed-6"):remove()
Tech:get("laser-shooting-speed-7"):remove()

-- Artillery shell range. Original values:
-- oo) 2^L*1000 R+G+B+M+Y+W@60s
-- New values:
-- oo) 2^L*500 R+G+B+M+Y+W@60s
Tech:get("artillery-shell-range-1"):setCostFormula("2^L*500"):setColors("RGBMPW"):setInfinite()

-- Artillery shell shooting speed. Original values:
-- oo) 1000+3^(L-1)*1000 R+G+B+M+Y+W@60s
-- New values:
-- oo) 500+3^(L-1)*500 R+G+B+M+Y+W@60s
Tech:get("artillery-shell-speed-1"):setCostFormula("500+3^(L-1)*500"):setColors("RGBMPW"):setInfinite()

-- Fix for follower robot tech
Tech:get("follower-robot-count-4"):setColors("RGBMP")
Tech:get("follower-robot-count-5"):setColors("RGBMPW"):setInfinite()

-- Fix for mining tech
Tech:get("mining-productivity-3"):setColors("RGBMP"):setPrerequisites({"production-science-pack","mining-productivity-2"})
Tech:get("mining-productivity-4"):setColors("RGBMPW"):setPrerequisites({"space-science-pack","mining-productivity-3"}):setInfinite()


