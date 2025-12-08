tag @a remove projectfight.player.playing
function projectfight:match/main/clear_map
kill @e[tag=projectfight.items]
execute positioned 0.0 0.0 0.0 run function projectfight:match/main/place_walls
execute positioned 0.0 0.0 0.0 run function projectfight:match/main/place_lobby
scoreboard players set .active projectfight.match 0
scoreboard players set .next_match_timer projectfight.match 400
tp @a 50 10 50
clear @a
tellraw @a {text: "Next match starts in 20 seconds.", color: "gray"}
