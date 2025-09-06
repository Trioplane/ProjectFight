execute as @a[tag=projectfight.player.temp.victim, tag=!projectfight.player.dead, gamemode=!creative] run function projectfight:player/health/apply_damage/nested_execute_1
tag @a[tag=projectfight.player.temp.victim] remove projectfight.player.temp.victim
tag @a[tag=projectfight.player.temp.attacker] remove projectfight.player.temp.attacker
