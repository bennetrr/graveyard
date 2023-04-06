<?php
  header("Content-type: application/json; charset=utf-8");
  $p_message = $_POST['message'];
  $p_sha1 = sha1($p_message);
  $p_md5 = md5($p_message);
  $p_passwdhash = password_hash($p_message, PASSWORD_DEFAULT);

  echo "{
  \"raw\": \"$p_message\",
  \"sha1\": \"$p_sha1\",
  \"md5\": \"$p_md5\",
  \"passwd\": \"$p_passwdhash\"
}";
?>
