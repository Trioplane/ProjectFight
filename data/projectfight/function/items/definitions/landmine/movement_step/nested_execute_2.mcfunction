execute if function projectfight:items/collision/check/block_ahead run return run function projectfight:items/definitions/landmine/movement_step/nested_return_1
execute store result storage projectfight:items temp.item.velocity.horizontal float 0.001 run scoreboard players get @s projectfight.items.velocity.horizontal
execute store result storage projectfight:items temp.item.velocity.vertical float 0.001 run scoreboard players get @s projectfight.items.velocity.vertical
execute store result storage projectfight:items temp.item.velocity.sideward float 0.001 run scoreboard players get @s projectfight.items.velocity.sideward
