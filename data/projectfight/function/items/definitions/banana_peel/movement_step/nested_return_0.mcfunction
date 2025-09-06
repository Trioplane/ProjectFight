particle minecraft:falling_honey ~ ~ ~ 0.3 0.5 0.3 1 5
playsound minecraft:block.honey_block.fall master @a ~ ~ ~ 1 2
tag @s add projectfight.items.banana_peel.placed
execute unless block ~ ~ ~ #air run return run function projectfight:items/definitions/generic_placeable/find_ground_up
function projectfight:items/definitions/generic_placeable/find_ground_down
