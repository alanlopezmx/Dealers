
<%@page import="java.sql.Blob"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String nombreLogin="";
    String idLogin="";
    String tipoLogin="";
    if(session.getAttribute("nombre") != null){
        nombreLogin = (String)session.getAttribute("nombre");
        idLogin = (String)session.getAttribute("id");
        tipoLogin = (String)session.getAttribute("tipo");
    }
%>
<html>
<head>
<title>Dealers</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript" language="JavaScript">
 
    function checaLogin(email,pass) {
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
        var nocacheurl = "checkLogin.jsp?email="+email.value+"&password="+pass.value;

        // The code...
        xmlHttp.onreadystatechange = function () {
            if (xmlHttp.readyState == 4 && xmlHttp.readyState != null) {
                var response = xmlHttp.responseText;
                response = response.trim();
                if(response == ""){
                    window.location = "index.jsp";
                }
                document.getElementById("datos").innerHTML = response;
            }
        }
        xmlHttp.open("GET", nocacheurl, true); //parametros (metodo, url, asincorno=true)
        xmlHttp.send(null);
    } 
</script>
</head>
<body>
    <div class="wrapper row0">
  <div id="topbar" class="hoc clear">
    <!-- ################################################################################################ -->
    <div class="fl_left imglogo">
        <a href="index.jsp"> <img src="images/logo3.png"> </a>
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
          <% if(nombreLogin.equals("")){ %>
                <li><i style="font-style: #23B8C1; font-size:1.8rem;"></i></li>
                <li onclick='show("pantalla", "pantalla"); show("login", "login")'><a href="#">Iniciar Sesión</a></li>
                <li><a href="registrarse.jsp">Registrarse</a></li>
        <%} else {%>
                <%
                    if(tipoLogin.equals("NORMAL") || tipoLogin.equals("MAYORITARIO")){
                %>
                    <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                    <li id="username"> <a href="cliente.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}else if(tipoLogin.equals("ADMINISTRADOR")){%>
                    <li id="username"> <a href="administrador.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}else{%>
                    <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                    <li id="username"> <a href="vendedor.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}%>
                <li><a href="cerrarSesion"><i class="fa fa-sign-out" style="font-size:1.8rem;"></i></a></li>    
        <% }%>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </div>
</div>
    <div class="hoc container">
      <div style="margin: 0 auto; width: 70%; margin-bottom: 10%">
        <img src="images/contactanos.png"><br><br>
        <a href="index.jsp"><img src="images/deal.png"></a>
      </div>
    </div>
      <div class="wrapper row4 bgded overlay" style="background-image:url('images/demo/backgrounds/03.png');">
      <footer id="footer" class="hoc clear">
        <!-- ################################################################################################ -->
        <h3 class="heading">Dealers</h3>
        <nav>
          <ul class="nospace inline pushright uppercase">
            <li></li>
            <li><a href="acercade.jsp">Acerca de</a></li>
            <li><a href="contacto.jsp">Contacto</a></li>
            <li><a href="terminos.jsp">Terminos</a></li>
          </ul>
        </nav>
        <ul class="faico clear">
          <li><a class="faicon-facebook" href="#"><i class="fa fa-facebook"></i></a></li>
          <li><a class="faicon-twitter" href="#"><i class="fa fa-twitter"></i></a></li>
          <li><a class="faicon-linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
        </ul>
        <!-- ################################################################################################ -->
      </footer>
    </div>
    <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
    <div id="pantalla" class="hide" onclick='hide("pantalla"); hide("login");'> </div>
<div id="login" class="hide">
    <!--form id="newsletter" name="iniciarsesion"-->
        <fieldset id="newsletter">
            <br><b><center><div id="datos">Ingresa tus datos</div></center></b>
            <i class="fa fa-user-o" style="font-size:1.8rem;"></i>
            <input id="email" name="email" class="btmspace-15" type="text" value="" placeholder="Correo">
            <input id="password" name="password" class="btmspace-15" type="password" value="" placeholder="Contraseña">
            <p align="right">
                <button onclick="checaLogin(email,password)">
                    &nbsp&nbsp&nbsp Ingresar &nbsp&nbsp&nbsp
                </button>
            </p>
        </fieldset>
    <!--/form-->    
</div>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>
