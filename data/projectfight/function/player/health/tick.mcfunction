execute if score @s projectfight.gui.hud.kill_message.visible matches 1.. run scoreboard players remove @s projectfight.gui.hud.kill_message.visible 1
execute as @s[tag=projectfight.player.dead] run function projectfight:player/health/tick/nested_execute_0
