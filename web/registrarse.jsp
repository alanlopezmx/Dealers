<%-- 
    Document   : registrarse
    Created on : 20-nov-2016, 20:29:32
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="css/registrarse.css">
  <link rel="stylesheet" href="css/main.css">
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
          <a href="index.jsp"> <img src="images/logo3.png"> </a>
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
          <form id="newsletter" method="post" action="insertUser.jsp">
            <fieldset>
              <br>
              <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa tus datos para el registro</b>
              <br>
              <br>
              <input name ="nombre" class="btmspace-15" type="text"value="" placeholder="Nombre">
              <section class="one_half first">
                <input name="appat" class="btmspace-15" type="text" value="" placeholder="Apellido Paterno">
              </section>
              <section class="one_half">
                <input name="apmat" class="btmspace-15" type="text" value="" placeholder="Apellido Materno">
              </section>
              <input name="telefono" class="btmspace-15" type="text" value="" placeholder="Teléfono">
              <input name="email" class="btmspace-15" type="text" value="" placeholder="Email">
              <section class="one_half first">
                <input name="password" class="btmspace-15" type="password" value="" placeholder="Password">
              </section>  
              <section class="one_half">
                  <input name="password" class="btmspace-15" type="password" value="" placeholder="Re-Password">
              </section>
              <br><br>
              <p align="right">
                <button type="submit" value="submit">&nbsp&nbsp&nbsp Registrarse &nbsp&nbsp&nbsp</button>
              </p>
              </fieldset>
          </form>
        </div>
      </div>
    </div>
    

<script src="js/main.js"></script>
<script src="materialize/js/jquery.min.js"></script>
<script src="materialize/js/materialize.min.js"></script>
<script type="text/javascript">
$('.datepicker').pickadate({
  selectMonths: true, // Creates a dropdown to control month
  selectYears: 100 // Creates a dropdown of 15 years to control year
});

</script>
</body>

</html>
