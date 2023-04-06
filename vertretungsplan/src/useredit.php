<?php
	session_start();
	if(!isset($_SESSION['userid'])) {
		die('Fehler: Login abgelaufen');
	} else {
		$userid = $_SESSION['userid'];
		$group = $_SESSION['group'];
		if($group != 'admin') {
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
			$cboxactive = "";
			$user_loggedin = False;
			require_once("/var/www/php/vertretungsplan.inc.php");
			//
			//GET-Daten auslesen und mit Benutzerdatenbank abgleichen
			$id = $_GET['id'];
			$mode = $_GET['mode'];
			$sql = "SELECT * FROM user";
			$res = $con->query($sql);
			if($res->num_rows > 0){
				foreach($res as $row){
					if($row['id'] == $id) {
						$username = $row['username'];
						$passwd = $row['passwd'];
						$active = $row['active'];
						$sysuser = $row['sysuser'];
						$stufe = $row['stufe'];
						$rechte = $row['rechte'];
						$user_loggedin = $row['loggedin'];
					}
				}
			} else {
				closeDB($con);
				die("<p>Es wurden keine Benutzer gefunden.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
			}

			switch ($mode) {
				//Löschen: Sicherheitsfrage
				case 'delete':
					if ($sysuser == '1') {
						closeDB($con);
						die("<p class='errormessage'>Der Benutzer kann nicht gelöscht werden, da er ein Systembenutzer ist.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					if ($user_loggedin == "1") {
						closeDB($con);
						die("<p class='errormessage'>Der Benutzer kann nicht gelöscht werden, da er angemeldet ist.<br>Warten Sie, bis er sich abgemeldet hat, oder bitten Sie den Benutzer, sich abzumelden.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					closeDB($con);
					echo "<p>Wollen Sie den Benutzer \"$username\" mit der ID $id wirklich löschen?</p>";
					echo "<a class='button' href='useredit.php?id=$id&mode=del2'>LÖSCHEN</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class='cancelbutton' href='users.php' target='_top'>Abbrechen</a>";
					break;
				//Löschen: Löschen
				case 'del2':
					$res = $con->query("DELETE FROM user WHERE id = '$id'");
					if ($res == 1){
						closeDB($con);
						die("<p>Der Benutzer wurde erfolgreich gelöscht.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					} else {
						echo "<p class='errormessage'>Es ist ein Fehler aufgetreten: $con->connect_error</p><br><a class='button' href='users.php' target='_top'>OK</a>";
						closeDB($con);
						die();
					}
					break;
				//
				//Bearbeiten: Eingabe / Änderungsformular
				case 'edit':
					if ($sysuser == '1') {
						closeDB($con);
						die("<p class='errormessage'>Der Benutzer kann nicht bearbeitet werden, da er ein Systembenutzer ist.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					if ($user_loggedin == "1") {
						closeDB($con);
						die("<p class='errormessage'>Der Benutzer kann nicht bearbeitet werden, da er angemeldet ist.<br>Warten Sie, bis er sich abgemeldet hat, oder bitten Sie den Benutzer, sich abzumelden.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					if ($active = "1") {
						$cboxactive = "checked";
					}
					echo "<form action='useredit.php?mode=edit2&id=$id' method='post'>
							<input type='text' value='$username' placeholder='Benutzername' name='username'><br><br>
							<input type='password' placeholder='Neues Passwort' name='passwd'><br><br>
							<input type='password' placeholder='Passwort wiederholen' name='wdh_passwd'><br><br>
							<label>Aktiver Benutzer</label><input type='checkbox' name='active' value='true' $cboxactive><br><br>
							<label>Stufe</label>
							<select name='stufe'>
								<option value=''><i>Keine Änderung</i></option>
								<option value='0'>Alle</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
							</select><br><br>
							<label>Sicherheitsstufe</label>
							<select name='rechte'>
								<option value=''><i>Keine Änderung</i></option>
								<option value='view'>Lesen</option>
								<option value='write'>Lesen + Schreiben</option>
								<option value='admin'>Administrator</option>
							</select><br><br>
							<input type='submit' value='Speichern'>
							<a class='cancelbutton' href='users.php' target='_top'>Abbrechen</a>
						</form>";
					closeDB($con);
					break;
				//Bearbeiten: ve­ri­fi­zie­ren + Einfügen in Datenbank
				case 'edit2':
					if (empty($_POST['username'])) {
						closeDB($con);
						die("<p class='errormessage'>Sie müssen einen Benutzernamen angeben.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					if ($_POST['username'] != $username) {
						foreach($res as $row){
							if($row['username'] == $_POST['username']) {
								closeDB($con);
								die("<p class='errormessage'>Dieser Benutzername ist schon registriert.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
							}
						}	
					}					
					$username = $_POST['username'];
					//
					if (empty($_POST['passwd'])) {
						$password_hash = $passwd;
					} else {
						$password = $_POST['passwd'];
						$wdh_passwd = $_POST['wdh_passwd'];
						if ($password != $wdh_passwd) {
							closeDB($con);
							die("<p class='errormessage'>Die eingegebenen Passwörter stimmen nicht überein.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
						}
						$password_hash = password_hash($password, PASSWORD_DEFAULT);
					}
					//
					if ($_POST['active'] == "true") {
						$active = 1;
					} else {
						$active = 0;
					}
					//
					if ($_POST['stufe'] == "") {
						$stufe_new = $stufe;
					} else {
						$stufe_new = $_POST['stufe'];
					}
					//
					if ($_POST['rechte'] == "") {
						$rechte_new = $rechte;
					} else {
						$rechte_new = $_POST['rechte'];
					}
					//
					$res = $con->query("UPDATE user SET username = '$username', passwd = '$password_hash', active = '$active', stufe = '$stufe_new', rechte = '$rechte_new' WHERE id = '$id'");
					if ($res == 1){
						closeDB($con);
						die("<p>Die Änderungen wurden gespeichert.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					} else{
						echo("<p class='errormessage'>Es ist ein Fehler aufgetreten: $con->connect_error</p><br><a class='button' href='users.php' target='_top'>OK</a>");
						closeDB($con);
						die();
					}
					break;
				//
				//Neuer Benutzer: Eingabe
				case 'new':
					echo "<form action='useredit.php?mode=new2&id=0' method='post'>
							<input type='text' placeholder='Benutzername' name='username'><br><br>
							<input type='password' placeholder='Passwort' name='passwd'><br><br>
							<input type='password' placeholder='Passwort wiederholen' name='wdh_passwd'><br><br>
							<label>Aktiver Benutzer</label><input type='checkbox' name='active' value='true' checked><br><br>
							<label>Systembenutzer</label><input type='checkbox' name='sysuser' value='true'><br><br>
							<label>Stufe</label>
							<select name='stufe'>
								<option value='0'>Alle</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
							</select><br><br>
							<label>Sicherheitsstufe</label>
							<select name='rechte'>
								<option value='view'>Lesen</option>
								<option value='edit'>Lesen + Schreiben</option>
								<option value='admin'>Administrator</option>
							</select><br><br>
							<input type='submit' value='Speichern'>
							<a class='cancelbutton' href='users.php' target='_top'>Abbrechen</a>
						</form>";
					closeDB($con);
					break;
				//Neu: ve­ri­fi­zie­ren + Einfügen in Datenbank
				case 'new2':
					//POST-Daten auslesen und verifizieren
					if (empty($_POST['username'])) {
						closeDB($con);
						die("<p class='errormessage'>Sie müssen einen Benutzernamen angeben.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					//
					foreach($res as $row){
						if($row['username'] == $_POST['username']) {
							closeDB($con);
							die("<p class='errormessage'>Dieser Benutzername ist schon registriert.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
						}
					}
					//
					$username = $_POST['username'];
					//
					//
					if (empty($_POST['passwd'])) {
						closeDB($con);
						die("<p class='errormessage'>Sie müssen ein Passwort angeben.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					//
					$password = $_POST['passwd'];
					$wdh_passwd = $_POST['wdh_passwd'];
					//
					if ($password != $wdh_passwd) {
						closeDB($con);
						die("<p class='errormessage'>Die eingegebenen Passwörter stimmen nicht überein.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					}
					//
					$password = password_hash($password, PASSWORD_DEFAULT);
					//
					//
					if ($_POST['active'] == "true") {
						$active = 1;
					} else {
						$active = 0;
					}
					//
					//
					if ($_POST['sysuser'] == "true") {
						$sysuser = 1;
					} else {
						$sysuser = 0;
					}
					//
					//
					$stufe = $_POST['stufe'];
					$rechte = $_POST['rechte'];
					//
					//
					$res = $con->query("INSERT INTO user(username, passwd, sysuser, active, stufe, rechte, loggedin) VALUES ('$username','$password','$sysuser','$active','$stufe','$rechte','0')");
					if ($res == 1){
						closeDB($con);
						die("<p>Der Benutzer wurde gespeichert.</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					} else{
						echo "<p class='errormessage'>Es ist ein Fehler aufgetreten: $con->connect_error</p><br><a class='button' href='users.php' target='_top'>OK</a>";
						closeDB($con);
						die();
					}
					break;
				//
				//Fehler
				default:
					closeDB($con);
					die("<p class='errormessage'>Es ist ein Fehler aufgetreten: ungültige Aktion</p><br><a class='button' href='users.php' target='_top'>OK</a>");
					break;
			}
		?>
	</body>
</html>
