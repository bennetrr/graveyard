<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>bupdate | bennetr</title>
        <link rel="stylesheet" href="/files/styles/main.css">
        <style>
          #topnav_software{
            color: var(--weiß);
          }
        </style>
    </head>
    <body>
        <div class="grid_topnav" id="top">
            <?php include_once("/var/www/html/files/includes/topnav.inc.php") ?>
        </div>
        <div class="grid_main">
            <div class="grid_sidenav">
              <br>
              <span><b>Inhaltsverzeichnis</b></span>
              <ol>
                <li><a href="#top">Seitenanfang</a></li>
                <li><a href="#beschreibung">Was ist bupdate?</a></li>
                <li><a href="#install">Installation</a></li>
                <li><a href="#download">Download</a></li>
              </ol>
            </div>
            <div class="grid_content">
              <p class="sitetitle">bupdate</p>
              <p class="subtitle-left" id="beschreibung">Was ist bupdate?</p>
              <p class="text-left">bupdate ist ein Skript für Ubuntu und Debian, welche Updates von <code>apt</code> und <code>snap</code> installiert. Da das Programm im Terminal läuft, kann es auch auf Servern benutzt und automatisch beim Systemstart oder Zeitgesteuert ausgeführt werden.</p>
              <br>
              <p class="subtitle-left" id="install">Installation</p>
              <p class="text-left">Nach dem Download kann bupdate mit einem Doppelklick auf die Datei <code>bupdate_x.x.x.deb</code> installiert werden. Alternativ kann das Programm auch über das Terminal mit <code>sudo apt install ./bupdate_x.x.x.deb</code> installiert werden. </p>
              <br><br>
              <p class="subtitle-left" id="download">Download neuste Version:</p>
              <a href="/dl.php?n=bupdate&v=latest&os=deb"><b>Ubuntu / Debian</b></a><br>
              <a href="/dl.php?n=bupdate&v=latest&os=source"><b>Source Code</b></a>
              <br><br>
              <p>Andere Versionen:</p>
              <table style="width: 100%; text-align: left; overflow: auto;">
                <tr>
                  <th style="width: 10%;">Version</th>
                  <th style="width: 10%;">Betriebssystem</th>
                  <th style="width: 10%;">Größe</th>
                  <th style="width: 20%;">Download</th>
                  <th style="width: 50%;">Changelog</th>
                </tr>
                <tr>
                  <td>1.2.0</td>
                  <td>Ubuntu / Debian</td>
                  <td>2,7 KB</td>
                  <td><a href="/dl.php?n=bupdate&v=1.2.0&os=deb">Download</a></td>
                  <td>Verbesserung der UI, Bugfixes</td>
                </tr>
                <tr>
                  <td>1.2.0</td>
                  <td>Source Code</td>
                  <td>3 KB</td>
                  <td><a href="/dl.php?n=bupdate&v=1.2.0&os=source">Download</a></td>
                  <td>Verbesserung der UI, Bugfixes</td>
                </tr>
                <tr>
                  <td>1.3.0</td>
                  <td>Ubuntu / Debian</td>
                  <td>2,8 kB</td>
                  <td><a href="/dl.php?n=bupdate&v=1.3.0&os=deb">Download</a></td>
                  <td>Updates für Flatpak, Benutzerdefinierte Befehle</td>
                </tr>
                <tr>
                  <td>1.3.0</td>
                  <td>Source Code</td>
                  <td>3,3 kB</td>
                  <td><a href="/dl.php?n=bupdate&v=1.3.0&os=source">Download</a></td>
                  <td>Updates für Flatpak, Benutzerdefinierte Befehle</td>
                </tr>
              </table>
            </div>
            <div class="grid_feed">
            </div>
        </div>
        <div class="grid_footer">
            <?php include_once("/var/www/html/files/includes/footer.inc.php") ?>
        </div>
    </body>
</html>