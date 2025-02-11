<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Software | bennetr</title>
    <link rel="stylesheet" href="/files/styles/main.css">
    <style>
      #topnav_software {
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
          <li><a href="#linux">Linux</a></li>
          <li><a href="#windows">Windows</a></li>
          <li><a href="#multiplattform">Multi-Plattform</a></li>
        </ol>
      </div>
      <div class="grid_content">
        <p class="sitetitle">Software</p>
        <div class="pic-slide-segment">
          <p class="subtitle-left" id="linux">Linux</p>
          <div class="pic-slide-container">
            <a href="bupdate/">
              <img src="/files/img/bupdate.png" alt="bupdate" class="pic-slide-image">
              <div class="pic-slide-overlay">
                <div class="pic-slide-text">bupdate</div>
                <div class="pic-slide-description">bupdate ist ein Skript für Ubuntu und Debian, welche Updates von apt und snap installiert.</div>
              </div>
            </a>
          </div>
        </div>

        <div class="pic-slide-segment">
          <p class="subtitle-left" id="windows">Windows</p>
          <!--<div class="pic-slide-container">
            <a href="einlink">
              <img src="/files/img/einbild.png" alt="einbild" class="pic-slide-image">
              <div class="pic-slide-overlay">
                <div class="pic-slide-text">Text</div>
                <div class="pic-slide-description">Beschreibung</div>
              </div>
            </a>
          </div>-->
        </div>

        <div class="pic-slide-segment">
          <p class="subtitle-left" id="multiplattform">Multi-Plattform</p>
          <div class="pic-slide-container">
            <a href="bbackup/">
              <img src="/files/img/bbackup.png" alt="bBackup" class="pic-slide-image">
              <div class="pic-slide-overlay">
                <div class="pic-slide-text">bBackup</div>
                <div class="pic-slide-description">bBackup ist ein einfaches Backup-Programm für Windows und Linux, welches Dateien aus gewählten Ordnern auf einen externen Datenträger oder (S)FTP-Sever kopiert.</div>
              </div>
            </a>
          </div>
        </div>

      </div>
    </div>
    <div class="grid_footer">
      <?php include_once("/var/www/html/files/includes/footer.inc.php") ?>
    </div>
  </body>
</html>