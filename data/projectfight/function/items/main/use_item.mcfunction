execute if entity @s[tag=projectfight.player.knockback_stunned] run return 0
scoreboard players add @s projectfight.player.item.using_time 1
execute store result storage projectfight:items temp.player.id int 1 run scoreboard players get @s projectfight.player.id
function projectfight:items/main/use_item/run_current_item with storage projectfight:items temp.player
