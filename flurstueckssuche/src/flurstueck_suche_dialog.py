import os

from qgis.PyQt import uic, QtWidgets

FORM_CLASS, _ = uic.loadUiType(os.path.join(
    os.path.dirname(__file__), 'flurstueck_suche_dialog_base.ui'))


class FlurstueckSucheDialog(QtWidgets.QDialog, FORM_CLASS):
    def __init__(self, parent=None):
        super(FlurstueckSucheDialog, self).__init__(parent)
        self.setupUi(self)
