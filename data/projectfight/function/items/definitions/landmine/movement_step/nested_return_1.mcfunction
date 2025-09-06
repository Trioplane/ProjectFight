scoreboard players operation @s projectfight.items.velocity.horizontal *= $-1 bolt.expr.const
scoreboard players operation @s projectfight.items.velocity.horizontal /= $5 bolt.expr.const
execute store result storage projectfight:items temp.item.velocity.horizontal float 0.001 run scoreboard players get @s projectfight.items.velocity.horizontal
execute store result storage projectfight:items temp.item.velocity.vertical float 0.001 run scoreboard players get @s projectfight.items.velocity.vertical
