<?php
  session_start();
  $passwd = $_POST["passwort"];
  $passwd_hash = '$2y$10$axNM0heUtZdVs7w3y3wCbe0N/3FOWXyXNUVI310LOg4GOqGZe3x/e';
  if(password_verify($passwd, $passwd_hash)){
    $_SESSION["loggedin"] = true;
    header("Location: index.php");
    die();
  } else {
    header("Location: index.php?passwd_false=true");
    die();
  }
?>