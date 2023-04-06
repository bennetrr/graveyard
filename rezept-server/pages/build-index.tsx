import React from "react";
import styles from "../styles/Page.module.scss";

import Head from "next/head";

export default function RebuildIndex() {
    return (
        <div className={styles.container}>
            <Head>
                <title>Rebuilding Recipe Index... | RezeptServer</title>
                <link rel="icon" href="/favicon.ico" />
            </Head>

            <div className={styles.empty_page_content}>
                <h1>Rebuilding recipe indexes...</h1>
                <p>You will be redirected to the index page soon.</p>
            </div>

        </div>
    );
}