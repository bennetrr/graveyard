import React, {useState} from 'react';
import { View, StyleSheet, Platform } from 'react-native';
import MapView, { LocalTile, UrlTile } from  'react-native-maps';
import {useNetInfo} from "@react-native-community/netinfo";

import IBrunnen from './interfaces/brunnen';
import Brunnen from './components/brunnen';
import IHydrant from './interfaces/hydranten';
import Hydrant from './components/hydrant';
import IconButton from './components/iconButton';

export default function App() {
  const netInfo = useNetInfo();
  const [isOsmActive, setIsOsmActive] = useState(true);

  var mapLayers;

  if(netInfo.isConnected) {
    if(isOsmActive) mapLayers = <UrlTile urlTemplate="https://a.tile.openstreetmap.de/{z}/{x}/{y}.png" maximumZ={19} flipY={false}/>;
    else mapLayers = <UrlTile urlTemplate="https://services.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}" maximumZ={19} flipY={false}/>;
  }
  else mapLayers = <LocalTile pathTemplate="./tiles/{z}/{x}/{y}.png"/>; // Zoom 10 - 18

  return (
    <View style={styles.container}>
      <MapView style={styles.map} mapType={Platform.OS == "android" ? "none" : "standard"} zoomControlEnabled={true} initialRegion={defaultLocation}>
        {mapLayers}

        {brunnen.map((e, k) => {return (<Brunnen key={k} lat={e.lat} lon={e.lon} data={e.data}/>);})}
        {hydranten.map((e, k) => {return (<Hydrant key={k} lat={e.lat} lon={e.lon} data={e.data}/>);})}
      </MapView>
      <IconButton onPress={() => {setIsOsmActive(!isOsmActive)}} image={require('./assets/layerIcon.png')} style={[styles.onMapButton, styles.changeMapButton]}/>
    </View>
  );
}

const defaultLocation = {
  latitude: 51.364145,
  longitude: 6.419320,
  latitudeDelta: 0.25,
  longitudeDelta: 0.15
};

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  map: {
    width: "100%",
    height: "100%"
  },
  onMapButton: {
    height: 38.5,
    width: 38.5,
    position: "absolute",
    backgroundColor: "#ffffffbb",
    borderRadius: 2,
    borderColor: "#bcbcbcbb",
    borderWidth: 0.5,
  },
  changeMapButton: {
    left: 12,
    top: 27,
  }
});

/*
const brunnen: IBrunnen[] = [
  {
    lat: ,
    lon: ,
    data: {
      adresse: ,
      standort: ,
      art: ,
      zugang: ,
      zufahrt: ,
      beschaedigt: ,
      absperrbar: ,
      schild: ,
      eisfrei: ,
      leistung: ,
      entlueftungszeit: ,
      bemerkung: 
    }
  }
];

const hydranten: IHydrant[] = [
  {
    lat: ,
    lon: ,
    data: {
      adresse: ,
    }
  }
];
*/
