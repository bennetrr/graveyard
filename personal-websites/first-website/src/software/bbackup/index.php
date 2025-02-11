<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>bBackup | bennetr</title>
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
                <li><a href="#beschreibung">Was ist bBackup?</a></li>
                <li><a href="#installwin">Installation unter Windows</a></li>
                <li><a href="#installlinux">Installation unter Linux</a></li>
                <li><a href="#download">Download</a></li>
              </ol>
            </div>
            <div class="grid_content">
              <p class="sitetitle">bBackup</p>
              <p class="subtitle-left" id="beschreibung">Was ist bBackup?</p>
              <p class="text-left">bBackup ist ein einfaches Backup-Programm für Windows und Linux, welches Dateien aus gewählten Ordnern auf einen externen Datenträger oder (S)FTP-Sever kopiert. Dabei kann man auswählen, ob alle Dateien oder nur neue und geänderte Dateien kopiert werden sollen. Unter Ubuntu / Debian erstellt das Programm auch automatisch Sicherungen von den Paketlisten und -quellen. Das Programm arbeitet mit einer grafischen Benutzeroberfläche.</p>
              <br>
              <p class="subtitle-left" id="installwin">Installation unter Windows</p>
              <p class="text-left">Nach dem Download des Installers kann bBackup mit einem Doppelklick auf die Datei <code>bbackup-installer_x.x.x.exe</code> installiert werden. Wenn Sie die Portable-Version benutzen, müssen Sie die <code>bbackup_x.x.x.zip</code>-Datei entpacken und die Datei <code>bbackup.exe</code> öffnen, um bBackup zu starten.</p>
              <br>
              <p class="subtitle-left" id="installlinux">Installation unter Linux</p>
              <p class="text-left">Nach dem Download kann bBackup unter Ubuntu mit einem Doppelklick auf die Datei <code>bbackup_x.x.x.deb</code> oder über ein Terminal mit <code>sudo apt install ./bbackup_x.x.x.deb</code> installiert werden. Wenn Sie die Portable-Version benutzen, müssen Sie die Datei <code>bbackup_x.x.x.tar.gz</code> entpacken und dann die Datei <code>bbackup</code> öffnen.</p>
              <br><br>
              <p class="subtitle-left" id="download">Download neuste Version</p>
              <a href="/dl.php?n=bbackup&v=latest&os=deb"><b>Ubuntu / Debian</b></a><br>
              <a href="/dl.php?n=bbackup&v=latest&os=linux"><b>anderes Linux</b></a><br><br>
              <a href="/dl.php?n=bbackup&v=latest&os=win_exe"><b>Windows (Installer)</b></a><br>
              <a href="/dl.php?n=bbackup&v=latest&os=win_zip"><b>Windows (Portable)</b></a><br><br>
              <a href="/dl.php?n=bbackup&v=latest&os=source"><b>Source Code</b></a><br><br>
              <p>Andere Versionen:</p>
              <table style="width: 100%; text-align: left; overflow: auto;">
                <tr>
                  <th style="width: 10%;">Version</th>
                  <th style="width: 10%;">Betriebssystem</th>
                  <th style="width: 10%;">Größe</th>
                  <th style="width: 20%;">Datei</th>
                  <th style="width: 50%;">Changelog</th>
                </tr>
                <tr>
                  <td colspan="5" style="color: #FF0000;"><b>PROGAMM IN ARBEIT -- NOCH KEIN RELEASE</b></td>
                  <!--<td>1.0.0</td>
                  <td>Ubuntu / Debian</td>
                  <td>13 KB</td>
                  <td><a href="/dl.php?n=bbackup&v=1.0.0&os=deb">bBackup_1.0.0.deb</a></td>
                  <td>Erstes Release</td>-->
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