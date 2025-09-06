execute unless entity @s[tag=projectfight.items.banana_peel.placed] run return run function projectfight:items/definitions/banana_peel/movement_step/nested_return_2
execute if entity @a[distance=..1] run function projectfight:items/definitions/banana_peel/on_impact
