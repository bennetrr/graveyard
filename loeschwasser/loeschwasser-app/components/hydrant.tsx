import { Marker } from "react-native-maps";
import React from 'react';
import IHydranten from "../interfaces/hydranten";

const Hydrant: React.FC<IHydranten> = ({lat, lon, data}: IHydranten) => {
    return (
        <Marker coordinate={{latitude: lat, longitude: lon}} title={`Hydrant`} image={require("../assets/hydrant.png")}/>
    );
}

export default Hydrant;