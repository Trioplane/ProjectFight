execute unless entity @s[tag=projectfight.items.wet_floor_sign.placed] run return run function projectfight:items/definitions/wet_floor_sign/movement_step/nested_return_2
execute if entity @s[tag=projectfight.items.wet_floor_sign.activated] run return run function projectfight:items/definitions/wet_floor_sign/movement_step/nested_return_3
execute align xyz positioned ~-4.5 ~ ~-4.5 if entity @a[tag=!projectfight.player.dead, dx=9, dy=0, dz=9] run tag @s add projectfight.items.wet_floor_sign.activated
