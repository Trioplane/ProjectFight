execute as @e[type=item_display, tag=projectfight.items] run scoreboard players add @s projectfight.items.age 1
function projectfight:items/movement/run_movement_functions
execute as @e[type=item_display, tag=projectfight.items.banana_peel] at @s run function projectfight:items/definitions/banana_peel/movement_step
execute as @e[type=item_display, tag=projectfight.items.crate] at @s run function projectfight:items/definitions/crate/movement_step
execute as @e[type=item_display, tag=projectfight.items.firework] at @s run function projectfight:items/definitions/firework/movement_step
execute as @e[type=item_display, tag=projectfight.items.landmine] at @s run function projectfight:items/definitions/landmine/movement_step
