execute as @s[tag=projectfight.player.initv0.0.1, scores={projectfight.player.left_game=1..}] run return run function projectfight:player/joining/prejoin
execute as @s[tag=!projectfight.player.initv0.0.1] run return run function projectfight:player/joining/first_join
