import IRecipeData from "../types/IRecipeData";
import React from "react";
import styles from "../styles/Recipe.module.scss";

export default function renderRecipe(recipeData: IRecipeData | null): JSX.Element {
    if (recipeData === null) return <div>Loading...</div>;

    let steps: JSX.Element[] = [];

    for (let step of recipeData.steps) {
        if (step.hasOwnProperty("step")) {
            // This is a step
            steps.push(
                <tr key={recipeData.steps.indexOf(step)}>
                    <td>{step.step.ingredient}</td>
                    {step.step.hasOwnProperty("processing") ? <td>{step.step.processing}</td> : <></>}
                </tr>
            );
        } else if (step.hasOwnProperty("tip")) {
            // This is a tip
        } else if (step.hasOwnProperty("note")) {
            // This is a note
        }
    }

    return (
        <>
            <span className={styles.recipeCategory}>Kategorie: {recipeData.category}</span>
            <span className={styles.recipeTags}>Tags: {recipeData.tags.join(', ')}</span>
            <span className={styles.recipeTitle}>{recipeData.name}</span>
            <span className={styles.recipeAmount}>{recipeData.amount}</span>
            <div className={styles.recipeSteps}>
                <table>
                    <tbody>
                        {steps}
                    </tbody>
                </table>
            </div>
            <pre>
                {JSON.stringify(recipeData, null, 2)}
            </pre>
        </>
    );
}

