import type { NextApiRequest, NextApiResponse } from 'next'
import * as fs from 'node:fs'
import YAML from 'yaml'
import IRecipeData from "../../../types/IRecipeData";

const DATA_PATH = process.env.DATA_MOUNT_PATH;

export default function handler(req: NextApiRequest, res: NextApiResponse) {
    if (req.method === "GET") {
        // Get the recipe ID from the request
        const {recipeId} = req.query

        // Check for the recipe file
        const recipeFile = `${DATA_PATH}/recipes/${recipeId}.yml`
        if (! fs.existsSync(recipeFile)) {
            res.status(404).json({message: "Recipe not found", searchPath: recipeFile})
            return
        }

        // Read the recipe file and return its data in JSON
        const recipeYaml = fs.readFileSync(recipeFile, 'utf8')
        const recipeJson: IRecipeData = YAML.parse(recipeYaml)

        // Return the recipe data
        res.status(200).json(recipeJson)

    } else {
        res.status(405).end();
    }
}