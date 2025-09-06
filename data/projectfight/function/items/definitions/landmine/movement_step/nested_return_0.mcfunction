particle minecraft:dust{color: [0.3f, 0.3f, 0.3f], scale: 1} ~ ~ ~ 0.2 0.2 0.2 1 5
particle minecraft:dust{color: [0.5f, 0.5f, 0.5f], scale: 1.5d} ~ ~ ~ 0.3 0.2 0.3 1 5
playsound minecraft:block.vault.insert_item master @a ~ ~ ~ 0.5
tag @s add projectfight.items.landmine.placed
execute unless block ~ ~ ~ #air run return run function projectfight:items/definitions/generic_placeable/find_ground_up
function projectfight:items/definitions/generic_placeable/find_ground_down
