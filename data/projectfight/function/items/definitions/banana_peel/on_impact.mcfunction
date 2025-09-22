tag @s add projectfight.items.temp.impact
execute as @a if score @s projectfight.player.id = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.owner run tag @s add projectfight.player.temp.attacker
execute align xyz positioned ~ ~ ~ as @a[tag=!projectfight.player.dead, dx=0, dy=0.0, dz=0] positioned ~ ~ ~ run function projectfight:items/definitions/banana_peel/on_impact/nested_execute_0
data modify storage projectfight:health temp.damage.translation_key set value "projectfight.death.generic"
function projectfight:player/health/apply_damage
playsound minecraft:block.honey_block.fall master @a ~ ~ ~ 1 1
playsound minecraft:block.honey_block.hit master @a ~ ~ ~ 1 1
playsound minecraft:entity.witch.celebrate master @a ~ ~ ~ 1 2
particle minecraft:block_crumble{block_state: {Name: "minecraft:honey_block"}} ~ ~ ~ 0.3 0.3 0.3 1 10
execute on passengers run kill @s
execute as @e[type=item_display, tag=projectfight.items.initial_rotation] if score @s projectfight.items.owner = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.id run kill @s
kill @s
