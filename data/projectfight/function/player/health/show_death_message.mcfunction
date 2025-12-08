execute if score @s projectfight.player.id = @p[tag=projectfight.player.temp.attacker] projectfight.player.id run return run tellraw @s {translate: "projectfight.death.generic.self", color: "red", italic: true}
$tellraw @s {translate:"$(translation_key).victim",with:[{"selector":"@p[tag=projectfight.player.temp.attacker]",color:"red"}],color:"gray"}
$summon text_display ~ ~ ~ {Tags:["projectfight.gui.kill_message.resolver"],text:{translate:"$(translation_key).attacker",with:[{"selector":"@a[tag=projectfight.player.temp.victim,tag=projectfight.player.dead]",color:"gold"}],color:"white"}}
execute store result storage projectfight:gui hud.current_player.id int 1 run scoreboard players get @p[tag=projectfight.player.temp.attacker] projectfight.player.id
execute as @p[tag=projectfight.player.temp.attacker] run function projectfight:player/health/show_death_message/update_hud with storage projectfight:gui hud.current_player
kill @n[tag=projectfight.gui.kill_message.resolver]
