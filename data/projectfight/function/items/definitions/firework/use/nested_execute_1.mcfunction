rotate @s facing entity @n[type=marker, tag=projectfight.utils.temp]
scoreboard players set @s projectfight.items.speed 3000
function projectfight:items/main/give_id
scoreboard players operation @s projectfight.items.owner = @p[tag=projectfight.player.items.temp.owner] projectfight.player.id
