<?php
    $servername = "localhost";
    $username = "root";
    $password = "******";
    $database = "website";
    $con = new mysqli($servername, $username, $password, $database);
    if ($con->connect_error) {
        echo "<script>
            document.getElementById('maintext').innerText = '';
            </script>
            <p class='text-center' style='color: var(--dunkelrot)'>Es ist ein Fehler aufgetreten.</p>
            </div>
            <div class='grid_feed'>
            </div>
            </div>
            <div class='grid_footer'>";
        include_once("/var/www/html/files/includes/footer.inc.php");
        die('</div>');
    }
?>
