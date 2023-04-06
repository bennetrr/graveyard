<?php
	session_start();
	require_once("/var/www/php/vertretungsplan.inc.php");
	$id = $_SESSION["userid"];
	$res = $con->query("UPDATE user SET loggedin = '0' WHERE id = $id");
	closeDB($con);
	session_destroy();
	die('<script>window.location.href = "index.php?mode=logout"</script>');
?>