import os

from qgis.PyQt.QtGui import QColor, QIcon
from qgis.PyQt.QtWidgets import QAction
from qgis.core import QgsApplication, QgsProject

from .config_dialog import configDialog
from .export_kml import ExportKMLTask
from .geocode import GeocodeTask
from .utils import load_config, log_message, message_bar, save_config, LayerNotFoundError, FileNotFound


# DEBUG
# import pydevd_pycharm
# pydevd_pycharm.settrace('localhost', port=53100, stdoutToServer=True, stderrToServer=True)


class Loeschwasser:
    def __init__(self, iface):
        # Save reference to the QGIS interface
        self.iface = iface

        # Load config
        self.working_dir = os.path.dirname(os.path.abspath(__file__))
        self.config = load_config(os.path.join(self.working_dir, 'config.yaml'))

        # Declare instance attributes
        self.actions = []
        self.menu = 'Löschwasser'
        self.task_running = False

        # Check if plugin was started the first time in current QGIS session
        # Must be set in initGui() to survive plugin reloads
        self.first_start = None

    def add_action(
            self,
            icon_path,
            text,
            callback,
            enabled_flag=True,
            add_to_menu=True,
            add_to_toolbar=True,
            status_tip=None,
            whats_this=None,
            parent=None):
        """Add a toolbar icon to the toolbar.

        :param icon_path: Path to the icon for this action. Can be a resource
            path (e.g. ':/plugins/foo/bar.png') or a normal file system path.
        :type icon_path: str

        :param text: Text that should be shown in menu items for this action.
        :type text: str

        :param callback: Function to be called when the action is triggered.
        :type callback: function

        :param enabled_flag: A flag indicating if the action should be enabled
            by default. Defaults to True.
        :type enabled_flag: bool

        :param add_to_menu: Flag indicating whether the action should also
            be added to the menu. Defaults to True.
        :type add_to_menu: bool

        :param add_to_toolbar: Flag indicating whether the action should also
            be added to the toolbar. Defaults to True.
        :type add_to_toolbar: bool

        :param status_tip: Optional text to show in a popup when mouse pointer
            hovers over the action.
        :type status_tip: str

        :param parent: Parent widget for the new action. Defaults None.
        :type parent: QWidget

        :param whats_this: Optional text to show in the status bar when the
            mouse pointer hovers over the action.

        :returns: The action that was created. Note that the action is also
            added to self.actions list.
        :rtype: QAction
        """

        icon = QIcon(icon_path)
        action = QAction(icon, text, parent)
        action.triggered.connect(callback)
        action.setEnabled(enabled_flag)

        if status_tip is not None:
            action.setStatusTip(status_tip)

        if whats_this is not None:
            # Not working for menu entries
            action.setWhatsThis(whats_this)

        if add_to_toolbar:
            # Adds plugin icon to Plugins toolbar
            self.iface.addToolBarIcon(action)

        if add_to_menu:
            self.iface.addPluginToMenu(self.menu, action)

        self.actions.append(action)

        return action

    # noinspection PyPep8Naming
    def initGui(self):
        """Create the menu entries inside the QGIS GUI."""

        icon_path = ':/plugins/loeschwasser/icon.png'

        # Add menu entries
        self.add_action(
            icon_path=icon_path,
            text='Fehlende Adressen bestimmen',
            callback=self.geocode_missing,
            add_to_toolbar=False,
            status_tip="Die Adresse von Brunnen / Hydranten suchen, bei denen noch keine Adresse eingetragen wurde.",
            parent=self.iface.mainWindow())
        self.add_action(
            icon_path=icon_path,
            text='Alle Adressen bestimmen',
            callback=self.geocode_all,
            add_to_toolbar=False,
            status_tip="Die Adresse von allen Brunnen / Hydranten suchen. Vorhandene Adressen werden überschrieben!",
            parent=self.iface.mainWindow())
        self.add_action(
            icon_path=icon_path,
            text='Export als KML',
            callback=self.export_kml,
            add_to_toolbar=False,
            status_tip="Die Brunnen- / Hydrantendaten als KML exportieren. (Für Google Earth)",
            parent=self.iface.mainWindow())
        self.add_action(
            icon_path=icon_path,
            text='Einstellungen',
            callback=self.edit_config,
            add_to_toolbar=False,
            status_tip="Einstellungen des Plugins ändern",
            parent=self.iface.mainWindow())

        # will be set False in run()
        self.first_start = True

    def unload(self):
        """Removes the plugin menu item and icon from QGIS GUI."""
        for action in self.actions:
            self.iface.removePluginMenu('Löschwasser', action)
            self.iface.removeToolBarIcon(action)

    def geocode_task_finished(self, state: bool, description: str, failed_features: int, exception: object):
        if state:
            # Success
            message_bar('Die Aufgabe "{}" wurde erfolgreich beendet. Es wurden {} Adressen nicht gefunden'.format(
                description, str(failed_features)), level='success')
        else:
            if exception is None:
                # Probably canceled by user
                log_message(
                    'Die Aufgabe "{}" wurde nicht erfolgreich, aber ohne Fehlermeldung beendet.\n\
                    (Wahrscheinlich vom Benutzer abgebrochen)'.format(
                        description), level='warning')
                message_bar(
                    'Die Aufgabe "{}" wurde wahrscheinlich vom Benutzer abgebrochen.'.format(description),
                    level='warning')
            else:
                # Exception
                if isinstance(exception, LayerNotFoundError):
                    message_bar(
                        'Die Aufgabe "{}" wurde mit einem Fehler beendet: Ein Layer wurde nicht gefunden. \
                        Bitte überprüfen Sie die Einstellungen.'.format(description, exception),
                        level='critical')
                elif isinstance(exception, FileNotFound):
                    message_bar(
                        'Die Aufgabe "{}" wurde mit einem Fehler beendet: Eine Datei wurde nicht gefunden. \
                        Bitte überprüfen Sie die Einstellungen.'.format(description, exception),
                        level='critical')
                else:
                    message_bar(
                        'Die Aufgabe "{}" wurde mit einem Fehler beendet: {}'.format(description, exception),
                        level='critical')
                    raise exception
        self.task_running = False

    def task_finished(self, state: bool, description: str, exception: object):
        if state:
            message_bar('Die Aufgabe "{}" wurde erfolgreich beendet.'.format(
                description), level='success')
        else:
            if exception is None:
                log_message(
                    'Die Aufgabe "{}" wurde nicht erfolgreich, aber ohne Fehlermeldung beendet.\n\
                    (Wahrscheinlich vom Benutzer abgebrochen)'.format(
                        description), level='warning')
                message_bar(
                    'Die Aufgabe "{}" wurde wahrscheinlich vom Benutzer abgebrochen.'.format(description),
                    level='warning')
            else:
                # Exception
                if isinstance(exception, LayerNotFoundError):
                    # A LayerNotFoundError is raised when a layer is not found
                    message_bar(
                        'Die Aufgabe "{}" wurde mit einem Fehler beendet: Ein Layer wurde nicht gefunden. \
                        Bitte überprüfen Sie die Einstellungen.'.format(description, exception),
                        level='critical')
                elif isinstance(exception, FileNotFound):
                    message_bar(
                        'Die Aufgabe "{}" wurde mit einem Fehler beendet: Eine Datei wurde nicht gefunden. \
                        Bitte überprüfen Sie die Einstellungen.'.format(description, exception),
                        level='critical')
                else:
                    message_bar(
                        'Die Aufgabe "{}" wurde mit einem Fehler beendet: {}'.format(description, exception),
                        level='critical')
                    raise exception
        self.task_running = False

    def geocode_missing(self):
        self.task_running = True
        task = GeocodeTask(True, self.config)
        task.finished_signal.connect(self.geocode_task_finished)
        QgsApplication.taskManager().addTask(task)
        message_bar('Die Aufgabe "Fehlende Adressen bestimmen" wurde gestartet.', level='info')

    def geocode_all(self):
        self.task_running = True
        task = GeocodeTask(False, self.config)
        task.finished_signal.connect(self.geocode_task_finished)
        QgsApplication.taskManager().addTask(task)
        message_bar('Die Aufgabe "Alle Adressen bestimmen" wurde gestartet.', level='info')

    def export_kml(self):
        self.task_running = True
        task = ExportKMLTask(self.config)
        task.finished_signal.connect(self.task_finished)
        QgsApplication.taskManager().addTask(task)
        message_bar('Die Aufgabe "Export als KML-Datei" wurde gestartet.', level='info')

    def edit_config(self):
        """The run method for the config editor"""

        # Create the dialog with elements (after translation) and keep reference
        # Only create GUI ONCE in callback, so that it will only load when the plugin is started
        if self.task_running:
            message_bar(
                'Die Einstellungen können nicht geändert werden, weil gerade eine Aufgabe bearbeitet wird. \
                Warten Sie, bis diese beendet wurde.', level='warning')
            return

        if self.first_start:
            self.first_start = False
            # noinspection PyAttributeOutsideInit
            self.config_dlg = configDialog()

        # Set default values from config file
        try:
            self.config_dlg.layerBrunnen.setLayer(
                QgsProject.instance().mapLayersByName(self.config.layers.brunnen)[0])
            self.config_dlg.layerHydranten.setLayer(
                QgsProject.instance().mapLayersByName(self.config.layers.hydranten)[0])
            self.config_dlg.layerLeitungen.setLayer(
                QgsProject.instance().mapLayersByName(self.config.layers.leitungen)[0])
        except IndexError:
            message_bar('Ein oder mehrere Layer aus der Einstellungsdatei wurden nicht im Projekt gefunden.',
                        level='warning')
        self.config_dlg.kmlOutput.setFilePath(self.config.export.kml.output_file)
        self.config_dlg.iconBrunnen.setFilePath(self.config.export.kml.icon_brunnen)
        self.config_dlg.iconHydranten.setFilePath(self.config.export.kml.icon_hydranten)
        color_leitungen = QColor()
        color_leitungen.setNamedColor(self.config.export.kml.color_leitungen)
        self.config_dlg.colorLeitungen.setColor(color_leitungen)
        self.config_dlg.widthLeitungen.setValue(self.config.export.kml.width_leitungen)

        # show the dialog
        self.config_dlg.show()
        # Run the dialog event loop
        result = self.config_dlg.exec_()

        # See if OK was pressed
        if result:
            # Create config file structure
            new_config = {
                'layers': {
                    'hydranten': self.config_dlg.layerHydranten.currentLayer().name(),
                    'brunnen': self.config_dlg.layerBrunnen.currentLayer().name(),
                    'leitungen': self.config_dlg.layerLeitungen.currentLayer().name()
                },
                'export': {
                    'kml': {
                        'output_file': self.config_dlg.kmlOutput.filePath(),
                        'icon_brunnen': self.config_dlg.iconBrunnen.filePath(),
                        'icon_hydranten': self.config_dlg.iconHydranten.filePath(),
                        'color_leitungen': self.config_dlg.colorLeitungen.color().name(),
                        'width_leitungen': self.config_dlg.widthLeitungen.value()
                    }
                }
            }

            # Check if the submitted files exists
            if not os.path.isfile(self.config_dlg.iconBrunnen.filePath()):
                message_bar('Die Datei', self.config_dlg.iconBrunnen.filePath(),
                            'wurde nicht gefunden. (Icon für Brunnen).', level='critical')
                new_config['export']['kml']['icon_brunnen'] = self.config.export.kml.icon_brunnen

            if not os.path.isfile(self.config_dlg.iconHydranten.filePath()):
                message_bar('Die Datei', self.config_dlg.iconHydranten.filePath(),
                            'wurde nicht gefunden. (Icon für Hydranten).', level='critical')
                new_config['export']['kml']['icon_hydranten'] = self.config.export.kml.icon_hydranten

            if not os.path.isdir(os.path.dirname(self.config_dlg.kmlOutput.filePath())):
                message_bar('Der Pfad zur Datei', self.config_dlg.iconHydranten.filePath(),
                            'ist ungültig. (KML-Ausgabedatei).', level='critical')
                new_config['export']['kml']['output_file'] = self.config.export.kml.output_file

            # Save config to file and reload
            save_config(new_config, os.path.join(self.working_dir, 'config.yaml'))
            self.config = load_config(os.path.join(self.working_dir, 'config.yaml'))
