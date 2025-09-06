tag @s add projectfight.items.temp.impact
execute as @a if score @s projectfight.player.id = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.owner run tag @s add projectfight.player.temp.attacker
execute as @a[distance=..6] run function projectfight:items/definitions/crate/on_impact/nested_execute_0
function projectfight:player/health/apply_damage
playsound minecraft:entity.wither.break_block master @a
particle minecraft:block{block_state: {Name: "minecraft:dark_oak_planks"}} ~ ~ ~ 1 1 1 1 30
particle minecraft:campfire_cosy_smoke ~ ~ ~ 0.2 0.2 0.2 0.2 20 normal
execute as @e[type=item_display, tag=projectfight.items.initial_rotation] if score @s projectfight.items.owner = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.id run kill @s
kill @s
