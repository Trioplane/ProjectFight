execute store result score @s projectfight.player.item.is_using run advancement revoke @s only projectfight:use_item
execute if score @s projectfight.player.item.is_using matches 0 run scoreboard players set @s projectfight.player.item.using_time 0
execute store result score @s projectfight.player.item.has_item run clear @s *[custom_data~{projectfight: {is_item: true}}] 0
