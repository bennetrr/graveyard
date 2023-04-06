<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="UTF-8">
        <title>whiptail-Tutorial | bennetr</title>
        <link rel="stylesheet" href="/files/styles/main.css">
        <style>
          #topnav_tutorials{
            color: var(--weiß);
          }
        </style>
    </head>
    <body>
        <div class="grid_topnav" id="top">
            <?php include_once("/var/www/html/files/includes/topnav.inc.php") ?>
        </div>
        <div class="grid_main">
            <div class="grid_sidenav">
              <br>
              <span><b>Inhaltsverzeichnis</b></span>
              <ol>
                <li><a href="#top">Seitenanfang</a></li>
                <li><a href="#einleitung">Einleitung</a></li>
                <li><a href="#info-box">Info- und Message-Box</a></li>
                <li><a href="#yesnobox">Ja/Nein-Box</a></li>
                <li><a href="#inputbox">Input-Box</a></li>
                <li><a href="#passwordbox">Password-Box</a></li>
                <li><a href="#textbox">Textbox</a></li>
                <li><a href="#menus">Menüs</a></li>
                <li><a href="#checklist">Checklists</a></li>
                <li><a href="#radiolist">Radio-Listen</a></li>
                <li><a href="#fortschritt">Fortschrittsbalken</a></li>
              </ol>
            </div>
            <div class="grid_content">
              <p class="sitetitle">whiptail - Dialogboxen im Terminal</p>
              <p class="subtitle-left" id="einleitung">Einleitung</p>
              <p class="text-left">Whiptail ist ein Programm, dass es ermöglicht, in Shellscripts Dialoge anzuzeigen. Es ist standartmäßig unter Debian / Ubuntu installiert. Das gute ist, dass whiptail im Terminal läuft und dadurch auch in einer reinen Textumgebung oder über SSH benutzt werden kann.</p>
              <br>
              <p class="subtitle-left" id="info-box">Info-Box und Message-Box</p>
              <p class="text-left">Der einfachste Typ ist die Info-Box. Sie zeigt einen Text auf dem Bildschirm an.</p>
              <br><code class="codebox">whiptail --title "[text]" --infobox "[text]" [höhe] [breite] --backtitle [text]</code><br>
              <p class="text-left"><code>--title [text]</code> ist der Text, der über dem Fenster angezeigt wird.<br>
                Der erste Parameter von <code>--infobox [text]</code> ist der Text, der im Fenster angezeigt wird.<br>
                <code>[höhe]</code> und <code>[breite]</code> sind Ganzzahlen, die die Größe des Fenster in Zeilen angeben. Die meisten Terminalfenster sind 80 oder mehr Zeilen breit, deshalb bietet es sich an, die Breite auf 78 zu stellen.<br>
                <code>--backtitle [text]</code> zeigt einen Text am oberen linken Rand des Terminals an.<br>
                <br>
                Es gibt einen Bug, wegen dem die Info-Box bei manchen Terminals nicht erscheint (ist auch bei mir der Fall, GNOME Terminal). Dann hilft es, <code>TERM=ansi</code> vorne hinzufügen.</p>
              <br><code class="codebox">TERM=ansi whiptail --title "[text]" --infobox "[text]" [höhe] [breite] --backtitle [text]</code><br>
              <br>
              <p>Eine Message-Box ist im Grunde das gleiche, allerdings wartet sie darauf, dass der Benutzer den OK-Button drückt.</p>
              <br><code class="codebox">whiptail --title "[text]" --msgbox "[text]" [höhe] [breite] --backtitle [text] --ok-button [text]</code><br>
              <p class="text-left">
                Mit <code>--ok-button [text]</code> kann man den Text des OK-Buttons ändern.
              </p>
              <br>
              <br>
              <p class="subtitle-left" id="yesnobox">Ja/Nein-Box</p>
              <p class="text-left">Bei einer Ja/Nein-Box gibt es zwei Schaltflächen. Wenn der Benutzer Nein ausgewählt hat, gibt whiptail den Rückgabecode 1. Wenn der Benutzer Ja ausgewählt hat, gibt whiptail den Rückgabecode 0.</p>
              <br><code class="codebox">whiptail --title "[text]" --yesno "[text]" [höhe] [breite] --backtitle [text] --yes-button [text] --no-button [text]</code><br>
              <p>
                <code>--yes-button [text]</code> bzw. <code>--no-button [text]</code> ändert den Text des jeweiligen Buttons.<br>
                Man kann z.B. eine if-Abfrage machen, die erkennt, welcher Button gedrückt wurde.</p>
                <br><code class="codebox">if (whiptail --title "[text]" --yesno "[text]" [höhe] [breite] --backtitle [text] --yes-button [text] --no-button [text]);then<br>
                &nbsp;echo "Ja wurde ausgewählt, Rückgabecode: $?."<br>
                &nbsp;#Platz für mehr Befehle<br>
              else<br>
              &nbsp;echo "Nein wurde ausgewählt, Rückgabecode: $?."<br>
              &nbsp;#Platz für mehr Befehle<br>
              fi
              </code><br>
              </p>
              <br>
              <br>
              <p class="subtitle-left" id="inputbox">Input-Box</p>
              <p class="text-left">In einer Iput-Box kann man Text eingeben. Es ist leider nur eine Zeile, ein OK-Button und ein Abbrechen-Button vorhanden.</p>
              <br><code class="codebox">whiptail --title "[text]" --inputbox "[text]" [höhe] [breite] [text] --backtitle [text] --ok-button [text] --cancel-button [text] --nocancel</code><br>
              <p>
                Der Parameter hinter <code>[breite]</code> gibt einen Vorgabewert an, der schon von anfang an in dem Textfeld steht.<br>
                <code>--ok-button [text]</code> bzw. <code>--cancel-button [text]</code> ändert den Text des jeweiligen Buttons.<br>
                Wenn man <code>--nocancel</code> angibt, wird der Abbrechen-Button nicht angezeigt. Man kann dann aber trotzdem einen leeren Text absenden.
              </p>
              <br>
              <br>
              <p class="subtitle-left" id="passwordbox">Password-Box</p>
              <p class="text-left">Eine Password-Box verhält sich wie eine Input-Box, nur dass die Eingabe nicht in Klartext, sondern in Sternchen angezeigt wird.</p>
              <br><code class="codebox">whiptail --title "[text]" --passwordbox "[text]" [höhe] [breite] [text] --backtitle [text] --ok-button [text] --cancel-button [text] --nocancel</code><br>
              <br>
              <br>
              <p class="subtitle-left" id="textbox">Textbox</p>
              <p class="text-left">Eine Textbox zeigt den Inhalt einer Datei und einen OK-Button an.</p>
              <br><code class="codebox">whiptail --title "[text]" --textbox [file] [höhe] [breite] --backtitle [text] --ok-button [text] --scrolltext</code><br>
              <p>
                <code>[file]</code> gibt einen Dateipfad an. Er kann absolut oder relativ sein.<br>
                Wenn man lange Texte hat, empfielt sich <code>--scrolltext</code>.
              </p>
              <br>
              <br>
              <p class="subtitle-left" id="menus">Menüs</p>
              <p class="text-left">In einem Menü kann der Benutzer eine Option auswählen, welche dann in stderr ausgegeben wird.</p>
              <br><code class="codebox">whiptail --title "[text]" --menu "[text]" [höhe] [breite] [höhe_der_liste] --noitem --notags \<br>
                "[tag]" "[item]" \<br>
                "[tag]" "[item]" \<br>
                "[tag]" "[item]" \<br>
                "[tag]" "[item]" \<br>
                "[tag]" "[item]"
                </code><br>
              <p>
                <code>--menu [text]</code> gibt eine Beschreibung des Menüs an.<br>
                <code>[höhe_der_liste]</code> gibt an, wie hoch die Liste sein soll. Sie ist unabhängig von der eigentlichen Höhe des Dialogs. Wenn es zu viele Elemente in der Liste gibt, erscheint eine Scrollbar an der Seite.<br>
                <code>[tag] [item]</code> ist ein Menüeintrag. <code>[tag]</code> wird, wenn der Benutzer einen Menüeintrag auswählt, in stderr ausgegeben. Man kann die tags und auch die items mit <code>--notags</code> bzw. <code>noitems</code> ausblenden. Wenn man beide Optionen gleichzeitig angibt, wird eine Liste ohne Text angezeigt.
              </p>
              <br>
              <br>
              <p class="subtitle-left" id="checklist">Checklists</p>
              <p class="text-left">In einer Checklist kann der Benutzer eine oder mehrere Optionen auswählen, welche dann in stderr ausgegeben wird.</p>
              <br><code class="codebox">whiptail --title "[text]" --checklist "[text]" [höhe] [breite] [höhe_der_liste] --notags \<br>
                "[tag]" "[item]" ON \<br>
                "[tag]" "[item]" ON \<br>
                "[tag]" "[item]" ON \<br>
                "[tag]" "[item]" OFF \<br>
                "[tag]" "[item]" OFF
                </code><br>
              <p>
                <code>--checklist [text]</code> gibt eine Beschreibung der Liste an.<br>
                <code>[höhe_der_liste]</code> gibt an, wie hoch die Liste sein soll. Sie ist unabhängig von der eigentlichen Höhe des Dialogs. Wenn es zu viele Elemente in der Liste gibt, erscheint eine Scrollbar an der Seite.<br>
                <code>[tag] [item]</code> ist ein Menüeintrag. <code>[tag]</code> wird, wenn der Benutzer einen Menüeintrag auswählt, in stderr ausgegeben. Man kann die tags mit <code>--notags</code> ausblenden.<br>
                <code>ON</code> und <code>OFF</code> ist eine Vorauswahl.
              </p>
              <br>
              <br>
              <p class="subtitle-left" id="radiolist">Radio-Listen</p>
              <p class="text-left">In einer Checklist kann der Benutzer eine oder mehrere Optionen auswählen, welche dann in stderr ausgegeben wird.</p>
              <br><code class="codebox">whiptail --title "[text]" --radiolist "[text]" [höhe] [breite] [höhe_der_liste] --notags \<br>
                "[tag]" "[item]" ON \<br>
                "[tag]" "[item]" OFF \<br>
                "[tag]" "[item]" OFF \<br>
                "[tag]" "[item]" OFF \<br>
                "[tag]" "[item]" OFF
                </code><br>
              <p>
                <code>--radiolist [text]</code> gibt eine Beschreibung der Liste an.<br>
                <code>[höhe_der_liste]</code> gibt an, wie hoch die Liste sein soll. Sie ist unabhängig von der eigentlichen Höhe des Dialogs. Wenn es zu viele Elemente in der Liste gibt, erscheint eine Scrollbar an der Seite.<br>
                <code>[tag] [item]</code> ist ein Menüeintrag. <code>[tag]</code> wird, wenn der Benutzer einen Menüeintrag auswählt, in stderr ausgegeben. Man kann die tags mit <code>--notags</code> ausblenden.<br>
                <code>ON</code> und <code>OFF</code> ist eine Vorauswahl. Es sollte nur eine getroffen werden, sonst bugt Whiptail ein bisschen.
              </p>
              <br>
              <br>
              <p class="subtitle-left" id="fortschritt">Fortschrittsbalken</p>
              <p class="text-left">Der Fortschrittsbalken kann Prozentzahlen über ein Argument oder über stdin bekommen.</p>
              <br><code class="codebox">whiptail --title "[text]" --gauge "[text]" [höhe] [breite] [prozent]</code><br>
              <p>
                <code>--gauge [text]</code> gibt einen Text über dem Balken an.<br>
                <code>[prozent]</code> gibt den Fortschritt in Prozent an. Er kann auch von stdin kommen:
              </p>
              <br><code class="codebox">#!/bin/bash<br>
                {<br>
                    for ((i = 0 ; i <= 100 ; i+=1); do<br>
                        sleep 0.1<br>
                        echo $i<br>
                    done<br>
                } | whiptail --gauge "[text]" 6 50 0</code><br>
              <br>
              <br>
            </div>
            <div class="grid_feed">
            </div>
        </div>
        <div class="grid_footer">
            <?php include_once("/var/www/html/files/includes/footer.inc.php") ?>
        </div>
    </body>
</html>