<!DOCTYPE html>

<html>
<head>
<title>Dealers | Productos</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript" language="JavaScript">
 
    function actualizaDivContenido(op) {
        // The XMLHttpRequest object
        var xmlHttp;
        try { // Detectar que tipo de navegador se esta utilizando
            xmlHttp = new XMLHttpRequest(); // Firefox, Opera 8.0+, Safari
        }
        catch (e) {
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP"); // Internet Explorer
            }
            catch (e) {
                try {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                catch (e) {
                    alert("Tu explorador no soporta AJAX.");
                    return false;
                }
            }
        }
        var nocacheurl = "clienteAjax.jsp?op=" + op;

        // The code...
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.readyState != null) {
                document.getElementById("contenido").innerHTML = xmlHttp.responseText;
            }
        }
        xmlHttp.open("GET", nocacheurl, true); //parametros (metodo, url, asincorno=true)
        xmlHttp.send(null);
    }
    
    window.onload = function () {
        actualizaDivContenido(1);
    }
           
</script>

</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear">
    <!-- ################################################################################################ -->
    <div class="fl_left imglogo">
      <img src="images/logo3.png">
    </div>
    <div class="fl_left">
       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    </div>
    <div id="busqueda" class="fl_left">
        <form class="group" method="post" action="#">
          <fieldset>
            <input type="email" value="" placeholder="Busca Aqui&hellip;">
            <button class="fa fa-search" type="submit" title="Submit"><em>Submit</em></button>
          </fieldset>
        </form>
    </div>
    <div class="fl_right">
      <ul>
        <li><a href="index.html"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
        <li><a href="#">Iniciar Sesión</a></li>
        <li><a href="#">Registrarse</a></li>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- Top Background Image Wrapper -->
<div class="bgded overlay">
  <!-- ################################################################################################ -->

  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <!-- ################################################################################################ -->
  <section id="breadcrumb" class="hoc clear">

    <!-- ################################################################################################ -->
    <h6 class="heading"><center>Mi cuenta</center></h6>
    <!-- ################################################################################################ -->
  </section>
  <!-- ################################################################################################ -->
</div>
<!-- End Top Background Image Wrapper -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="hoc container clear">
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="sidebar one_quarter first">
      <!-- ################################################################################################ -->
      <nav class="sdb_holder">
        <ul>
          <li><a href="javascript:actualizaDivContenido(1);">Datos Personales</a></li>
          <li><a href="javascript:actualizaDivContenido(2);">Modificar Contraseña</a></li>
          <li><a href="javascript:actualizaDivContenido(3);">Direcciones</a></li>
          <li><a href="javascript:actualizaDivContenido(4);">Tarjetas</a></li>
          <li><a href="javascript:actualizaDivContenido(5);">Historial de Compras</a></li>
        </ul>
      </nav>

    </div>
    
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div id="contenido" class="content one_half" style="margin-left: 150px; margin-bottom: 30px;">
      <!-- ################################################################################################ -->
      
    </div>
</main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4 bgded overlay" style="background-image:url('../images/demo/backgrounds/03.png');">
  <footer id="footer" class="hoc clear">
    <!-- ################################################################################################ -->
    <h3 class="heading">Dealers</h3>
    <nav>
      <ul class="nospace inline pushright uppercase">
        <li></li>
        <li><a href="#">Acerca de</a></li>
        <li><a href="#">Contacto</a></li>
        <li><a href="#">Terminos</a></li>
        <li><a href="#">Privacidad</a></li>
      </ul>
    </nav>
    <ul class="faico clear">
      <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
      <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
      <li><a class="faicon-dribble" href="#"><i class="fa fa-dribbble"></i></a></li>
      <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
      <li><a class="faicon-google-plus" href="#"><i class="fa fa-google-plus"></i></a></li>
      <li><a class="faicon-vk" href="#"><i class="fa fa-vk"></i></a></li>
    </ul>
    <!-- ################################################################################################ -->
  </footer>
</div>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>
