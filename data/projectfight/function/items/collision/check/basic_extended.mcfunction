execute if predicate projectfight:is_in_kill_plane run return 1
execute as @s[tag=projectfight.items.marked_for_collision] run return 1
execute if score @s projectfight.items.age matches 500.. run return 1
execute if score @s projectfight.items.age matches 5.. as @a[dx=0, distance=..3] positioned ~-1 ~ ~-1 if entity @s[dx=0] run return 1
execute unless block ~ ~ ~ #air run return 1
tag @s add projectfight.items.temp.ahead_collision_check
execute positioned ^ ^ ^0.5 run function projectfight:items/collision/check/basic_extended/nested_execute_0
execute positioned ^ ^ ^1.0 run function projectfight:items/collision/check/basic_extended/nested_execute_1
execute positioned ^ ^ ^1.5 run function projectfight:items/collision/check/basic_extended/nested_execute_2
execute positioned ^ ^ ^2.0 run function projectfight:items/collision/check/basic_extended/nested_execute_3
execute positioned ^ ^ ^2.5 run function projectfight:items/collision/check/basic_extended/nested_execute_4
execute positioned ^ ^ ^3.0 run function projectfight:items/collision/check/basic_extended/nested_execute_5
execute positioned ^ ^ ^3.5 run function projectfight:items/collision/check/basic_extended/nested_execute_6
tag @s remove projectfight.items.temp.ahead_collision_check
