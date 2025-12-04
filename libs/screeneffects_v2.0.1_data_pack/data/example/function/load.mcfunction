# To add your own screen effects to the global registry,
# simply copy what is shown here.
# You can remove the example files to save space.
 
data modify storage example:scrfx_data screen_effects set value [ \
    { \
        name: "examples:toast", \
        tps: 1, \
        frame_count: 31, \
        path: "example:scrfx/exampletoast" \
    }, \
    { \
        name: "examples:amongus", \
        tps: 1, \
        frame_count: 24, \
        path: "example:scrfx/exampleamongus", \
        callbacks: { \
            "12": "say die" \
        } \
    }, \
    { \
        name: "examples:trophy", \
        tps: 1, \
        frame_count: 46, \
        path: "example:scrfx/exampletrophy" \
    }, \
    { \
        name: "examples:transition", \
        tps: 1, \
        frame_count: 69, \
        path: "example:scrfx/exampletransition", \
        callbacks: { \
            "26": "say This frame covers the whole screen" \
        } \
    }, \
]
function scrfx:api/register_screen_effect/register_group {storage: "example:scrfx_data", path: "screen_effects"}
