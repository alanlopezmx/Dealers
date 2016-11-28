<%@page import="mysqlpackage.MySqlConn"%>
<!DOCTYPE html>
<!--
Template Name: Brickary
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html>
<head>
<title>Dealers | Productos</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<%
    String nombreLogin="";
    String idLogin="";
    String tipoLogin="";
    String msjerror="";
    if(session.getAttribute("nombre") != null){
        nombreLogin = (String)session.getAttribute("nombre");
        idLogin = (String)session.getAttribute("id");
        tipoLogin = (String)session.getAttribute("tipo");
    }
    
    int idcategoria = Integer.parseInt(request.getParameter("idcategoria"));
    MySqlConn objConn = new MySqlConn();
    MySqlConn objConn1 = new MySqlConn();
    MySqlConn objConn2 = new MySqlConn();
    int n=0, n1=0,n2=0;
    String catactual = "select nombre from categoria where idCategoria="+ idcategoria +";";
    objConn.Consult(catactual);
%>
<body id="top">
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear">
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
  </div>
</div>
<!-- ################################################################################################ -->
<!-- Categoría Actual -->
<div class="bgded overlay">
  <section id="breadcrumb" class="hoc clear">
      <h6 class="heading"><center><%out.print(objConn.rs.getString(1));%></center></h6>
  </section>
</div>
<!-- ################################################################################################ -->
    <div class="wrapper row3">
        <main class="hoc container clear">
            <div class="sidebar one_quarter first" style="margin-bottom: 25px">
                <h6>Categor&iacute;as</h6>
                <nav class="sdb_holder">
                    <ul>
                        <%
                            String nomcat = "select nombre, idCategoria from categoria;";
                            objConn.Consult(nomcat);
                            if(objConn.rs != null){
                                try{
                                    objConn.rs.last();
                                    n = objConn.rs.getRow();
                                    objConn.rs.first();
                                }catch(Exception e){
                                }
                            }
                            for(int i=0; i<n;i++){
                                out.print("<li><a href='productos.jsp?idcategoria="+ objConn.rs.getString(2) +"'>" + objConn.rs.getString(1) + "</a></li>");
                                objConn.rs.next();
                            }
                        %>
                    </ul>
                </nav>
            </div>
            <div class="content three_quarter">
                <div id="introblocks">
                  <ul class="nospace group">
                    <%
                        String productos = "select idProducto, nombre, descripcion, precio_venta from producto "
                                + "where Categoria_idCategoria="+ idcategoria +";";
                        objConn1.Consult(productos);
                        if(objConn1.rs != null){
                            try{
                                objConn1.rs.last();
                                n1 = objConn1.rs.getRow();
                                objConn1.rs.first();
                            }catch(Exception e){
                            }
                        }
                        for(int i=0; i<n1;i++){ // for de los productos
                            String imagen = "select idImagen from imagen where Producto_idProducto="+ objConn1.rs.getString(1) +";";
                            objConn2.Consult(imagen);
                            n=0;
                            String aux = "";
                            if(objConn2.rs != null){
                                try{
                                    objConn2.rs.last();
                                    n2 = objConn2.rs.getRow();
                                    objConn2.rs.first();
                                }catch(Exception e){
                                }
                            }
                            if(n2>0)
                                aux = objConn2.rs.getString(1);
                            if (i%2==0){
                                out.print("<li class='one_half first'>"
                                        + "<article>"
                                        + "<div>"
                                        + "<h6 class='heading'>"+ objConn1.rs.getString(2) +"</h6>"
                                        + "<p>"+ objConn1.rs.getString(3) +"</p>"
                                        + "<p align='right'> Precio: $"+ objConn1.rs.getString(4) +" </p>"
                                        + "</div>"
                                        + "<img src='returnImagen.jsp?idImagen=" + aux + "' alt=''>"
                                        + "<footer><a href='producto.jsp?idproducto="+ objConn1.rs.getString(1) +"'>Ver más</a></footer>"
                                        + "</article>"
                                        + "</li>");
                                objConn1.rs.next();
                            }else{
                                out.print("<li class='one_half'>"
                                        + "<article>"
                                        + "<div>"
                                        + "<h6 class='heading'>"+ objConn1.rs.getString(2) +"</h6>"
                                        + "<p>"+ objConn1.rs.getString(3) +"</p>"
                                        + "<p align='right'> Precio: $"+ objConn1.rs.getString(4) +" </p>"
                                        + "</div>"
                                        + "<img src='returnImagen.jsp?idImagen=" + aux + "' alt=''>"
                                        + "<footer><a href='producto.jsp?idproducto="+ objConn1.rs.getString(1) +"'>Ver más</a></footer>"
                                        + "</article>"
                                        + "</li>");
                                objConn1.rs.next();
                            }
                        }
                        objConn.desConnect();
                        
                    %>
                  </ul>
                    </div>
                <div class="clear"></div>
            </div>
        </main>
        <div class="clear"></div>
    </div>

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
    <div id="pantalla" class="hide" onclick='hide("pantalla"); hide("login");'> </div>
    <div id="login" class="hide">
        <!--form id="newsletter" name="iniciarsesion"-->
        <fieldset id="newsletter">
            <br><b><center><div id="datos">Ingresa tus datos</div></center></b>
            <i class="fa fa-user-o" style="font-size:1.8rem;"></i>
            <input id="email" name="email" class="btmspace-15" type="text" value="" placeholder="Correo">
            <input id="password" onkeypress="validateEnter(event,email,this)" name="password" class="btmspace-15" type="password" value="" placeholder="Contraseña">
            <p align="right">
                <button onclick="checaLogin(email, password)">
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
</body>
</html>
