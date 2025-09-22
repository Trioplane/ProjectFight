execute unless entity @s[tag=projectfight.items.landmine.placed] run return run function projectfight:items/definitions/landmine/movement_step/nested_return_2
execute if entity @s[tag=projectfight.items.landmine.activated] run return run function projectfight:items/definitions/landmine/movement_step/nested_return_3
execute align xyz positioned ~-0.5 ~ ~-0.5 if entity @a[tag=!projectfight.player.dead, dx=1, dy=0, dz=1] run function projectfight:items/definitions/landmine/movement_step/nested_execute_5
