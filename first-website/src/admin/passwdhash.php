<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>bennetr</title>
    <link rel="stylesheet" href="/files/styles/main.css">
    <style>
      body{
        overflow: hidden;
      }

      #window{
        width: 90%;
        height: 80%;
        margin: auto;
        border: 3px solid #00aa55;
        border-radius: 7px;
        overflow: hidden;
      }

      #chat{
        font-size: 14px;
        font-family: mono;
        overflow: auto;
        margin: 0px
      }

      #inputfield{
        width: calc(100% - 300px);
      }

      #controll-container{
        width: 90%;
        height: 50px;
        margin: auto;
        margin-top: 20px;
      }

      .p_button{
        height: 100%;
        margin-left: 14px;
        width: 100px;
        color: white;
      }
    </style>
  </head>
   <body>
    <h1 class="sitetitle">Admin-Bereich</h1>
    <?php
      session_start();
      if(!isset($_SESSION['loggedin'])) {
        header("Location: index.php");
        die();
      }
    ?>
    <div id="window">
      <p id="chat">
      </p>
    </div>
    <div id="controll-container">
      <input type="text" id="inputfield" placeholder="Text eingeben">
      <button onclick="send_message()" class="submit-button p_button">Senden</button>
      <button onclick="clear_message()" class="reset-button p_button">Löschen</button>
    </div>
    <script>
      var p_inputfield = document.getElementById("inputfield");
      var p_chat = document.getElementById("chat");
      var p_window = document.getElementById("window");

      p_inputfield.addEventListener("keyup", function(event) {
        if (event.keyCode === 13) {
          event.preventDefault();
          send_message();
        }
      })

      function send_message(){
        var p_message = p_inputfield.value;
        if(p_message != ""){
          var p_request = new XMLHttpRequest();
          p_request.open("POST", "passwdhash_req.php", true);
          p_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
          p_request.onreadystatechange = function(){
            if (this.readyState == 4 && this.status == 200) {
              var p_json = JSON.parse(this.responseText);
              var p_ptag = document.createElement("P");
              p_ptag.appendChild(document.createTextNode(">> " + p_json.raw));
              p_ptag.appendChild(document.createElement("BR"));
              p_ptag.appendChild(document.createTextNode("SHA1: " + p_json.sha1));
              p_ptag.appendChild(document.createElement("BR"));
              p_ptag.appendChild(document.createTextNode("SMD: " + p_json.md5));
              p_ptag.appendChild(document.createElement("BR"));
              p_ptag.appendChild(document.createTextNode("Passwort-Hash: " + p_json.passwd));
              p_ptag.appendChild(document.createElement("BR"));
              p_ptag.appendChild(document.createElement("BR"));
              p_chat.appendChild(p_ptag);
            } else if (this.readyState == 4 && this.status != 200){
              var p_ptag = document.createElement("P");
              p_ptag.appendChild(document.createTextNode("Es ist ein Fehler aufgetreten: " + this.status + " " + this.statusText));
              p_ptag.appendChild(document.createElement("BR"));
              p_ptag.appendChild(document.createElement("BR"));
              p_chat.appendChild(p_ptag);
            }
          };
          p_request.send("message=" + p_message);
          clear_message()
        }
      }

      function clear_message(){
        p_inputfield.value = "";
      }
    </script>
  </body>
</html>
