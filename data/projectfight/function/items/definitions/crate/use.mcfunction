tag @s add projectfight.player.items.temp.owner
execute anchored eyes at @s run function projectfight:items/definitions/crate/use/nested_execute_0
execute as @n[type=item_display, tag=projectfight.items.temp] run function projectfight:items/definitions/crate/use/nested_execute_1
summon item_display 0 0 0 {Tags: ["projectfight.items.initial_rotation", "projectfight.items.initial_rotation.temp"]}
execute as @n[type=item_display, tag=projectfight.items.initial_rotation.temp] run function projectfight:items/definitions/crate/use/nested_execute_2
playsound minecraft:entity.arrow.shoot master @s
kill @n[type=marker, tag=projectfight.utils.temp]
tag @n[type=item_display, tag=projectfight.items.temp] remove projectfight.items.temp
tag @s remove projectfight.player.items.temp.owner
