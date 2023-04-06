# noinspection PyPep8Naming
def classFactory(iface):  # pylint: disable=invalid-name
    """Load FlurstueckSuche class from file FlurstueckSuche.

    :param iface: A QGIS interface instance.
    :type iface: QgsInterface
    """
    #
    from .flurstueck_suche import FlurstueckSuche
    return FlurstueckSuche(iface)
