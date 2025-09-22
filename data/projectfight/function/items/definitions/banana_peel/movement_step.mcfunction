execute unless entity @s[tag=projectfight.items.banana_peel.placed] run return run function projectfight:items/definitions/banana_peel/movement_step/nested_return_2
execute align xyz positioned ~ ~ ~ if entity @a[tag=!projectfight.player.dead, dx=1, dy=0, dz=1] run function projectfight:items/definitions/banana_peel/on_impact
