execute as @p[tag=projectfight.player.temp.attacker] unless score @s projectfight.player.hit_combo matches 50.. run scoreboard players add @s projectfight.player.hit_combo 1
scoreboard players set @s projectfight.player.hit_combo 0
