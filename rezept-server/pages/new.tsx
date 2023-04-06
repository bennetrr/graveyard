import React from "react";
import styles from "../styles/Page.module.scss";

import Head from "next/head";
import Header from "../components/Header";

export default function New() {
    return (
        <div className={styles.container}>
            <Head>
                <title>New Recipe | RezeptServer</title>
                <link rel="icon" href="/favicon.ico"/>
            </Head>

            <Header/>
            <div className={styles.page_content}>
                <h1>Create a new recipe</h1>
            </div>

        </div>
    );
}
