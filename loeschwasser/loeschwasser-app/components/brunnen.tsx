import { Marker } from "react-native-maps";
import React from 'react';
import IBrunnen from "../interfaces/brunnen";

const Brunnen: React.FC<IBrunnen> = ({lat, lon, data}: IBrunnen) => {
    return (
        <Marker coordinate={{latitude: lat, longitude: lon}} title={`LSB ${data.leistung}`} image={require("../assets/brunnen.png")}/>
    );
}

export default Brunnen;