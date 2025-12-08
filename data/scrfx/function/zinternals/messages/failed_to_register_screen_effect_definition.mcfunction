tellraw @a [{text: "\n"}, {text: "[", color: "gray"}, {text: "ScreenEffects", color: "gold"}, {text: "] ", color: "gray"}, {text: "ERROR ", color: "dark_red", underlined: true}, {text: "->", color: "red", underlined: false}]
$tellraw @a [ {"text":"Could not find and register screen effect '$(path)' from storage '$(storage)'.","color":"red"}, {"text":"\n"} ]
return fail
