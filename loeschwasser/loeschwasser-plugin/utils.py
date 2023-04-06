import yaml

from qgis.core import Qgis, QgsCoordinateReferenceSystem, QgsCoordinateTransform, QgsMessageLog, QgsPointXY, QgsProject
from qgis.utils import iface


# noinspection PyBroadException
def point2wgs84(point: QgsPointXY):
    """
    Converts the coordinates of a point to WGS84

    :rtype: QgsPointXY
    :param point: A qgis.core.QgsPointXY object representing the point to convert
    :return: A qgis.core.QgsPointXY object representing the point in WGS84
    """
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
        pt: QgsPointXY = transformer.transform(point)
    except:
        pt: QgsPointXY = transformer.transform(QgsPointXY(point))
    return pt


def dict2object(d: dict):
    """
    Converts a dictionary to an object

    :rtype: new
    :param d: Dictionary to convert
    :return: The converted object
    """
    top = type('new', (object,), d)
    seqs = tuple, list, set, frozenset
    for i, j in d.items():
        if isinstance(j, dict):
            setattr(top, i, dict2object(j))
        elif isinstance(j, seqs):
            setattr(top, i,
                    type(j)(dict2object(sj) if isinstance(sj, dict) else sj for sj in j))
        else:
            setattr(top, i, j)
    return top


def load_config(config_file: str):
    """
    Loads the yaml file as object

    :rtype: new
    :param config_file: The path to the yaml file
    :return: The object
    """
    with open(config_file, 'r') as f:
        data_map = yaml.safe_load(f)
    return dict2object(data_map)


def save_config(config: dict, config_file: str):
    """
    Saves the dict as a yaml file

    :rtype: None
    :param config: The dict to save
    :param config_file: The path to the yaml file
    """
    with open(config_file, 'w') as f:
        yaml.dump(config, f)


def get_log_level(level):
    if level == 'info':
        lev = Qgis.Info
    elif level == 'warning':
        lev = Qgis.Warning
    elif level == 'critical':
        lev = Qgis.Critical
    elif level == 'success':
        lev = Qgis.Success
    else:
        lev = Qgis.Info
    return lev


def log_message(*msg, level: str = 'info'):
    """
    Writes a message to the QGIS message log

    :rtype: None
    :param msg: The message / parts of the message to write
    :param level: The level that the message should have.<br>Can be 'info', 'warning', 'critical', 'success' or None
    """
    message = ''
    for text in msg:
        message += '{0!s} '.format(text)
    QgsMessageLog.logMessage(message=message, level=get_log_level(level))


def message_bar(*msg, level: str = 'info'):
    """
    Creates a new qgis message bar

    :rtype: None
    :param msg: The message / parts of the message to write
    :param level: The level that the message should have.<br>Can be 'info', 'warning', 'critical', 'success' or None
    """
    message = ''
    for text in msg:
        message += '{0!s} '.format(text)
    iface.messageBar().pushMessage(text=message, level=get_log_level(level))


def rgb2abgr(rgb: str):
    """
    Converts a rgb color (#rrggbb) to a google kml abgr (aabbggrr) color

    :rtype: str
    :param rgb: The rgb color code (with #)
    :return: The abgr color code (without #)
    """
    abgr = 'ff'
    abgr += rgb[5:7]
    abgr += rgb[3:5]
    abgr += rgb[1:3]
    return abgr


class LayerNotFoundError(BaseException):
    """An exception for a not-found layer"""
    pass


class FileNotFound(BaseException):
    """An exception for a not-found file"""
    pass
