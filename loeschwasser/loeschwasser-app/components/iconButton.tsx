import React from 'react';
import { Image, Pressable, StyleSheet } from 'react-native';
import IIconButton from "../interfaces/iconButton";

const IconButton: React.FC<IIconButton> = ({style, onPress, image}: IIconButton) => {
    const imageStyle = StyleSheet.create({
        image: {
            height: "70%",
            width: "70%",
            margin: "15%"
        }
    });
    
    return (
        <Pressable style={style} onPress={onPress}>
            <Image source={image} style={imageStyle.image}/>
        </Pressable>
    );
}

export default IconButton;