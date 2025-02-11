<?php
  session_start();
  echo "<title>PHP Info Page</title>";
  if(!isset($_SESSION['loggedin'])) {
    header("Location: index.php");
    die();
  }
  phpinfo();
?>
