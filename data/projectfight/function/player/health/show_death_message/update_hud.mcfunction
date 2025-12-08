scoreboard players set @s projectfight.gui.hud.kill_message.visible 100
$data modify storage projectfight:players "$(id)".hud.var.kill_message set from entity @n[type=text_display,tag=projectfight.gui.kill_message.resolver] text
