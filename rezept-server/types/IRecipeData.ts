export default interface IRecipeData {
    name: string,
    amount: string,
    category: string,
    tags: string[],
    img?: string,
    steps: (IRecipeStep | IRecipeTip | IRecipeNote)[]
}

export interface IRecipeStep {
    step: {
        ingredient: string,
        processing ? : string
    }
}

export interface IRecipeTip {
    tip: string
}

export interface IRecipeNote {
    note: string
}
