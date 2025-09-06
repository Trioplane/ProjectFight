rotate @s facing entity @n[type=marker, tag=projectfight.utils.temp]
scoreboard players set @s projectfight.items.velocity.horizontal 1200
scoreboard players set @s projectfight.items.velocity.vertical 0
scoreboard players set @s projectfight.items.velocity.sideward 0
function projectfight:items/main/give_id
scoreboard players operation @s projectfight.items.owner = @p[tag=projectfight.player.items.temp.owner] projectfight.player.id
