<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<!DOCTYPE html>

<html>
<head>
<title>Dealers | Administrador</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript" language="JavaScript">
    function actualizaDivContenido(op){
        var idLogin = $('#idLogin').val();
        $.post('compraAjax.jsp', {
                op : op,
                idLogin: idLogin,
        }, function(responseText) {
                $('#contenido').html(responseText);
        });
    }
    
    window.onload = function () {
        actualizaDivContenido(1);
    }           
</script>
<%
    String nombreLogin="";
    String idLogin="";
    String tipoLogin="";
    String msjerror="";
    ArrayList<producto> a = null;
    if(session.getAttribute("nombre") != null){
        nombreLogin = (String)session.getAttribute("nombre");
        idLogin = (String)session.getAttribute("id");
        tipoLogin = (String)session.getAttribute("tipo");
        a = (ArrayList<producto>) session.getAttribute("carrito");
    }
    int idProducto = Integer.parseInt(request.getParameter("idproducto"));
    int idSucursal, cantidad = 0;
    String cant;
    String consulta = "select cantidad, idSucursal from existencias where idProducto = "+ idProducto +";";                objConn.Consult(consulta);
        int nSuc = 0;
        if (objConn.rs != null) {
            try {
                objConn.rs.last();
                nSuc = objConn.rs.getRow();
                objConn.rs.first();
            } catch (Exception e) {
            }
        }
        for (int i = 0; i < nSuc; i++) {
            idSucursal = Integer.parseInt(objConn.rs.getString(2));
            if(request.getParameter("cant2"+idSucursal)!=null){
                cant = new String(request.getParameter("cant2"+idSucursal).getBytes("ISO-8859-1"),"UTF-8");
                cant=cant.trim();
                cantidad = Integer.parseInt(cant);
            }
            if(cantidad != 0)
                if(a.isEmpty()){
                    a.add(new producto(idProducto, idSucursal, cantidad));
                }else{
                    boolean existe = false;
                    for(producto prod: a){
                        if(prod.idProducto == idProducto && prod.idSucursal == idSucursal){
                            prod.cantidad = cantidad;
                            existe = true;
                        }
                    }
                    if (!existe)
                        a.add(new producto(idProducto, idSucursal, cantidad));
                }
            objConn.rs.next();
        }
    objConn.desConnect();
%>
</head>
<body id="top">
<input type="hidden" id="idLogin" value="<%=idLogin%>">

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
                <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                <li onclick='show("pantalla", "pantalla"); show("login", "login")'><a href="#">Iniciar Sesión</a></li>
                <li><a href="registrarse.jsp">Registrarse</a></li>
        <%} else {%>
                <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                <%
                    if(tipoLogin.equals("NORMAL") || tipoLogin.equals("MAYORITARIO")){
                %>
                    <li id="username"> <a href="cliente.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}else if(tipoLogin.equals("ADMINISTRADOR")){%>
                    <li id="username">  <a href="administrador.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}else{%>
                    <li id="username"> <a href="vendedor.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}%>
                    <li><a href="cerrarSesion"><i class="fa fa-sign-out" style="font-size:1.8rem;"></i></a></li>
        <% }%>
      </ul>
    </div>
    <!-- ################################################################################################ -->
  </div>
</div>
<!-- Top Background Image Wrapper -->
<div class="bgded overlay">
  <section id="breadcrumb" class="hoc clear">
    <h6 class="heading"><center>Administración General</center></h6>
  </section>
</div>
<!-- End Top Background Image Wrapper -->

<div class="wrapper row3">
  <main class="hoc container clear">
    <!-- main body -->
    <div class="sidebar one_quarter first" style="margin-bottom: 25px;">
      <!-- ################################################################################################ -->
      <nav class="sdb_holder">
        <ul>
            <li> <b> Pasos </b>
                <br><br>
                <ul>
                      <li><a href="javascript:actualizaDivContenido(1);">Tipo de Envio</a></li>
                      <li><a href="javascript:actualizaDivContenido(2);">Forma de Pago</a></li>
                      <li><a href="javascript:actualizaDivContenido(3);">Confirmación de Compra</a></li>
                </ul>
            </li>
        </ul>
      </nav>

    </div>
    <div id="contenido" class="content one_half" style="margin-left: 50px; margin-bottom: 30px; width: 70%;">
      <!-- ################################################################################################ -->
    </div>
</main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row4 bgded overlay" style="background-image:url('images/demo/backgrounds/03.png');">
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
            <input onkeypress="validateEnter(event,email,this)" id="password" name="password" class="btmspace-15" type="password" value="" placeholder="Contraseña">
            <p align="right">
                <button onclick="checaLogin(email,password)">
                    &nbsp&nbsp&nbsp Ingresar &nbsp&nbsp&nbsp
                </button>
            </p>
        </fieldset>
    <!--/form-->    
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>