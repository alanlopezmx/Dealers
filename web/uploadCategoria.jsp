<%-- 
    Document   : uploadCategoria
    Created on : 20-nov-2016, 22:52:21
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
  
  <script language="JavaScript">
        var w = window,
    d = document,
    e = d.documentElement,
    g = d.getElementsByTagName('body')[0],
    x = w.innerWidth || e.clientWidth || g.clientWidth,
    y = w.innerHeight|| e.clientHeight|| g.clientHeight;
  </script>
  <script src="layout/scripts/jquery.min.js"></script>
  <script src="layout/scripts/jquery.backtotop.js"></script>
  <script src="layout/scripts/jquery.mobilemenu.js"></script>
  <script src="layout/scripts/jquery.flexslider-min.js"></script>
</head>
<body>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
    <div class="wrapper row0">
      <div id="topbar" class="hoc clear">
        <div class="fl_left imglogo">
          <img src="images/logo3.png">
        </div>
      </div>
    </div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
    <div class="hoc container">
      <div class="one_half first">
          <img src="images/connect.png">
      </div>
      <div class="one_half">
        <div class="row">
          <form id="newsletter" method="post" action="uploadCat" name="altacategoria" enctype="multipart/form-data">
            <fieldset>
              <br>
              <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos de la categoría</b>
              <br><br>
              <input name="nombre" class="btmspace-15" type="text" value="" placeholder="Nombre">
              <section class="one_half first">
                <input id="uploadFile" placeholder="Choose File" disabled="disabled" />
              </section>
              <section class="one_half">
                <div class="fileUpload btn btn-primary">
                  <span>Upload</span>
                  <input name="file" id="uploadBtn" type="file" class="upload" />
              </div>
              </section>
              <br><br><br>
              <p align="right">
                <button type="submit" value="submit">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
              </p>
              </fieldset>
          </form>
        </div>
      </div>
    </div>
<script type="text/javascript">
  document.getElementById("uploadBtn").onchange = function () {
    document.getElementById("uploadFile").value = this.value;
    };
</script>
</body>

</html>
