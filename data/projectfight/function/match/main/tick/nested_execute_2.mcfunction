scoreboard players remove .next_match_timer projectfight.match 1
execute if score .next_match_timer projectfight.match matches 100 run function projectfight:match/main/tick/nested_execute_0
execute if score .next_match_timer projectfight.match matches 20 run function projectfight:match/main/tick/nested_execute_1
execute if score .next_match_timer projectfight.match matches ..0 positioned 0.0 0.0 0.0 run function projectfight:match/main/start
