tag @s add projectfight.player.items.temp.owner
execute anchored eyes at @s run function projectfight:items/definitions/firework/use/nested_execute_0
execute as @n[type=item_display, tag=projectfight.items.temp] run function projectfight:items/definitions/firework/use/nested_execute_1
playsound minecraft:entity.firework_rocket.shoot master @s
playsound minecraft:entity.firework_rocket.launch master @s
kill @n[type=marker, tag=projectfight.utils.temp]
tag @n[type=item_display, tag=projectfight.items.temp] remove projectfight.items.temp
tag @s remove projectfight.player.items.temp.owner
