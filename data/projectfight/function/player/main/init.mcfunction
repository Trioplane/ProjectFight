scoreboard objectives add projectfight.player.id dummy
scoreboard objectives add projectfight.player.display.owner dummy
scoreboard objectives add projectfight.player.left_game minecraft.custom:minecraft.leave_game
scoreboard players add .projectfight.var.nextid projectfight.player.id 0
function projectfight:player/joining/init
function projectfight:player/health/init
function projectfight:player/movement/init
