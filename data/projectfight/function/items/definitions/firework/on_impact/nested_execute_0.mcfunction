tag @s add projectfight.player.temp.victim
scoreboard players add @s projectfight.player.damage_to_deal 15
execute facing entity @s eyes positioned 0.0 0.0 0.0 run tp 000003a2-0000-0000-0000-000000000000 ^ ^ ^10 ~ ~
function projectfight:player/movement/knockback/apply
