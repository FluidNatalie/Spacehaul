-- Change the items available in the Spaceship debris
script.on_init(function (event)

  -- This only applies to Freeplay, trying to set it in other game modes would fail
  if remote.interfaces.freeplay then

    -- Items on the main spaceship entity
    remote.call("freeplay", "set_ship_items", {
      -- Keep the 8 yellow magazines from vanilla
      ["firearm-magazine"] = 8,
      -- Add a basic construction bot kit for Underhaul
      ["personal-roboport-equipment"] = 1,
      ["construction-robot"] = 7,
      ["solar-panel-equipment"] = 3,
      ["battery-equipment"] = 1
    })

    -- Items scattered in the small debris entities
    remote.call("freeplay", "set_debris_items", {
      -- Keep the 8 iron plates from vanilla
      ["iron-plate"] = 8,
      -- Add some belts and solid fuel for Underhaul
      ["fast-transport-belt"] = 20,
      ["solid-fuel"] = 16
    })
  end

end)