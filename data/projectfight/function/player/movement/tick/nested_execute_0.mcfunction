execute at @s as @e[type=item_display, tag=projectfight.player.movement.slide.shulker_vehicle, predicate=projectfight:util/compare_score/player.movement.slide.shulker.owner] positioned ~ ~1 ~ rotated ~ 0 run tp @s ^ ^ ^1
scoreboard players remove @s projectfight.player.movement.slide.time 1
