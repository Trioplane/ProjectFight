tag @s add projectfight.items.temp.impact
execute as @a if score @s projectfight.player.id = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.owner run tag @s add projectfight.player.temp.attacker
execute align xyz positioned ~-5.5 ~ ~-5.5 as @a[tag=!projectfight.player.dead, dx=11, dy=4.4, dz=11] positioned ~5.5 ~ ~5.5 run function projectfight:items/definitions/wet_floor_sign/on_impact/nested_execute_0
data modify storage projectfight:health temp.damage.translation_key set value "projectfight.death.slip"
function projectfight:player/health/apply_damage
playsound minecraft:block.conduit.deactivate
playsound minecraft:block.netherite_block.fall master @a ~ ~ ~ 1 1
playsound minecraft:block.netherite_block.hit master @a ~ ~ ~ 1 1
playsound minecraft:entity.witch.celebrate master @a ~ ~ ~ 1 2
playsound minecraft:entity.ravager.celebrate master @a ~ ~ ~ 1 1.5
particle minecraft:dust_plume ~ ~ ~ 1 1 1 0.5 25
particle minecraft:campfire_signal_smoke ~ ~0.2 ~ 1 0.3 1 0.1 20
particle minecraft:dust_pillar{block_state: {Name: "yellow_concrete_powder"}} ~ ~ ~ 1 1 1 1 40
execute on passengers run kill @s
execute as @e[type=item_display, tag=projectfight.items.initial_rotation] if score @s projectfight.items.owner = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.id run kill @s
kill @s
