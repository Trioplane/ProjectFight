scoreboard objectives add projectfight.player.movement.ledge_grab.cooldown dummy
scoreboard objectives add projectfight.player.movement.slide.cooldown dummy
scoreboard objectives add projectfight.player.movement.slide.time dummy
scoreboard objectives add projectfight.player.movement.slide.shulker.owner dummy
scoreboard objectives add projectfight.player.movement.air_dash.cooldown dummy
scoreboard objectives add projectfight.player.movement.knockback.stun_time dummy
scoreboard objectives add projectfight.player.movement.knockback.has_touched_ground dummy
execute unless entity @n[type=marker, tag=projectfight.player.movement.knockback.push_vector] run summon marker 0.0 0.0 0.0 {Tags: ["projectfight.player.movement.knockback.push_vector"], UUID: [I; 930, 0, 0, 0]}
