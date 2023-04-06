import os
import zipfile
import shutil

###CONFIG###
hydranten_layername = 'Hydranten'
brunnen_layername = 'Löschbrunnen'
leitungen_layername = 'Leitungen'
# Die Datei wird überschrieben, wenn sie schon existiert
# Alle Pfade MÜSSEN absolut sein, weil das Skript die Dateien sonst nicht findet!
output_filename = 'D:\QGIS\Löschwasser\Scripts\löschwasser.kmz'
hydranten_icon = 'D:\QGIS\Löschwasser\Styles\Hydranten.png'
brunnen_icon = 'D:\QGIS\Löschwasser\Styles\Brunnen.png'
############


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


outfile = open('temp.kml', 'w', encoding='utf-8')
# os.chdir(os.path.dirname(__file__))

# Print KML-Header
outfile.write(u'<?xml version="1.0" encoding="UTF-8"?>\n')
outfile.write(u'<kml xmlns="http://earth.google.com/kml/2.2">\n')
outfile.write(u'<Document>\n')
outfile.write(u'<name>Löschwasser</name>\n')

# Print stylesheets
outfile.write(u'<Style id="s_hydranten">\n')
outfile.write(u'<IconStyle>\n')
outfile.write(u'<Icon>\n')
outfile.write(u'<href>' + unicode(hydranten_icon.split('\\')[-1]) + u'</href>\n')
outfile.write(u'</Icon>\n')
outfile.write(u'</IconStyle>\n')
outfile.write(u'</Style>\n')

outfile.write(u'<Style id="s_brunnen">\n')
outfile.write(u'<IconStyle>\n')
outfile.write(u'<Icon>\n')
outfile.write(u'<href>' + unicode(brunnen_icon.split('\\')[-1]) + u'</href>\n')
outfile.write(u'</Icon>\n')
outfile.write(u'</IconStyle>\n')
outfile.write(u'</Style>\n')

outfile.write(u'<Style id="s_leitungen">\n')
outfile.write(u'<LineStyle>\n')
outfile.write(u'<color>ffaa201d</color>\n')
outfile.write(u'<width>10</width>\n')
outfile.write(u'</LineStyle>\n')
outfile.write(u'</Style>\n')

# Hydranten-Daten speichern
for feature in QgsProject.instance().mapLayersByName(hydranten_layername)[0].getFeatures():
    outfile.write(u'<Placemark>\n')
    outfile.write(u'<description>' + unicode(feature['address']) + '</description>\n')
    outfile.write(u'<styleUrl>s_hydranten</styleUrl>\n')
    outfile.write(u'<Point>\n')
    coords = pointToWGS84(feature.geometry().asPoint())
    lat = coords[0]
    lon = coords[1]
    outfile.write(u'<coordinates>{lat},{lon}</coordinates>\n'.format(**{'lon': unicode(lon), 'lat': unicode(lat)}))
    outfile.write(u'</Point>\n')
    outfile.write(u'</Placemark>\n')

# Brunnen-Daten speichern
for feature in QgsProject.instance().mapLayersByName(brunnen_layername)[0].getFeatures():
    outfile.write(u'<Placemark>\n')
    outfile.write(u'<name>' + unicode(str(int(feature['Leistung']))) + '</name>\n')
    
    outfile.write(u'<description>\n')
    outfile.write(unicode(feature['address']) + u'<br />\n')
    outfile.write(u'(' + unicode(feature['Standort']) + u')<br /><br />\n')
    if str(feature['Art']) != 'NULL':
        outfile.write(u'Typ: ' + unicode(feature['Art']) + u'<br />\n')
    if str(feature['Zugang']) != 'NULL':
        outfile.write(u'Zugang: ' + unicode(feature['Zugang']) + u'<br />\n')
    if str(feature['Zufahrt']) != 'NULL':
        outfile.write(u'Zufahrt: ' + unicode(feature['Zufahrt']) + u'<br />\n')
    if str(feature['Schaden']) != 'NULL':
        outfile.write(u'Beschädigt: ' + unicode(feature['Schaden']) + u'<br />\n')
    if str(feature['Absperrvor']) != 'NULL':
        outfile.write(u'Absperrvorrichtung: ' + unicode(feature['Absperrvor']) + u'<br />\n')
    if str(feature['Schild']) != 'NULL':
        outfile.write(u'Schild: ' + unicode(feature['Schild']) + u'<br />\n')
    if str(feature['Eisfrei']) != 'NULL':
        outfile.write(u'Eisfrei: ' + unicode(feature['Eisfrei']) + u'<br />\n')
    if str(feature['Leistung']) != 'NULL':
        outfile.write(u'Leistung: ' + unicode(str(int(feature['Leistung']))) + u'<br />\n')
    if str(feature['Entlueftun']) != 'NULL':
        outfile.write(u'Entlüftungszeit: ' + unicode(str(int(feature['Entlueftun']))) + u's<br />\n')
    if str(feature['Bemerkung']) != 'NULL':
        outfile.write(u'Bemerkung: ' + unicode(feature['Bemerkung']) + u'\n')
    outfile.write(u'</description>\n')
    
    outfile.write(u'<styleUrl>s_brunnen</styleUrl>\n')
    outfile.write(u'<Point>\n')
    coords = pointToWGS84(feature.geometry().asPoint())
    lat = coords[0]
    lon = coords[1]
    outfile.write(u'<coordinates>{lat},{lon}</coordinates>\n'.format(**{'lon': unicode(lon), 'lat': unicode(lat)}))
    outfile.write(u'</Point>\n')
    outfile.write(u'</Placemark>\n')

# Leitungs-Daten speichern
for feature in QgsProject.instance().mapLayersByName(leitungen_layername)[0].getFeatures():
    outfile.write(u'<Placemark>\n')
    outfile.write(u'<styleUrl>s_leitungen</styleUrl>\n')
    outfile.write(u'<LineString>\n')
    outfile.write(u'<coordinates>\n')
    for line in feature.geometry().asMultiPolyline():
        for point in line:
            coords = pointToWGS84(point)
            lat = coords[0]
            lon = coords[1]
            outfile.write(u'{lat},{lon}\n'.format(**{'lon': unicode(lon), 'lat': unicode(lat)}))
    outfile.write(u'</coordinates>\n')
    outfile.write(u'</LineString>\n')
    outfile.write(u'</Placemark>\n')

# Speichern
outfile.write(u'</Document>\n')
outfile.write(u'</kml>\n')
outfile.close()
# KMZ erstellen
zip_file = zipfile.ZipFile('temp.zip', mode='w', compression=zipfile.ZIP_DEFLATED)
zip_file.write('temp.kml')
zip_file.write(hydranten_icon, arcname=hydranten_icon.split('\\')[-1])
zip_file.write(brunnen_icon, arcname=brunnen_icon.split('\\')[-1])
zip_file.close()
if os.path.exists(output_filename):
    os.remove(output_filename)
shutil.move('temp.zip', output_filename)
try:
    os.remove('temp.kml')
    os.remove('temp.zip')
except:
    pass
print('ready')