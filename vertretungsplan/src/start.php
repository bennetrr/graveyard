<?php
  session_start();
  if(!isset($_SESSION['userid'])) {
      die('<script>window.location.href = "index.php?mode=session"</script>');
  }
  $userid = $_SESSION['userid'];
  $group = $_SESSION['group'];
?>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vertretungsplan</title>
		<link rel="stylesheet" href="files/style.css">
	</head>
	<body>
    	<?php
			include_once '/var/www/vertretungsplan/files/navbar.inc.php';
		?>
    	<p>Inhalt folgt</p>
	</body>
</html>
