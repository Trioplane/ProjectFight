function projectfight:match/dice/tick
execute if score .dice_timer projectfight.match matches 1.. run scoreboard players remove .dice_timer projectfight.match 1
execute unless score .dice_timer projectfight.match matches 1.. run function projectfight:match/main/tick/nested_execute_3
scoreboard players remove .time_left projectfight.match 1
execute if score .time_left projectfight.match matches 1200 run function projectfight:match/main/tick/nested_execute_4
execute if score .time_left projectfight.match matches 600 run function projectfight:match/main/tick/nested_execute_5
execute if score .time_left projectfight.match matches 100 run function projectfight:match/main/tick/nested_execute_6
execute if score .time_left projectfight.match matches 20 run function projectfight:match/main/tick/nested_execute_7
execute if score .time_left projectfight.match matches ..0 positioned 0.0 0.0 0.0 run function projectfight:match/main/end
