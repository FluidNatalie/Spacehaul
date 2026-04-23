local Common = require "utils.common"

data:extend
({
{
    type = "recipe",
    name = "alt-electric-pole",
    enabled = true,
    ingredients =
    {
      {type = "item", name = "wood", amount = 1},
      {type = "item", name = "copper-cable", amount = 2}
    },
    results = {{type="item", name="medium-electric-pole", amount=2}}
  }
})