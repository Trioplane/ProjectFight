scoreboard players operation @s projectfight.player.damage_to_deal *= @s projectfight.player.weakness_modifier
scoreboard players operation @s projectfight.player.damage_to_deal *= @p[tag=projectfight.player.temp.attacker] projectfight.player.strength_modifier
scoreboard players operation @s projectfight.player.health -= @s projectfight.player.damage_to_deal
execute if score @s projectfight.player.damage_to_deal matches ..0 if score @s projectfight.player.health > @s projectfight.player.max_health run scoreboard players operation @s projectfight.player.health = @s projectfight.player.max_health
execute if score @s projectfight.player.health matches ..0 run function projectfight:player/health/apply_damage/nested_execute_0
scoreboard players set @s projectfight.player.damage_to_deal 0
