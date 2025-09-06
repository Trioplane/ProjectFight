tag @s add projectfight.items.temp.impact
execute as @a if score @s projectfight.player.id = @n[type=item_display, tag=projectfight.items.temp.impact] projectfight.items.owner run tag @s add projectfight.player.temp.attacker
execute as @a[distance=..3] run function projectfight:items/definitions/firework/on_impact/nested_execute_0
function projectfight:player/health/apply_damage
particle minecraft:flash ~ ~ ~ 0 0 0 1 1
particle minecraft:firework ~ ~ ~ 0 0 0 0.4 20
playsound minecraft:entity.firework_rocket.large_blast master @a
playsound minecraft:entity.firework_rocket.blast master @a
playsound minecraft:entity.firework_rocket.twinkle master @a
kill @s
