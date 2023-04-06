<?php
	session_start();
	if(!isset($_SESSION['userid'])) {
		die('Fehler: Login abgelaufen');
	} else {
		$userid = $_SESSION['userid'];
		$group = $_SESSION['group'];
		if($group != 'admin' && $group != 'write') {
			die('Fehler: Sicherheitsstufe falsch');
		}
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="stylesheet" href="files/style.css" type="text/css">
	</head>
	<body>
		<?php
			require_once("/var/www/php/vertretungsplan.inc.php");
			$id = $_GET['id'];
			$mode_get = $_GET['mode'];
			/*if (!$_GET["m_id"]) {
				$mode_id = "1";
			} else {
				$mode_id = $_GET["m_id"];
			}*/
			//
			$mode_exploded = explode("_", $mode_get);
			var_dump($mode_exploded);
			$mode = $mode_exploded["0"];
			$ziel = $mode_exploded["1"];
			$tag = $mode_exploded["2"];
			//
			switch ($mode) {
				case 'del':
					if($mode_id == "1") {
						echo "<p>Wollen Sie den Eintrag mit der ID $id wirklich löschen?</p>";
						echo "<a class='button' href='entryedit.php?id=$id&m_id=2&mode=del_$ziel" . "_" . "$tag'>LÖSCHEN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class='cancelbutton' href='entries.php' target='_top'>Abbrechen</a>";
					} elseif ($mode_id == "2") {
						switch (variable) {
							case 'value':
								// code...
								break;

							default:
								// code...
								break;
						}
						$sql = "DELETE FROM user WHERE id = '$id'";
						$res = $con->query($sql);
						if ($res == 1){
							die("<p>Der Benutzer wurde erfolgreich gelöscht.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
						} else {

						}
					} else {
						die("<p class='errormessage'>Es ist ein Fehler aufgetreten: ungültige Aktion</p><br><a class='button' href='entries.php' target='_top'>OK</a>");
					}
					break;

				default:
					die("<p class='errormessage'>Es ist ein Fehler aufgetreten: ungültige Aktion</p><br><a class='button' href='entries.php' target='_top'>OK</a>");
					break;
			}
		?>
	</body>
</html>
