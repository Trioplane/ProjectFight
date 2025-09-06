scoreboard players set @s projectfight.player.left_game 0
scoreboard players enable @s projectfight.player.joining.start_intro.rejoin
effect give @s blindness infinite 1 true
dialog show @s projectfight:player/joining/wait_for_resource_pack/rejoin
function projectfight:player/joining/common
