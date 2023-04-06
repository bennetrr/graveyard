import os
import shutil
import zipfile

from qgis.PyQt.QtCore import pyqtSignal
from qgis.core import QgsProject, QgsTask

from .utils import FileNotFound, LayerNotFoundError, point2wgs84, rgb2abgr


class ExportKMLTask(QgsTask):
    finished_signal = pyqtSignal(bool, str, object)

    def __init__(self, config):
        super().__init__('Export als KML-Datei', QgsTask.CanCancel)

        self.exception = None
        self.config = config

        # Counters for progress display
        self.total_features = 0
        self.finished_features = 0

    def kml_hydranten(self, outfile):
        try:
            layer = QgsProject.instance().mapLayersByName(self.config.layers.hydranten)[0].getFeatures()
        except IndexError:
            self.exception = LayerNotFoundError()
            self.finished_signal.emit(False, self.description(), self.exception)
            outfile.close()
            os.remove('temp.kml')
            return False

        for feature in layer:
            outfile.write('<Placemark>\n')
            outfile.write('<description>{!s}</description>\n'.format(feature['address']))
            outfile.write('<styleUrl>s_hydranten</styleUrl>\n')
            outfile.write('<Point>\n')
            coords = point2wgs84(feature.geometry().asPoint())
            lat = coords[0]
            lon = coords[1]
            outfile.write('<coordinates>{lat},{lon}</coordinates>\n'.format(**{'lon': lon, 'lat': lat}))
            outfile.write('</Point>\n')
            outfile.write('</Placemark>\n')
            self.finished_features += 1
            self.setProgress(self.finished_features / self.total_features * 100)

    def kml_brunnen(self, outfile):
        try:
            layer = QgsProject.instance().mapLayersByName(self.config.layers.brunnen)[0].getFeatures()
        except IndexError:
            self.exception = LayerNotFoundError()
            self.finished_signal.emit(False, self.description(), self.exception)
            outfile.close()
            os.remove('temp.kml')
            return False

        for feature in layer:
            outfile.write('<Placemark>\n')
            outfile.write('<name>{!s}</name>\n'.format(int(feature['Leistung'])))

            outfile.write('<description>\n')
            outfile.write('{!s}<br />\n'.format(feature['address']))
            outfile.write('({!s})<br /><br />\n'.format(feature['Standort']))
            if str(feature['Art']) != 'NULL':
                outfile.write('Typ: {!s}<br />\n'.format(feature['Art']))
            if str(feature['Zugang']) != 'NULL':
                outfile.write('Zugang: {!s}<br />\n'.format(feature['Zugang']))
            if str(feature['Zufahrt']) != 'NULL':
                outfile.write('Zufahrt: {!s}<br />\n'.format(feature['Zufahrt']))
            if str(feature['Schaden']) != 'NULL':
                outfile.write('Beschädigt: {!s}<br />\n'.format(feature['Schaden']))
            if str(feature['Absperrvor']) != 'NULL':
                outfile.write('Absperrvorrichtung: {!s}<br />\n'.format(feature['Absperrvor']))
            if str(feature['Schild']) != 'NULL':
                outfile.write('Schild: {!s}<br />\n'.format(feature['Schild']))
            if str(feature['Eisfrei']) != 'NULL':
                outfile.write('Eisfrei: {!s}<br />\n'.format(feature['Eisfrei']))
            if str(feature['Leistung']) != 'NULL':
                outfile.write('Leistung: {!s}<br />\n'.format(int(feature['Leistung'])))
            if str(feature['Entlueftun']) != 'NULL':
                outfile.write('Entlüftungszeit: {!s}s<br />\n'.format(int(feature['Entlueftun'])))
            if str(feature['Bemerkung']) != 'NULL':
                outfile.write('Bemerkung: {!s}\n'.format(feature['Bemerkung']))
            outfile.write('</description>\n')

            outfile.write('<styleUrl>s_brunnen</styleUrl>\n')
            outfile.write('<Point>\n')
            coords = point2wgs84(feature.geometry().asPoint())
            lat = coords[0]
            lon = coords[1]
            outfile.write('<coordinates>{lat!s},{lon!s}</coordinates>\n'.format(**{'lon': lon, 'lat': lat}))
            outfile.write('</Point>\n')
            outfile.write('</Placemark>\n')
            self.finished_features += 1
            self.setProgress(self.finished_features / self.total_features * 100)

    def kml_leitungen(self, outfile):
        try:
            layer = QgsProject.instance().mapLayersByName(self.config.layers.leitungen)[0].getFeatures()
        except IndexError:
            self.exception = LayerNotFoundError()
            outfile.close()
            os.remove('temp.kml')
            self.finished_signal.emit(False, self.description(), self.exception)
            return False

        for feature in layer:
            outfile.write(u'<Placemark>\n')
            outfile.write(u'<styleUrl>s_leitungen</styleUrl>\n')
            outfile.write(u'<LineString>\n')
            outfile.write(u'<coordinates>\n')
            for line in feature.geometry().asMultiPolyline():
                for point in line:
                    coords = point2wgs84(point)
                    lat = coords[0]
                    lon = coords[1]
                    outfile.write(u'{lat!s},{lon!s}\n'.format(**{'lon': lon, 'lat': lat}))
            outfile.write(u'</coordinates>\n')
            outfile.write(u'</LineString>\n')
            outfile.write(u'</Placemark>\n')
            self.finished_features += 1
            self.setProgress(self.finished_features / self.total_features * 100)

    def run(self):
        try:
            # Count all features
            try:
                self.total_features += QgsProject.instance().mapLayersByName(self.config.layers.leitungen)[
                    0].featureCount()
                self.total_features += QgsProject.instance().mapLayersByName(self.config.layers.brunnen)[
                    0].featureCount()
                self.total_features += QgsProject.instance().mapLayersByName(self.config.layers.hydranten)[
                    0].featureCount()
            except IndexError:
                self.exception = LayerNotFoundError()
                self.finished_signal.emit(False, self.description(), self.exception)
                return False

            # Open temp file
            outfile = open('temp.kml', 'w', encoding='utf-8')

            # Print KML-header
            outfile.write('<?xml version="1.0" encoding="UTF-8"?>\n')
            outfile.write('<kml xmlns="http://earth.google.com/kml/2.2">\n')
            outfile.write('<Document>\n')
            outfile.write('<name>Löschwasser</name>\n')

            # Print stylesheets
            outfile.write('<Style id="s_hydranten">\n')
            outfile.write('<IconStyle>\n')
            outfile.write('<Icon>\n')
            outfile.write('<href>{!s}</href>\n'.format(os.path.basename(self.config.export.kml.icon_hydranten)))
            outfile.write('</Icon>\n')
            outfile.write('</IconStyle>\n')
            outfile.write('</Style>\n')

            outfile.write('<Style id="s_brunnen">\n')
            outfile.write('<IconStyle>\n')
            outfile.write('<Icon>\n')
            outfile.write('<href>{!s}</href>\n'.format(os.path.basename(self.config.export.kml.icon_brunnen)))
            outfile.write('</Icon>\n')
            outfile.write('</IconStyle>\n')
            outfile.write('</Style>\n')

            outfile.write('<Style id="s_leitungen">\n')
            outfile.write('<LineStyle>\n')
            outfile.write('<color>{!s}</color>\n'.format(rgb2abgr(self.config.export.kml.color_leitungen)))
            outfile.write('<width>{!s}</width>\n'.format(self.config.export.kml.width_leitungen))
            outfile.write('</LineStyle>\n')
            outfile.write('</Style>\n')

            # Print geometries
            self.kml_hydranten(outfile)
            self.kml_brunnen(outfile)
            self.kml_leitungen(outfile)

            # Save file
            outfile.write(u'</Document>\n')
            outfile.write(u'</kml>\n')
            outfile.close()

            # Create KMZ
            if not os.path.exists(self.config.export.kml.icon_hydranten) or not os.path.exists(self.config.export.kml.icon_brunnen):
                self.exception = FileNotFound()
                os.remove('temp.kml')
                self.finished_signal.emit(False, self.description(), self.exception)
                return False

            zip_file = zipfile.ZipFile('temp.zip', mode='w', compression=zipfile.ZIP_DEFLATED)
            zip_file.write('temp.kml')
            zip_file.write(self.config.export.kml.icon_hydranten,
                           arcname=os.path.basename(self.config.export.kml.icon_hydranten))
            zip_file.write(self.config.export.kml.icon_brunnen,
                           arcname=os.path.basename(self.config.export.kml.icon_brunnen))
            zip_file.close()
            if os.path.exists(self.config.export.kml.output_file):
                os.remove(self.config.export.kml.output_file)
            shutil.move('temp.zip', self.config.export.kml.output_file)
            try:
                os.remove('temp.kml')
                os.remove('temp.zip')
            except PermissionError:
                pass
            except FileNotFoundError:
                pass
            self.finished_signal.emit(True, self.description(), self.exception)
            return True
        except Exception as ex:
            self.exception = ex
            self.finished_signal.emit(False, self.description(), self.exception)
            return False
