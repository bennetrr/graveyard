<?php
	session_start();
	echo "<title>Vertretungsplan</title>";
	require_once("/var/www/php/vertretungsplan.inc.php");
	//
	//Login-Daten aus POST werden ausgelesen
	$username = $_POST["username"];
	$passwort = $_POST["passwort"];
	//
	//Daten aus MySQL-Datenbank auslesen
	$result = $con->query("SELECT * FROM user WHERE username = '$username' AND active = '1'");
	if ($result->num_rows == 0){
		closeDB($con);
		die('<script>window.location.href = "index.php?mode=error"</script>');
	}
	$resultdata = $result->fetch_assoc();
	if (password_verify($passwort, $resultdata["passwd"])){
		$_SESSION["username"] = $username;
		$_SESSION["stufe"] = $resultdata["stufe"];
		$_SESSION["group"] = $resultdata["rechte"];
		$_SESSION["userid"] = $resultdata["id"];
		$id = $resultdata["id"];
		$con->query("UPDATE user SET loggedin = '1' WHERE id = $id");
		closeDB($con);
		die('<script>window.location.href = "start.php"</script>');
	} else{
		closeDB($con);
		die('<script>window.location.href = "index.php?mode=error"</script>');
	}
?>
