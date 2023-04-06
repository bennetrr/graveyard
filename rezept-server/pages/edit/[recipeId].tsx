import React from "react";
import styles from "../../styles/Page.module.scss";

import Head from "next/head";
import Header from "../../components/Header";
import {useRouter} from "next/router";

export default function New() {
    const router = useRouter();
    const {recipeId} = router.query;

    return (
        <div className={styles.container}>
            <Head>
                <title>{recipeId} | RezeptServer</title>
                <link rel="icon" href="/favicon.ico"/>
            </Head>

            <Header/>
            <div className={styles.page_content}>
                <h1>Editing recipe "{recipeId}"</h1>
            </div>

        </div>
    );
}
