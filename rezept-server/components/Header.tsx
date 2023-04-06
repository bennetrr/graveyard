import React from "react";
import styles from "../styles/Header.module.scss";

import {faCirclePlus, faBook, faHome, faArrowsRotate} from "@fortawesome/free-solid-svg-icons";
import MenuEntry from "./MenuEntry";
import {FontAwesomeIcon} from "@fortawesome/react-fontawesome";
import HeaderProps from "../types/HeaderProps";

function MenuProductEntry() {
    return (
        <div className={styles.menuItemNonInteractive}>
            <FontAwesomeIcon icon={faBook} />
            <span className={styles.menuProductEntryText}><b>RezeptServer</b></span>
        </div>
    )
}

export default function Header({hideHome}: HeaderProps) {
    return (
        <div className={styles.header}>
            <MenuProductEntry />
            <div className={styles.leftRightSep} />
            {hideHome ? <></> : <MenuEntry icon={faHome} link="/" />}
            <MenuEntry link={"/build-index"} icon={faArrowsRotate} tooltip={"Rebuilt the recipe index"}/>
            <MenuEntry link={"/new"} icon={faCirclePlus} />
        </div>
    );
}