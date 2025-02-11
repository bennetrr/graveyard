<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>405 | bennetr</title>
    <link rel="stylesheet" href="/files/styles/main.css">
    <style>
      #topnav_home{
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
      </div>
      <div class="grid_content">
        <p class="sitetitle">405 - Method Not Allowed</p>
        <p class="text-center">
          Die verwendete HTTP-Methode ist nicht gültig.<br>
          Wenn Sie wissen, was der Fehler bedeutet, benutzen Sie eine andere Methode. Wenn nicht, versuchen Sie es später noch einmal.
        </p>
      </div>
      <div class="grid_feed">
      </div>
    </div>
    <div class="grid_footer">
      <?php include_once("/var/www/html/files/includes/footer.inc.php");?>
    </div>
  </body>
</html>