function projectfight:match/dice/tick
execute if score .dice_timer projectfight.match matches 1.. run scoreboard players remove .dice_timer projectfight.match 1
execute unless score .dice_timer projectfight.match matches 1.. run function projectfight:match/main/tick/nested_execute_0
