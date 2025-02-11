<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Tutorials | bennetr</title>
    <link rel="stylesheet" href="/files/styles/main.css">
    <style>
      #topnav_tutorials {
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
          <li><a href="#minecraft">Minecraft</a></li>
          <li><a href="#coding">Programmieren</a></li>
        </ol>
      </div>
      <div class="grid_content">
      <p class="sitetitle">Tutorials</p>
        <div class="pic-slide-segment">
          <p class="subtitle-left" id="linux">Linux</p>
          <div class="pic-slide-container">
            <a href="whiptail/">
              <img src="/files/img/whiptail.png" alt="whiptail" class="pic-slide-image">
              <div class="pic-slide-overlay">
                <div class="pic-slide-text">whiptail</div>
                <div class="pic-slide-description">Dialogboxen im Terminal</div>
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
          <p class="subtitle-left" id="minecraft">Minecraft</p>
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
          <p class="subtitle-left" id="coding">Programmieren</p>
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

      </div>
    </div>
    <div class="grid_footer">
      <?php include_once("/var/www/html/files/includes/footer.inc.php") ?>
    </div>
  </body>
</html>