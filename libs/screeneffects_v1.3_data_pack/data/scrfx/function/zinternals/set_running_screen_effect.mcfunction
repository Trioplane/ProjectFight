$execute unless data storage scrfx:registry screen_effects."$(screen_effect_id)" run return run function scrfx:zinternals/errors/screen_effect_not_found {id: "$(screen_effect_id)"}
$data modify storage scrfx:running_screen_effects running."$(player_id)" set from storage scrfx:registry screen_effects."$(screen_effect_id)"
$execute store result score @s scrfx.zinternals.player.tps run data get storage scrfx:running_screen_effects running."$(player_id)".tps
$execute store result score @s scrfx.zinternals.player.frame_count run data get storage scrfx:running_screen_effects running."$(player_id)".frame_count
$execute if data storage scrfx:running_screen_effects running."$(player_id)".callbacks run scoreboard players set @s scrfx.zinternals.player.has_callbacks 1
scoreboard players operation @s scrfx.zinternals.player.title_time = @s scrfx.zinternals.player.tps
$execute store result storage scrfx:running_screen_effects running."$(player_id)".title_time int 1 run scoreboard players add @s scrfx.zinternals.player.title_time 4
scoreboard players set @s scrfx.zinternals.player.ticks_left 0
$function scrfx:zinternals/set_title_time with storage scrfx:running_screen_effects running."$(player_id)"
