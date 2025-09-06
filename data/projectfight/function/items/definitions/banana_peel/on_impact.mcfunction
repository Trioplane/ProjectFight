tag @s add projectfight.items.temp.impact
execute as @a if score @s projectfight.player.id = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.owner run tag @s add projectfight.player.temp.attacker
execute as @a[distance=..1] run function projectfight:items/definitions/banana_peel/on_impact/nested_execute_0
function projectfight:player/health/apply_damage
playsound minecraft:block.honey_block.fall master @a ~ ~ ~ 1 1
playsound minecraft:block.honey_block.hit master @a ~ ~ ~ 1 1
playsound minecraft:entity.witch.celebrate master @a ~ ~ ~ 1 2
particle minecraft:block_crumble{block_state: {Name: "minecraft:honey_block"}} ~ ~ ~ 0.3 0.3 0.3 1 10
execute as @e[type=item_display, tag=projectfight.items.initial_rotation] if score @s projectfight.items.owner = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.id run kill @s
kill @s
