title @a times 0.8s 5s 0.8s
title @a title {text: "\ue000", font: "projectfight:scrfx/intro45"}
execute as @a run function projectfight:player/movement/knockback/enable
execute as @a at @s run playsound minecraft:block.conduit.deactivate master
execute as @a at @s run playsound minecraft:block.beacon.deactivate master
