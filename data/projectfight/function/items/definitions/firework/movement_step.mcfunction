execute at @s if function projectfight:items/collision/check/basic_extended run return run function projectfight:items/definitions/firework/on_impact
playsound minecraft:entity.silverfish.ambient master @a ~ ~ ~ 0.5 1.5
particle minecraft:firework
execute positioned ^ ^ ^-1 run particle minecraft:firework
execute positioned ^ ^ ^-2 run particle minecraft:firework
execute store result storage projectfight:items temp.item.speed float 0.001 run scoreboard players get @s projectfight.items.speed
function projectfight:items/movement/move/no_gravity with storage projectfight:items temp.item
