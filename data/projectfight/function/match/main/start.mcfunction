tag @a add projectfight.player.playing
function projectfight:match/main/clear_map
execute positioned 0.0 0.0 0.0 run function projectfight:match/main/place_walls
execute positioned 0.0 0.0 0.0 run function projectfight:match/main/place_map
data modify storage projectfight:match loadout.items set value ["crate", "firework", "landmine", "banana_peel", "wet_floor_sign"]
gamemode adventure @a[tag=projectfight.player.playing]
execute as @a[tag=projectfight.player.playing] run tp @s @n[type=marker, tag=projectfight.match.spawn, sort=random]
scoreboard players set .active projectfight.match 1
scoreboard players set .time_left projectfight.match 6000
