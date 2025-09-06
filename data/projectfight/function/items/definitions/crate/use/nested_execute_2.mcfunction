execute rotated as @n[type=item_display, tag=projectfight.items.temp] run rotate @s ~ ~
scoreboard players operation @s projectfight.items.owner = @n[type=item_display, tag=projectfight.items.temp] projectfight.items.id
tag @s remove projectfight.items.initial_rotation.temp
