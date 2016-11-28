
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

</head>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
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
                    <li id="username"> <a href="administrador.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}%>
                <li><a href="cerrarSesion"><i class="fa fa-sign-out" style="font-size:1.8rem;"></i></a></li>    
        <% }%>
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
  <div id="pageintro" class="hoc clear">
    <!-- ################################################################################################ -->
    <div class="flexslider basicslider">
      <ul class="slides">
        <%
            String consulta = "select idImagen from imagen where promocion = 1;";
            objConn.Consult(consulta);
            int n=0;
            if(objConn.rs != null){
                try{
                    objConn.rs.last();
                    n = objConn.rs.getRow();
                    objConn.rs.first();
                }catch(Exception e){
                }
            }
            for(int i=0;i<n;i++){
                out.println("<li><article><a href='#'><img src='returnImagen.jsp?idImagen=" + objConn.rs.getString(1) + "' alt=''></a></article></li>");
                objConn.rs.next();
            }
        %>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </div>
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
    <div class="content">
      <!-- ################################################################################################ -->
      <div id="gallery">
        <figure>
          <div class="center-div">
            <img src="images/cate.png" alt="">
          </div>
          <ul class="nospace clear">
            <%
                consulta = "select idCategoria from categoria;";
                objConn.Consult(consulta);
                n=0;
                if(objConn.rs != null){
                    try{
                        objConn.rs.last();
                        n = objConn.rs.getRow();
                        objConn.rs.first();
                    }catch(Exception e){
                    }
                }
                int cont = 4;
                for(int i=0;i<n;i++){
                    if(cont == 4){
                        out.println("<li class='one_quarter first'><a href='productos.jsp?idcategoria=" +objConn.rs.getString(1) + "'><img src='returnCategoria.jsp?idCategoria=" + objConn.rs.getString(1) + "' alt=''></a></li>");
                        cont = 0;
                    }
                    else{
                        out.println("<li class='one_quarter'><a href='productos.jsp?idcategoria=" +objConn.rs.getString(1) + "'><img src='returnCategoria.jsp?idCategoria=" + objConn.rs.getString(1) + "' alt=''></a></li>");
                    }
                    objConn.rs.next();
                    cont++;
                }
                objConn.desConnect();
            %>
          </ul>

        </figure>
      </div>
      <!-- ################################################################################################ -->
      <!-- ################################################################################################ -->

      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
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
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div id="pantalla" class="hide" onclick='hide("pantalla"); hide("login");'> </div>
<div id="login" class="hide">
    <!--form id="newsletter" name="iniciarsesion"-->
        <fieldset id="newsletter">
            <br><b><center><div id="datos">Ingresa tus datos</div></center></b>
            <i class="fa fa-user-o" style="font-size:1.8rem;"></i>
            <input id="email" name="email" class="btmspace-15" type="text" value="" placeholder="Correo">
            <input onkeypress="validateEnter(event,email,this)" id="password" name="password" class="btmspace-15" type="password" value="" placeholder="Contraseña">
            <p align="right">
                <button onclick="checaLogin(email,password)">
                    &nbsp&nbsp&nbsp Ingresar &nbsp&nbsp&nbsp
                </button>
            </p>
        </fieldset>
    <!--/form-->    
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>
