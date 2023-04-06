import {IconDefinition} from "@fortawesome/free-regular-svg-icons";

export default interface MenuEntryProps{
    text?: string
    icon?: IconDefinition
    link: string
    active?: boolean
    tooltip?: string
}