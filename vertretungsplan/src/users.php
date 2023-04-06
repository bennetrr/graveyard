<?php
	session_start();
	if(!isset($_SESSION['userid'])) {
		die('<script>window.location.href = "index.php?mode=session"</script>');
	} else {
		$userid = $_SESSION['userid'];
		$group = $_SESSION['group'];
		if($group != 'admin') {
			die('<script>window.location.href = "index.php?mode=admin"</script>');
		}
	}
?>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Benutzerverwaltung | Vertretungsplan</title>
		<link rel="stylesheet" href="files/style.css" type="text/css">
		<script src="files/users.js"></script>
	</head>
	<body>
		<?php
			include_once '/var/www/vertretungsplan/files/navbar.inc.php';
			echo '<br>';
			require_once("/var/www/php/vertretungsplan.inc.php");
			$res = $con->query("SELECT * FROM user WHERE NOT `username`='root' ORDER BY id");
		?>
			<table>
				<tr>
					<th width="40px">ID</th>
					<th>Benutzername</th>
					<th width="25px">Aktiv</th>
					<th width="25px">Systembenutzer</th>
					<th>Stufe</th>
					<th>Sicherheitsstufe</th>
					<th width="90px">Angemeldet</th>
					<th width="60px"></th>
				</tr>
				<tr>
					<td>Neu</td>
					<td colspan="7"><a style="width: 100%" class='button' href='#' title='Neuen Benutzer anlegen' onclick='newuserpopup()'>Neuen Benutzer anlegen</a></td>
				</tr>
			<?php
			if($res->num_rows > 0){
				foreach($res as $row){
					echo "<tr>";
					//
					echo "<td>".$row['id']."</td>";
					//
					echo "<td>".$row['username']."</td>";
					//
					switch ($row['active']) {
						case "0":
							echo "<td>Nein</td>";
							break;
						case "1":
							echo "<td>Ja</td>";
							break;
						default:
							echo "<td>ERROR</td>";
					}
					//
					switch ($row['sysuser']) {
						case "0":
							echo "<td>Nein</td>";
							break;
						case "1":
							echo "<td>Ja</td>";
							break;
						default:
							echo "<td>ERROR</td>";
					}
					//
					switch ($row['stufe']) {
						case "0":
							echo "<td>Alle</td>";
							break;
						default:
							echo "<td>".$row['stufe']."</td>";
					}
					//
					switch ($row['rechte']) {
						case "admin":
							echo "<td>Administrator</td>";
							break;
						case "view":
							echo "<td>Lesen</td>";
							break;
						case "write":
							echo "<td>Lesen + Schreiben</td>";
							break;
						default:
							echo "<td>ERROR</td>";
					}
					//
					switch ($row['loggedin']) {
						case "0":
							echo "<td>Nein</td>";
							break;
						case "1":
							echo "<td>Ja</td>";
							break;
						default:
							echo "<td>ERROR</td>";
					}
					//
					echo "<td><a class='knopf' href='#' title='Löschen' onclick='delpopup(".$row['id'].")'>X</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='knopf' href='#' title='Bearbeiten' onclick='editpopup(".$row['id'].")'>E</a></td>";
					//
					echo "</tr>";
				}
				echo "</table>";
			} else{
				echo "Keine Benutzer gefunden<br>" . $con->error;
			}
			closeDB($con)
		?>
		<div id="editpopup" class="modal">
			<form id="editpopup_content" class="modal-content animate">
				<div class="container">
					<iframe src="" id="editpopupiframe">
				</div>
			</form>
		</div>
	</body>
</html>
