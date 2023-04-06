    <script>
      function responsivTopnav() {
        var x = document.getElementById("mainTopnav");
        if (x.className === "topnav") {
          x.className += " responsive";
        } else {
          x.className = "topnav";
        }
      }
    </script>
    <div class="topnav" id="mainTopnav">

      <a id="topnav_home" href="/">Home</a>

      <div class="topnav-dropdown">
        <a id="topnav_tutorials" href="/tutorials">Tutorials&nbsp;&nbsp;&#9660;</a>
        <div class="topnav-dropdown-content">
          <a href="/tutorials/whiptail/">Whiptail - Dialogboxen im Terminal</a>
        </div>
      </div>

      <div class="topnav-dropdown">
        <a id="topnav_software" href="/software/">Software&nbsp;&nbsp;&#9660;</a>
        <div class="topnav-dropdown-content">
          <a href="/software/bupdate">bupdate</a>
          <a href="/software/bbackup">bBackup</a>
        </div>
      </div>

      <div class="topnav-dropdown">
        <a id="topnav_mc" href="/mc/">Minecraft-Projekte&nbsp;&nbsp;&#9660;</a>
        <div class="topnav-dropdown-content">
          <a href="/mc/fp/">Freizeitpark-Projekt</a>
        </div>
      </div>
      
      <a id="topnav_equip" href="/equip">Mein Equipment</a>
      
      <a href="javascript:void(0);" class="icon" onclick="responsivTopnav()">&#9776;</a>
    </div>