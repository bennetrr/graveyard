<?php
  $group = $_SESSION["group"];
?>
<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8"/>
		<link rel="stylesheet" href="files/navbar.css">
    <script type="text/x-javascript" src="files/info.js"></script>
	</head>
	<body>
		<div class="navbar">
			<a id="navbar_start" href="start.php">PC-Ansicht</a>
			<a id="navbar_slideshow" href="slideshow.php">Slideshow</a>
			<?php
				if ($group == "write") {
					echo"<a id=\"navbar_edit\" href=\"entries.php\">Eintragen / Bearbeiten</a>";
				}
				if ($group == "admin") {
					echo"<a href=\"entries.php\">Eintragen / Bearbeiten</a><a href=\"users.php\">Benutzerverwaltung</a><a href=\"settings.php\">Einstellungen</a>";
				}
			?>
			<a style="float: right" href="logout.php">Logout</a>
      <a id="info_link" style="float: right" href="#" onclick="alert('Funktion noch nicht fertig!')">Info</img></a>
		</div>
	</body>
</html>
