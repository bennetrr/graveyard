# From: GeoCoding (https://github.com/elpaso/qgis-geocoding)

import urllib.request
import json

###CONFIG###
url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat={lat}&lon={lon}'
layername = 'Löschbrunnen'
debugmode = True
############

def debugOut(msg):
    if debugmode:
        print(msg)

def pointToWGS84(point):
    try:
        crs = iface.mapCanvas().mapRenderer().destinationCrs()
    except:
        crs = iface.mapCanvas().mapSettings().destinationCrs()
    
    t = QgsCoordinateReferenceSystem()
    t.createFromSrid(4326)
    f = crs
    try:
        transformer = QgsCoordinateTransform(f, t)
    except:
        transformer = QgsCoordinateTransform(f, t, QgsProject.instance())
    try:
        pt = transformer.transform(point)
    except:
        pt = transformer.transform(QgsPointXY(point)) 
    return pt

layer = QgsProject.instance().mapLayersByName(layername)[0]
layer.startEditing()

for feature in layer.getFeatures():
    coord = feature.geometry().asPoint()
    debugOut(coord)
    coord_converted = pointToWGS84(coord)
    lat = coord_converted[1]
    lon = coord_converted[0]
    debugOut(str(lat) + ' ' + str(lon))
    
    new_url = url.format(**{'lon': lon, 'lat': lat})
    debugOut(new_url)
    con = urllib.request.urlopen(new_url)
    res = con.read().decode('utf-8')
    con.close()
    
    results = json.loads(res)
    try:
        result = results['address']['road'] + ' ' + str(results['address']['house_number']) + ', ' + results['address']['postcode'] + ' ' + results['address']['town']
    except KeyError:
        try:
            result = results['address']['road'] + ', ' + results['address']['postcode'] + ' ' + results['address']['town']
        except KeyError:
            result = results['display_name']
    debugOut(result)
    feature['address'] = result
    layer.updateFeature(feature)
    break
print('ready')
layer.commitChanges()