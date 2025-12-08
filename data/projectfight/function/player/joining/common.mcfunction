execute store result storage projectfight:players temp.id int 1 run scoreboard players get @s projectfight.player.id
function projectfight:player/configs/apply_configs with storage projectfight:players temp
execute if score .active projectfight.match matches 1 run function projectfight:player/joining/common/nested_execute_0
