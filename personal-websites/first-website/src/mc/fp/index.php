<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>Freizeitpark-Projekt | bennetr</title>
        <link rel="stylesheet" href="/files/styles/main.css">
        <style>
          #topnav_mc{
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
                <li><a href="#beschreibung">Was ist das Freizeitpark-Projekt?</a></li>
                <li><a href="#abhängigkeiten">Abhängigkeiten</a></li>
                <li><a href="#install">Installation</a></li>
                <li><a href="#download">Download</a></li>
              </ol>
            </div>
            <div class="grid_content">
              <p class="sitetitle">Freizeitpark-Projekt</p>
              <p class="subtitle-left" id="beschreibung">Was ist Freizeitpark-Projekt?</p>
              <p class="text-left">Das Freizeitpark-Projekt ist ein Minecraft-Projekt, das irgendwann 2020 gestartet wird. Gestartet wird? Genau! Es hat noch nicht begonnen. Es ist ein fast-Vanilla-Projekt. Das heißt, es gibt eine Mod, die von mir selbst programmiert wird, die mit neuen Blöcke (Vertikale Slabs, Slabs aus Glas usw.) und neuen Tieren (neue Vogelarten) Minecraft erweitert. Es gibt keine neuen Maschinen, keine neuen Monster, sondern nur das, was in Minecraft schon vorhanden ist, nur in einer anderen Form.<br>
              Der Name Freizeitpark-Projekt ist eigentlich unberechtigt. Die Idee, einen Freizeitpark zu bauen, hat sich nach mehreren Neustarts erst auf eine gesamte Stadt und dann auf mehrere Städte ausgeweitet.</p>
              <br>
              <p class="subtitle-left" id="abhängigkeiten">Abhängigkeiten</p>
              <p class="text-left">Das Freizeitpark-Projekt besteht aus einer Map für Minecraft Java und einer Mod. <b>Die Map ist nicht mit Minecraft Bedrock kompatibel.</b> Die Mod ist für Minecraft Forge geschrieben.</p>
              <br>
              <p class="subtitle-left" id="install">Installation</p>
              <p class="text-left">Als erstes muss Minecraft Forge installiert werden. Den Download dazu gibt es <a href="https://files.minecraftforge.net/maven/net/minecraftforge/forge/index_1.16.2.html">hier</a>. Dort einfach bei <i>Download Latest</i> <i>Installer</i> auswählen. Die heruntergeladene Datei ausführen und Minecraft mit dem Forge-Profil starten. Minecraft kann man nach in dem Titelbild wieder beenden. Wenn man die unten heruntergeladene Datei entpackt, erscheint eine <code>.jar</code>-Datei, die in den Ordner <code>mods</code> im Minecraft-Ordner (bei Windows <code>%appdata%\.minecraft</code>) geschoben werden muss, und ein Ordner namens <code>Freizeitpark-Projekt</code>, der in den Ordner <code>saves</code> im Minecraft-Ordner geschoben wird. Dann ist die Welt spielbereit.</p>
              <br><br>
              <p class="subtitle-left" id="download">Download neuste Version</p>
              <a href="/dl.php?n=fp&v=latest&os=1.16.3"><b>Minecraft 1.16.3</b></a>
              <br><br>
              <p>Andere Versionen:</p>
              <table style="width: 100%; text-align: left; overflow: auto;">
                <tr>
                  <th style="width: 10%;">Version</th>
                  <th style="width: 10%;">Minecraft-Version</th>
                  <th style="width: 10%;">Größe</th>
                  <th style="width: 20%;">Download</th>
                  <th style="width: 50%;">Changelog</th>
                </tr>
                <tr>
                  <td>1.0.0</td>
                  <td>1.16.3</td>
                  <td>0 B</td>
                  <td><a href="/dl.php?n=fp&v=1.0.0&os=1.16.3">Download</a></td>
                  <td>Erstes Release</td>
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