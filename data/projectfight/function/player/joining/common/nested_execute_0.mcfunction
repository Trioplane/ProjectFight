tellraw @s {text: "It seems like theres a match currently playing. Please wait for the match to end.", color: "gray"}
gamemode spectator @s
spectate @s @r[tag=projectfight.player.playing]
