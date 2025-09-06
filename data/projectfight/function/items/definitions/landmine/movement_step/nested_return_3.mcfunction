execute if score @s projectfight.items.trigger_delay matches 1.. run scoreboard players remove @s projectfight.items.trigger_delay 1
execute if score @s projectfight.items.trigger_delay matches 0 run function projectfight:items/definitions/landmine/on_impact
