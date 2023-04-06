<!DOCTYPE html>
<html lang="de">
	<head>
		<meta charset="utf-8"/>
		<title>Vertretungsplan</title>
		<link rel="stylesheet" href="files/login.css">
	</head>
	<body>
		<h1>Vertretungsplan</h1>
		<h3>Um den Vertretungsplan benutzen zu können, müssen Sie sich anmelden.</h3>
		<p>Die Login-Daten sollten Sie von der Schule bekommen haben.<br>Wenn Sie Änderungen am Vertretungsplan vornehmen wollen, klicken Sie auf "Login für Mitarbeiter"</p>
		<center>
			<button onclick="document.getElementById('login_modal1').style.display='block'" style="width:auto;">Login</button><br>
			<button onclick="document.getElementById('login_modal2').style.display='block'" style="width:auto;">Login für Mitarbeiter</button>
		</center>
		</center>


		<div id="login_modal1" class="modal">
			<form class="modal-content animate" action="login.php" method="post">
				<div class="imgcontainer">
					<img src="files/groupavatar" alt="Avatar" class="avatar">
				</div>
				<div class="container">
					<label for="username"><b>Jahrgangsstufe</b></label>
					<input type="text" placeholder="Jahrgangsstufe eingeben" name="username" required>
					<label for="passwort"><b>Passwort</b></label>
					<input type="password" placeholder="Passwort eingeben" name="passwort" required>
					<button type="submit">Login</button>
				</div>
				<div class="container" style="background-color:#f1f1f1">
					<button type="button" onclick="document.getElementById('login_modal1').style.display='none'" class="cancelbtn">Abbrechen</button>
				</div>
			</form>
		</div>


		<div id="login_modal2" class="modal">
			<form class="modal-content animate" action="login.php" method="post">
				<div class="imgcontainer">
					<img src="files/useravatar" alt="Avatar" class="avatar">
				</div>
				<div class="container">
					<label for="username"><b>Benutzername</b></label>
					<input type="text" placeholder="Benutzername eingeben" name="username" required>
					<label for="passwort"><b>Passwort</b></label>
					<input type="password" placeholder="Passwort eingeben" name="passwort" required>
					<button type="submit">Login</button>
				</div>
				<div class="container" style="background-color:#f1f1f1">
					<button type="button" onclick="document.getElementById('login_modal2').style.display='none'" class="cancelbtn">Abbrechen</button>
				</div>
			</form>
		</div>


		<div id="modal_error" class="modal">
			<form class="modal-content animate">
				<br><p style="color: red; text-align: center">Benutzername / Passwort falsch</p><br>
				<div class="container" style="background-color:#f1f1f1">
					<button type="button" onclick="document.getElementById('modal_error').style.display='none'" class="cancelbtn">OK</button>
				</div>
			</form>
		</div>


		<div id="modal_logout" class="modal">
			<form class="modal-content animate">
				<br><p style="color: green; text-align: center">Logout erfolgreich</p><br>
				<div class="container" style="background-color:#f1f1f1">
					<button type="button" onclick="document.getElementById('modal_logout').style.display='none'" class="cancelbtn">OK</button>
				</div>
			</form>
		</div>


		<div id="modal_session" class="modal">
			<form class="modal-content animate">
				<br><p style="color: red; text-align: center">Ihr Login ist abgelaufen. Bitte erneut anmelden.</p><br>
				<div class="container" style="background-color:#f1f1f1">
					<button type="button" onclick="document.getElementById('modal_session').style.display='none'" class="cancelbtn">OK</button>
				</div>
			</form>
		</div>


		<div id="modal_admin" class="modal">
			<form class="modal-content animate">
				<br><p style="color: red; text-align: center">Sie müssen sich mit einem Administratoraccount anmelden, um diese Funktion nutzen zu können.</p><br>
				<div class="container" style="background-color:#f1f1f1">
					<button type="button" onclick="document.getElementById('modal_admin').style.display='none'" class="cancelbtn">OK</button>
				</div>
			</form>
		</div>


		<div id="modal_write" class="modal">
			<form class="modal-content animate">
				<br><p style="color: red; text-align: center">Sie müssen sich mit einem Account, der mindestens Rechte zum lesen und schreiben hat, anmelden, um diese Funktion nutzen zu können.</p><br>
				<div class="container" style="background-color:#f1f1f1">
					<button type="button" onclick="document.getElementById('modal_write').style.display='none'" class="cancelbtn">OK</button>
				</div>
			</form>
		</div>
		<?php
			error_reporting(E_ALL ^  E_NOTICE);
			$mode = $_GET['mode'];
			switch ($mode) {
				case 'error':
					echo "<script>document.getElementById('modal_error').style.display='block'</script>";
					break;
				case 'logout':
					echo "<script>document.getElementById('modal_logout').style.display='block'</script>";
					break;
				case 'session':
					echo "<script>document.getElementById('modal_session').style.display='block'</script>";
					break;
				case 'admin':
					echo "<script>document.getElementById('modal_admin').style.display='block'</script>";
					break;
				case 'write':
					echo "<script>document.getElementById('modal_write').style.display='block'</script>";
					break;
				default:
					break;
			}
		?>
		<br><br><br>
		<hr style="border: 1px solid green;">
		<p style="font-size: 12px">(c) Bennet Ranft 2019<br><br>
		Dies ist eine Demo-Version. Die Zugangsdaten finden Sie <a href="info/users/" target="_blank">hier</a>.<br>Weitere Informationen finden Sie <a href="info/" target="_blank">hier</a>.</p>
	</body>
</html>
