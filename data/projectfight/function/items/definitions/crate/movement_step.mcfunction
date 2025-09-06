execute at @s if function projectfight:items/collision/check/basic run return run function projectfight:items/definitions/crate/on_impact
execute store result storage projectfight:items temp.item.velocity.horizontal float 0.001 run scoreboard players get @s projectfight.items.velocity.horizontal
execute store result storage projectfight:items temp.item.velocity.vertical float 0.001 run scoreboard players get @s projectfight.items.velocity.vertical
execute store result storage projectfight:items temp.item.velocity.sideward float 0.001 run scoreboard players get @s projectfight.items.velocity.sideward
function projectfight:items/movement/move/gravity with storage projectfight:items temp.item.velocity
execute unless score @s projectfight.items.velocity.horizontal matches ..0 run scoreboard players remove @s projectfight.items.velocity.horizontal 70
execute unless score @s projectfight.items.velocity.vertical matches ..-2000 run scoreboard players remove @s projectfight.items.velocity.vertical 40
scoreboard players add @s projectfight.items.velocity.sideward 0
