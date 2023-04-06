import { StyleProp, TouchableHighlightProps } from "react-native";

export default interface IIconButton {
    onPress: VoidFunction,
    image: ImageData,
    style: StyleProp<any>
}