import { parseArgs } from "jsr:@std/cli";
import { resolve, join } from "jsr:@std/path";
import { walk, exists, ensureDir } from "jsr:@std/fs";

function parseArguments(args) {
    const booleanArgs = ["combine-variations", "help"]
    const stringArgs = ["rp-path", "namespace"]
    const alias = {
        "combine-variations": "c",
        "help": "h",
    }

    return parseArgs(args, {
        alias: alias,
        boolean: booleanArgs,
        string: stringArgs,
        stopEarly: false,
        "--": true
    })
}

function printHelp() {
    console.log(`
Usage: generate_items_definition [OPTIONS...]\n
    Required flag:
    --namespace                      Namespace to search for models.
                                        Errors if the namespace does not exist.

    Optional flags:
    --rp-path                        Select the resource pack path.
                                        Default: current directory
                                        Errors if the RP structure is not valid.

    -c, --combine-variations         Whether to combine models with the same starting name but different suffixes.
                                        Example: 'model_red.json', 'model_green.json', 'model_blue.json' > 'model.json'
                                        Default: false
    -h, --help                       Opens this message.
    `)
}

function validateNamespace(namespace) {
    if (!/^[a-z0-9._-]+$/.test(namespace)) {
        console.error(`%cInvalid namespace. See https://minecraft.wiki/w/Resource_location#Legal_characters for reference.`, "color: red;")
        Deno.exit(2)
    }
}

async function validateResourcePackStructure(rpPath, namespace) {
    if (!await exists(rpPath)) {
        console.error(`%c'${rpPath}' does not exist.`, "color: red;")
        Deno.exit(2)
    }

    if (!await exists(join(rpPath, "assets"))) {
        console.error("%cInvalid resource pack structure. No assets directory found.", "color: red;")
        Deno.exit(1)
    }
    console.log("%cFound assets directory.", "color: green;")

    if (!await exists(join(rpPath, "assets", namespace))) {
        console.error(`%cNo 'assets/${namespace}' found.`, "color: red;")
        Deno.exit(1)
    }
    console.log(`%cFound assets/${namespace}`, "color: green;")

    if (!await exists(join(rpPath, "assets", namespace, "models"))) {
        console.error(`%cNo 'assets/${namespace}/models' found.`, "color: red;")
        Deno.exit(1)
    }
    console.log(`%cFound assets/${namespace}/models`, "color: green;")

    if (!await exists(join(rpPath, "assets", namespace, "models", "item"))) {
        console.error(`%cNo 'assets/${namespace}/models/item' found.`, "color: red;")
        Deno.exit(1)
    }
    console.log(`%cFound assets/${namespace}/models/item`, "color: green;")

    if (!await exists(join(rpPath, "assets", namespace, "items"))) {
        console.error(`%cNo 'assets/${namespace}/items' found.`, "color: red;")
        Deno.exit(1)
    }
    console.log(`%cFound assets/${namespace}/items`, "color: green;")

    return true
}

const itemsDefinitionTemplate = {
    "model": {
        "type": "minecraft:model",
        "model": ""
    }
}
const itemsDefinitionWithVariationsTemplate = {
    "model": {
        "type": "minecraft:select",
        "property": "minecraft:custom_model_data",
        "index": 0,
        "fallback": {
            "type": "minecraft:model",
            "model": ""
        },
        "cases": [
            { "when": "red", "model": { "type": "model", "model": "projectfight:item/general/beach_chair_red" } },
        ]
    }
}

async function main(inputArgs) {
    const args = parseArguments(inputArgs)

    if (args.help) {
        printHelp();
        Deno.exit()
    }

    const rpPath = resolve(args["rp-path"] ?? Deno.cwd())
    const combineVariations = args["combine-variations"] ?? false
    const namespace = args["namespace"]
    
    // Validation checks
    if (namespace == null) {
        console.error("%cNo namespace provided.", "color: red;")
        Deno.exit(2)
    }

    validateNamespace(namespace)    
    await validateResourcePackStructure(rpPath, namespace)
    
    const modelsPath = join(rpPath, "assets", namespace, "models", "item")
    const itemsPath = join(rpPath, "assets", namespace, "items")


    console.log("Generating items definitions... (For help, use -h / --help)")

    const textEncoder = new TextEncoder()

    if (combineVariations) {
        const models = []

        for await (const dirEntry of walk(modelsPath)) {
            if (dirEntry.isDirectory || !dirEntry.name.endsWith(".json")) {
                continue
            }

            const relativePath = dirEntry.path.replace(modelsPath, "")
            const resourceLocation = `${namespace}:${relativePath.replaceAll("\\","/").replace(".json","").slice(1)}`

            models.push({ relativePath, resourceLocation })
        }

        // Determining groups
        // Start with the shortest names first to avoid cases like:
        // beach_chair_blue, beach_chair_red > beach_chair
        // beach_chair_with_x, beach_chair_with_y > beach_chair_with
        models.sort((a, b) => a.resourceLocation.length - b.resourceLocation.length)

        for (const model of models) {
            model.resourceLocation
        }

        console.log(models)
        console.log("WIP")
        console.log("WIP")
        console.log("WIP")
        console.log("WIP")
    } else {
        // Better to do everything in this one loop if it only has to do 1 task.
        for await (const dirEntry of walk(modelsPath)) {
            if (dirEntry.isDirectory || !dirEntry.name.endsWith(".json")) {
                continue
            }

            const relativePath = dirEntry.path.replace(modelsPath, "")
            const resourceLocation = `${namespace}:${relativePath.replaceAll("\\","/").replace(".json","").slice(1)}`
            const itemsDefinitionPath = join(itemsPath, relativePath)

            const itemsDefinition = {...itemsDefinitionTemplate}
            itemsDefinition.model.model = resourceLocation

            await ensureDir(itemsDefinitionPath.replace(dirEntry.name, ""))

            await Deno.writeFile(
                itemsDefinitionPath,
                textEncoder.encode(JSON.stringify(itemsDefinition))
            )

            console.log(`%cGenerated ${resourceLocation}`, `color: green;`)
        }
    }
    
}

await main(Deno.args)