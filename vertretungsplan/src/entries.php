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
		<link rel="stylesheet" href="files/style.css" type="text/css">
		<script src="files/entries.js"></script>
	</head>
	<body>
		<?php
			require_once('/var/www/vertretungsplan/files/navbar.inc.php');
			require_once("/var/www/php/vertretungsplan.inc.php");
			//
			// Infos Heute
			$res = $con->query("SELECT * FROM info_heute ORDER BY id");
		?>
			<h3>Heute</h3>
			<h4>Informationen</h4>
			<table>
				<tr>
					<th width="40px">ID</th>
					<th>Information</th>
					<th width="145px"></th>
				</tr>
				<tr>
					<form action='newentry.php?mode=info_heute' method='post'>
						<td>Neu</td>
						<td>
							<input type="text" placeholder="Text" name="text">
						</td>
						<td>
							<input type='submit' value='Speichern'>
						</td>
					</form>
				</tr>
			<?php
			if($res->num_rows > 0){
				foreach($res as $row){
					echo "<tr>";
					echo "<td>".$row['id']."</td>";
					echo "<td>".$row['text']."</td>";
					echo "<td><a class='knopf' href='#' title='Löschen' onclick='delinfo_heute(".$row['id'].")'>X</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='knopf' href='#' title='Bearbeiten' onclick='editinfo_heute(".$row['id'].")'>E</a></td>";
					echo "</tr>";
				}
			}else{
				echo "<tr>";
				echo "<td colspan='3' style='text-align: center;'>Noch keine Informationen für heute</td>";
				echo "</tr>";
			}
			echo "</table>";
		//
		// Plan Heute
			$res = $con->query("SELECT * FROM plan_heute ORDER BY klasse");
		?>
			<h4>Vertretung</h4>
			<table>
				<tr>
					<th width="40px">ID</th>
					<th>Klasse</th>
					<th>Stunde</th>
					<th>Lehrer</th>
					<th>Fach</th>
					<th>Text</th>
					<th width="145px"></th>
				</tr>
				<tr>
					<form action='newentry.php?mode=plan_heute' method='post'>
						<td>Neu</td>
						<td>
							<input type="text" placeholder="Klasse" name="klasse">
						</td>
						<td>
							<input type="text" placeholder="Stunde" name="stunde">
						</td>
						<td>
							<input type="text" placeholder="Lehrer" name="lehrer">
						</td>
						<td>
							<input type="text" placeholder="Fach" name="fach">
						</td>
						<td>
							<input type="text" placeholder="Text" name="text">
						</td>
						<td>
							<input type='submit' value='Speichern'>
						</td>
					</form>
				</tr>
			<?php
			if($res->num_rows > 0){
				foreach($res as $row){
					echo "<tr>";
					echo "<td>".$row['id']."</td>";
					echo "<td>".$row['klasse']."</td>";
					echo "<td>".$row['stunde']."</td>";
					echo "<td>".$row['lehrer']."</td>";
					echo "<td>".$row['fach']."</td>";
					echo "<td>".$row['infotext']."</td>";
					echo "<td><a class='knopf' href='#' title='Löschen' onclick='delplan_heute(".$row['id'].")'>X</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='knopf' href='#' title='Bearbeiten' onclick='editplan_heute(".$row['id'].")'>E</a></td>";
					echo "</tr>";
				}
			}else{
				echo "<tr>";
				echo "<td colspan='7' style='text-align: center;'>Noch keine Vertretung für heute</td>";
				echo "</tr>";
			}
			echo "</table>";
			//
			// Infos morgen
			$res = $con->query("SELECT * FROM info_morgen ORDER BY id");
		?>
			<h3>Morgen</h3>
			<h4>Informationen</h4>
			<table>
				<tr>
					<th width="40px">ID</th>
					<th>Information</th>
					<th width="145px"></th>
				</tr>
				<tr>
					<form action='newentry.php?mode=info_morgen' method='post'>
						<td>Neu</td>
						<td>
							<input type="text" placeholder="Text" name="text">
						</td>
						<td>
							<input type='submit' value='Speichern'>
						</td>
					</form>
				</tr>
			<?php
			if($res->num_rows > 0){
				foreach($res as $row){
					echo "<tr>";
					echo "<td>".$row['id']."</td>";
					echo "<td>".$row['text']."</td>";
					echo "<td><a class='knopf' href='#' title='Löschen' onclick='delinfo_morgen(".$row['id'].")'>X</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='knopf' href='#' title='Bearbeiten' onclick='editinfo_morgen(".$row['id'].")'>E</a></td>";
					echo "</tr>";
				}
			} else{
				echo "<tr>";
				echo "<td colspan='3' style='text-align: center;'>Noch keine Informationen für morgen</td>";
				echo "</tr>";
			}
			echo "</table>";
		//
		// Plan morgen
			$res = $con->query("SELECT * FROM plan_morgen ORDER BY klasse");
		?>
			<h4>Vertretung</h4>
			<table>
				<tr>
					<th width="40px">ID</th>
					<th>Klasse</th>
					<th>Stunde</th>
					<th>Lehrer</th>
					<th>Fach</th>
					<th>Text</th>
					<th width="145px"></th>
				</tr>
				<tr>
					<form action='newentry.php?mode=plan_morgen' method='post'>
						<td>Neu</td>
						<td>
							<input type="text" placeholder="Klasse" name="klasse">
						</td>
						<td>
							<input type="text" placeholder="Stunde" name="stunde">
						</td>
						<td>
							<input type="text" placeholder="Lehrer" name="lehrer">
						</td>
						<td>
							<input type="text" placeholder="Fach" name="fach">
						</td>
						<td>
							<input type="text" placeholder="Text" name="text">
						</td>
						<td>
							<input type='submit' value='Speichern'>
						</td>
					</form>
				</tr>
			<?php
			if($res->num_rows > 0){
				foreach($res as $row){
					echo "<tr>";
					echo "<td>".$row['id']."</td>";
					echo "<td>".$row['klasse']."</td>";
					echo "<td>".$row['stunde']."</td>";
					echo "<td>".$row['lehrer']."</td>";
					echo "<td>".$row['fach']."</td>";
					echo "<td>".$row['infotext']."</td>";
					echo "<td><a class='knopf' href='#' title='Löschen' onclick='delplan_heute(".$row['id'].")'>X</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='knopf' href='#' title='Bearbeiten' onclick='editplan_heute(".$row['id'].")'>E</a></td>";
					echo "</tr>";
				}
			}else{
				echo "<tr>";
				echo "<td colspan='7' style='text-align: center;'>Noch keine Vertretung für morgen</td>";
				echo "</tr>";
			}
			echo "</table>";
			closeDB($con);
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
