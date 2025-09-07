execute unless entity @s[tag=projectfight.items.landmine.placed] run return run function projectfight:items/definitions/landmine/movement_step/nested_return_2
execute if entity @s[tag=projectfight.items.landmine.activated] run return run function projectfight:items/definitions/landmine/movement_step/nested_return_3
execute if entity @a[tag=!projectfight.player.dead, distance=..2] run function projectfight:items/definitions/landmine/movement_step/nested_execute_3
