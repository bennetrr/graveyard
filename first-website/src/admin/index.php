<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>bennetr</title>
    <link rel="stylesheet" href="/files/styles/main.css">
    <script>
      function check_passwd(){
        var passwd = document.getElementById("passwd_feld").value;
        if(passwd == ""){
          document.getElementById("passwd_error").innerText = "Sie müssen ein Passwort eingeben!";
          return false;
        }
      }

      function passwd_false(){
        document.getElementById("passwd_error").innerText = "Das Passwort war falsch!";
      }

      function clear_passwd_error(){
        document.getElementById("passwd_error").innerText = "";
      }
    </script>
  </head>
  <body>
    <h1 class="sitetitle">Admin-Bereich</h1>
    <?php
      // session_start();
      // if(!isset($_SESSION['loggedin'])) {
      //     echo "<div style='width: 35%; margin: 5% auto 15% auto;'>
      //             <form style='width: 100%;' onsubmit='return check_passwd()''  action='login.php' method='post'>
      //               <p class='subtitle-center'>Sie sind nicht angemeldet!</p>
      //               <p class='text-center'>Sie müssen sich anmelden, um auf die Serververwaltung zuzugreifen.</p>
      //               <input id='passwd_feld' style='width: 100%;' type='password' placeholder='Passwort eingeben' name='passwort'>
      //               <p id='passwd_error' style='color: #c7031b; font-size: 14px;'></p>
      //               <input class='submit-button' type='submit' value='Anmelden'>
      //               <input class='reset-button' type='reset' onclick='clear_passwd_error()'>
      //             </form>
      //           </div>";
      //   if($_GET["passwd_false"] == "true"){
      //     echo "<script>document.getElementById('passwd_error').innerText = 'Das Passwort war falsch!';</script>";
      //   }
      // die();
      // }
    ?>
    <div class="pic-slide-segment">
      <div class="pic-slide-container">
        <a href="pma">
          <img src="img/pma.png" alt="phpmyadmin" class="pic-slide-image-100w">
          <div class="pic-slide-overlay">
            <div class="pic-slide-text">phpMyAdmin</div>
          </div>
        </a>
      </div>

      <div class="pic-slide-container">
        <a href="phpinfo.php">
          <img src="img/phpinfo.png" alt="phpinfo()" class="pic-slide-image-100w">
          <div class="pic-slide-overlay">
            <div class="pic-slide-text">PHP Info Page</div>
          </div>
        </a>
      </div>

      <div class="pic-slide-container">
        <a href="/server-status?refresh=1">
          <img src="img/apachehttpd.png" alt="apachehttpd" class="pic-slide-image-100h">
          <div class="pic-slide-overlay">
            <div class="pic-slide-text">Apache Status Page</div>
          </div>
        </a>
      </div>

      <div class="pic-slide-container">
        <a href="passwdhash.php">
          <img src="img/hashgen.png" alt="passworthash" class="pic-slide-image-100w">
          <div class="pic-slide-overlay">
            <div class="pic-slide-text">Passwort-Hash-Generator</div>
            <div class="pic-slide-description">Passwort-Hash-Generator</div>
          </div>
        </a>
      </div>

      <div class="pic-slide-container">
        <a href="logout.php">
          <img src="img/logout.png" alt="logout" class="pic-slide-image-100h">
          <div class="pic-slide-overlay">
            <div class="pic-slide-text">Logout</div>
          </div>
        </a>
      </div>
    </div>
  </body>
</html>
