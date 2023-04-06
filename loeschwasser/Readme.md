# Löschwasser

This is a system for managing hydrants and fire wells that I started to develop for our local volunteer fire department.
The project was sadly discontinued because of bad organization in the fire department.

The system consists of two parts:

First, there is a QGIS plugin that currently can only determine the addresses of the hydrants and export the data to a `.kmz` file.
The `.kmz` file can then be read and displayed in Google Earth.
The plugin should also be able to export to its own data format, which is then used by our app, but the project was discontinued, before we could finish that.

Then there is the app, which is built with JavaScript / React Native and uses the React Native Maps library.
The app reads the file that is exported from the QGIS plugin and puts the points on a map.
There was also support planned for offline maps, navigation, more data types like water tanks, maintaining the database right from the app and a few more things.

In the `scripts` directory there are python scripts that need to be run directly in the Python Console in QGIS.
I wrote these scripts before the plugin to get familiar with the QGIS API.

There is also a `styles` folder containing the image files and QGIS style files.
