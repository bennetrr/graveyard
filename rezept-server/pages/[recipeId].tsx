import React, {useEffect, useState} from "react";
import styles from "../styles/Page.module.scss";

import Head from "next/head";
import Header from "../components/Header";
import {useRouter} from "next/router";
import axios from "axios";
import IRecipeData from "../types/IRecipeData";
import renderRecipe from "../components/RenderRecipe";

export default function ViewRecipe() {
    const router = useRouter();
    const {recipeId} = router.query;
    const [recipeData, setRecipeData] = useState<IRecipeData | null>(null);

    useEffect(() => {
        if (recipeId === undefined) return;
        let url = `/api/read-recipe/${recipeId}`;

        axios.get(url)
            .then((r) => setRecipeData(r.data))
            .catch((e) => console.log(e));
    });

    return (
        <div className={styles.container}>
            <Head>
                <title>{`${recipeData?.name || 'Loading...'} | RezeptServer`}</title>
                <link rel="icon" href="/favicon.ico"/>
            </Head>

            <Header/>
            <div className={styles.page_content}>
                {renderRecipe(recipeData)}
            </div>
        </div>
    );
}
