<?php
  header("Content-type: application/json; charset=utf-8");

  // Daten auslesen
  $produkt = $_POST['produkt'];
  $version = $_POST['version'];
  $os = $_POST['os'];
  $text = $_POST['text'];