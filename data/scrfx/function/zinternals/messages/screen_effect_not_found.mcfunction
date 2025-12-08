tellraw @a [{text: "[", color: "gray"}, {text: "ScreenEffects", color: "gold"}, {text: "] ", color: "gray"}, {text: "ERROR ", color: "dark_red", underlined: true}, {text: "->", color: "red", underlined: false}]
$tellraw @a [ {"text":"Screen effect '$(id)' does not exist. Did you add the screen effect using the 'scrfx:add_screen_effects' function yet?","color":"red"}, {"text":"\n"} ]
return fail
