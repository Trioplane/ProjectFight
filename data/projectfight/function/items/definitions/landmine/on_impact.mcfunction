tag @s add projectfight.items.temp.impact
execute as @a if score @s projectfight.player.id = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.owner run tag @s add projectfight.player.temp.attacker
execute as @a[tag=!projectfight.player.dead, distance=..5] run function projectfight:items/definitions/landmine/on_impact/nested_execute_0
data modify storage projectfight:health temp.damage.translation_key set value "projectfight.death.explosive_placeable"
function projectfight:player/health/apply_damage
playsound minecraft:entity.generic.explode master @a
particle minecraft:campfire_cosy_smoke ~ ~ ~ 0.2 0.2 0.2 0.2 20
particle minecraft:poof ~ ~ ~ 0.2 0.2 0.2 0.2 10
execute as @e[type=item_display, tag=projectfight.items.initial_rotation] if score @s projectfight.items.owner = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.id run kill @s
kill @s
