import json
import urllib.request

from qgis.PyQt.QtCore import NULL, pyqtSignal
from qgis.core import QgsFeature, QgsProject, QgsTask, QgsVectorLayer

from .utils import LayerNotFoundError, point2wgs84


class GeocodeTask(QgsTask):
    finished_signal = pyqtSignal(bool, str, int, object)

    def __init__(self, only_missing: bool, config):
        if only_missing:
            super().__init__('Fehlende Adressen bestimmen', QgsTask.CanCancel)
        else:
            super().__init__('Alle Adressen bestimmen', QgsTask.CanCancel)

        self.exception = None
        self.only_missing = only_missing
        self.config = config

        # Counters for progress display
        self.total_features = 0
        self.finished_features = 0
        self.failed_features = 0

    def geocode_feature(self, layer: QgsVectorLayer, feature: QgsFeature):
        if self.only_missing:
            # If the address is already set, continue with the next one
            if feature['address'] != NULL:
                return True

        # Get the coordinates of the point
        coord = feature.geometry().asPoint()
        coord_converted = point2wgs84(coord)
        lat = coord_converted[1]
        lon = coord_converted[0]

        # Send the coordinates to the osm api
        url = 'https://nominatim.openstreetmap.org/reverse?format=json&lat={lat}&lon={lon}'.format(lon=lon, lat=lat)
        con = urllib.request.urlopen(url)
        res = con.read().decode('utf-8')
        con.close()
        results = json.loads(res)

        try:
            # If road, house number, postcode and town is set
            result = results['address']['road'] + ' ' + str(results['address']['house_number']) + ', ' + \
                     results['address']['postcode'] + ' ' + results['address']['town']
        except KeyError:
            try:
                # If road, postcode and town is set, but the house number not
                result = results['address']['road'] + ', ' + results['address']['postcode'] + ' ' + results['address'][
                    'town']
            except KeyError:
                # If no address is found
                self.failed_features += 1
                result = NULL

        # Save the address to the feature
        feature['address'] = result
        layer.updateFeature(feature)

        self.finished_features += 1

    def geocode_layer(self, layer: QgsVectorLayer):
        # DEBUG
        # features_to_do = 20

        layer.startEditing()
        for feature in layer.getFeatures():
            # Look if the task was cancelled
            if self.isCanceled():
                break

            self.geocode_feature(layer, feature)

            # Display progress
            self.setProgress(self.finished_features / self.total_features * 100)

            # DEBUG
            # if features_to_do <= 0:
            #     break
        layer.commitChanges()

    def run(self):
        try:
            try:
                layer_hydranten: QgsVectorLayer = QgsProject.instance().mapLayersByName(self.config.layers.hydranten)[0]
                layer_brunnen: QgsVectorLayer = QgsProject.instance().mapLayersByName(self.config.layers.brunnen)[0]
            except IndexError:
                self.exception = LayerNotFoundError()
                self.finished_signal.emit(False, self.description(), self.failed_features, self.exception)
                return False

            # DEBUG
            # self.total_features = 40

            self.total_features += layer_brunnen.featureCount()
            self.total_features += layer_hydranten.featureCount()

            self.geocode_layer(layer_brunnen)
            # Look if the task was cancelled
            if self.isCanceled():
                self.finished_signal.emit(False, self.description(), self.failed_features, self.exception)
                return False

            self.geocode_layer(layer_hydranten)
            # Look if the task was cancelled
            if self.isCanceled():
                self.finished_signal.emit(False, self.description(), self.failed_features, self.exception)
                return False

            self.finished_signal.emit(True, self.description(), self.failed_features, self.exception)
            return True

        except Exception as ex:
            self.exception = ex
            self.finished_signal.emit(False, self.description(), self.failed_features, self.exception)
            return False
