execute store result score @s projectfight.player.id run scoreboard players add .projectfight.var.nextid projectfight.player.id 1
tag @s add projectfight.player.initv0.0.1
function projectfight:player/joining/common
scoreboard players enable @s projectfight.player.joining.start_intro.first_join
effect give @s blindness infinite 1 true
dialog show @s projectfight:player/joining/wait_for_resource_pack/first_join
tellraw @s {text: "[ProjectFight] player initalized"}
