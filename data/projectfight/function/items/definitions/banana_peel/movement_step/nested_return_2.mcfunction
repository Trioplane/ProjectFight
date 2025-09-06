execute at @s if function projectfight:items/collision/check/ground run return run function projectfight:items/definitions/banana_peel/movement_step/nested_return_0
execute at @s run function projectfight:items/definitions/banana_peel/movement_step/nested_execute_0
function projectfight:items/movement/move/gravity with storage projectfight:items temp.item.velocity
execute if score @s projectfight.items.velocity.horizontal matches -10..10 run scoreboard players set @s projectfight.items.velocity.horizontal 0
execute if score @s projectfight.items.velocity.horizontal matches 1.. run function projectfight:items/definitions/banana_peel/movement_step/nested_execute_1
execute if score @s projectfight.items.velocity.horizontal matches ..-1 run function projectfight:items/definitions/banana_peel/movement_step/nested_execute_2
execute unless score @s projectfight.items.velocity.vertical matches ..-2000 run scoreboard players remove @s projectfight.items.velocity.vertical 70
