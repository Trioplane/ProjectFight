const file = "./unifont_neg.json"
const json = JSON.parse(new TextDecoder().decode(await Deno.readFile(file)))

for (const provider of json.providers) {
    for (const advance in provider.advances) {
        provider.advances[advance] /= 2
    }
}

const newFile = `${file.replace("_neg.json","")}_half_neg.json`

await Deno.writeFile(newFile, new TextEncoder().encode(JSON.stringify(json,null,2)))