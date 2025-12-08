scoreboard players operation @s projectfight.player.damage_to_deal *= @s projectfight.player.weakness_modifier
scoreboard players operation @s projectfight.player.damage_to_deal *= @p[tag=projectfight.player.temp.attacker] projectfight.player.strength_modifier
tellraw @a "====START====="
tellraw @a {score: {name: "@s", objective: "projectfight.player.damage_to_deal"}}
scoreboard players operation #temp projectfight.player.damage_to_deal = @p[tag=projectfight.player.temp.attacker] projectfight.player.hit_combo
scoreboard players operation #temp projectfight.player.damage_to_deal *= #100 projectfight.util.constants
scoreboard players operation #temp projectfight.player.damage_to_deal /= #10 projectfight.util.constants
scoreboard players add #temp projectfight.player.damage_to_deal 100
scoreboard players operation @s projectfight.player.damage_to_deal *= #temp projectfight.player.damage_to_deal
tellraw @a {score: {name: "@s", objective: "projectfight.player.damage_to_deal"}}
scoreboard players operation @s projectfight.player.damage_to_deal /= #1000000 projectfight.util.constants
execute if score @p[tag=projectfight.player.temp.attacker] projectfight.player.hit_combo matches 50.. run scoreboard players add @s projectfight.player.damage_to_deal 250
tellraw @a {score: {name: "@s", objective: "projectfight.player.damage_to_deal"}}
tellraw @a "====END======"
scoreboard players operation @s projectfight.player.health -= @s projectfight.player.damage_to_deal
execute if score @s projectfight.player.damage_to_deal matches ..0 if score @s projectfight.player.health > @s projectfight.player.max_health run scoreboard players operation @s projectfight.player.health = @s projectfight.player.max_health
execute if score @s projectfight.player.health matches ..0 run function projectfight:player/health/apply_damage/nested_execute_0
scoreboard players set @s projectfight.player.damage_to_deal 0
function projectfight:player/health/calculate_hit_combo
