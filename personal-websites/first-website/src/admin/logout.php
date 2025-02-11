</html>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title></title>
  </head>
  <body>
      <?php
        session_start();
        session_destroy();
        die('You successfully logged out!');
      ?>
  </body>
</html>


