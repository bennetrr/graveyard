<?php
	session_start();
	if(!isset($_SESSION['userid'])) {
		die('<script>window.location.href = "index.php?mode=session"</script>');
	} else {
		$userid = $_SESSION['userid'];
		$group = $_SESSION['group'];
		if($group != 'admin' && $group != 'write') {
			die('<script>window.location.href = "index.php?mode=admin"</script>');
		}
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Einträge | Vertretungsplan</title>
		<link rel="icon" href="/files/pictures/icon.ico" type="image/ico">
		<link rel="stylesheet" href="files/style.css" type="text/css">
	</head>
	<body>
		<?php
      		$mode = $_GET['mode'];
			// New info
			function newinfo($tag) {
				require_once("/var/www/php/vertretungsplan.inc.php");
				$text = $_POST['text'];
				if ($tag == "heute") {
					$sql = "SELECT * from info_heute";
			    }
				elseif ($tag == "morgen") {
					$sql = "SELECT * from info_morgen";
				}
				$res = $con->query($sql);
				if ($res->num_rows > 0) {
					foreach ($res as $row) {
						if ($text == $row['text'] || $text == ""){
							die("<p class='errormessage'>Diese Information ist schon eingetragen</p><br><a class='button' href='entries.php'>OK</a>");
						}
					}
				}
				if ($tag == "heute") {
					$sql = "INSERT INTO info_heute(text) VALUES ('$text')";
			    }
				elseif ($tag == "morgen") {
					$sql = "INSERT INTO info_morgen(text) VALUES ('$text')";
				}
				$res = $con->query($sql);
				if ($res == 1){
					die("<script>location.href = 'entries.php';</script>");
				} else{
					die("<p class='errormessage'>Es ist ein Fehler aufgetreten: $con->connect_error</p><br><a class='button' href='entries.php'>OK</a>");
				}
			}

			//New Plan
			function newplan($tag){
				require_once("/var/www/php/vertretungsplan.inc.php");
				//POST-Werte einlesen
				$klasse = $_POST['klasse'];
				$stunde = $_POST['stunde'];
				$lehrer = $_POST['lehrer'];
				$fach = $_POST['fach'];
				$text = $_POST['text'];
				//Werte überprüfen
				if ($lehrer == "") {
					die("<p class='errormessage'>Das Feld \"Lehrer\" darf nicht leer sein.</p><br><a class='button' href='entries.php'>OK</a>");
				}

				if ($stunde == "") {
					die("<p class='errormessage'>Das Feld \"Stunde\" darf nicht leer sein.</p><br><a class='button' href='entries.php'>OK</a>");
				}

				if ($klasse == "") {
					die("<p class='errormessage'>Das Feld \"Klasse\" darf nicht leer sein.</p><br><a class='button' href='entries.php'>OK</a>");
				}

				if ($fach == "") {
					die("<p class='errormessage'>Das Feld \"Fach\" darf nicht leer sein.</p><br><a class='button' href='entries.php'>OK</a>");
				}

				if ($text == "") {
					$text = "-";
				}
				//
				if ($tag == "heute") {
					$sql = "SELECT * from plan_heute";
			  	}
				elseif ($tag == "morgen") {
					$sql = "SELECT * from plan_morgen";
				}
				$res = $con->query($sql);
				if ($res->num_rows > 0) {
					foreach ($res as $row) {
						if ($klasse == $row['klasse'] && $stunde == $row['stunde']){
							die("<p class='errormessage'>Für die angegebene Klasse ist in dieser Stunde schon Vertretung eingetragen.<br>Zum ändern können Sie auf das Stift-Symbol neben dem Eintrag klicken.</p><br><a class='button' href='entries.php'>OK</a>");
						}
					}
				}
				//
				if (is_int($klasse[1])) {
					$stufe = $klasse[0] . $klasse[1];
				} else {
					$stufe = 0 . $klasse[0];
				}
				//eintragen
				if ($tag == "heute") {
					$sql = "INSERT INTO plan_heute(klasse, stufe, stunde, lehrer, fach, infotext) VALUES ('$klasse', '$stufe', '$stunde', '$lehrer', '$fach', '$text')";
			  	}
				elseif ($tag == "morgen") {
					$sql = "INSERT INTO plan_morgen(klasse, stufe, stunde, lehrer, fach, infotext) VALUES ('$klasse', '$stufe', '$stunde', '$lehrer', '$fach', '$text')";
				}
				$res = $con->query($sql);
				if ($res == 1){
					die("<script>location.href = 'entries.php';</script>");
				} else{
					die("<p class='errormessage'>Es ist ein Fehler aufgetreten: $con->connect_error</p><br><a class='button' href='entries.php'>OK</a>");
				}
			}
			//
			//
			//
            switch ($mode) {
            case "info_heute":
                newinfo("heute");
                break;
            case "info_morgen":
                newinfo("morgen");
                break;
            case 'plan_heute':
                newplan("heute");
                break;
            case 'plan_morgen':
                newplan("morgen");
                break;
            //
            //Fehler
            default:
                echo("<script>close;</script>");
                die("<p class='errormessage'>Es ist ein Fehler aufgetreten: ungültige Aktion<br>Sie können das Fenster jetzt schließen</p>");
                break;
            }
