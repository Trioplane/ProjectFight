execute if predicate projectfight:is_in_kill_plane run return 1
execute as @s[tag=projectfight.items.marked_for_collision] run return 1
execute if score @s projectfight.items.age matches 500.. run return 1
execute unless block ~ ~ ~ #air run return 1
execute positioned ~ ~-0.5 ~ unless block ~ ~ ~ #air run tag @s add projectfight.items.marked_for_collision
