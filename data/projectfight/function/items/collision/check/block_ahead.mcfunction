execute if predicate projectfight:is_in_kill_plane run return 1
execute if score @s projectfight.items.age matches 500.. run return 1
execute positioned ^ ^ ^0.5 unless block ~ ~ ~ #air run return 1
execute positioned ^ ^ ^1.0 unless block ~ ~ ~ #air run return 1
execute positioned ^ ^ ^1.5 unless block ~ ~ ~ #air run return 1
