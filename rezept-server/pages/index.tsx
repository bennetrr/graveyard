import React from "react";
import styles from "../styles/Page.module.scss";

import Head from "next/head";
import Header from "../components/Header";

export default function Index() {
  return (
    <div className={styles.container}>
      <Head>
        <title>RezeptServer</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <Header hideHome />
      <div className={styles.page_content}>
          <h1>Welcome to RezeptServer</h1>
      </div>

    </div>
  );
}
