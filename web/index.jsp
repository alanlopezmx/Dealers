
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page import="mysqlpackage.producto"%>
<%@page import="java.sql.Blob"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<jsp:useBean id="objConn7" class="mysqlpackage.MySqlConn"/>

<%!
    public double decimal(String precio, double x) {
        return Double.parseDouble(new DecimalFormat("##.##").format(Integer.parseInt(precio) * x));
    }
%>

<%
    String nombreLogin="";
    String idLogin="";
    String tipoLogin="";
    ArrayList<producto> a = null;
    double x = 1;
    if(session.getAttribute("nombre") != null){
        a = (ArrayList<producto>) session.getAttribute("carrito");
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
            function busqueda() {
                var busqueda = $('#busqtext').val();
                $.ajax({
                    type: 'POST',
                    url: 'busqajax.jsp',
                    data: {
                        busqueda: busqueda,
                    },
                    success: function (respuesta) {
                        $('#busq').html(respuesta);
                    },
                    async: false
                });
            }

            window.onload = function () {
                $('#busqtext').on('change textInput input', busqueda);
            }

        </script>
    </head>
    <body id="top">
        <div class="busqueda" id="busq"></div>
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
                            <input type="email" value="" id="busqtext" placeholder="Busca Aqui&hellip;">
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
                        <li onclick='show("sombra", "sombra"); show("carrito", "carrito")'><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                        <li id="username"> <a href="cliente.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                            <%}else if(tipoLogin.equals("ADMINISTRADOR")){%>
                        <li id="username"> <a href="administrador.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                            <%}else{%>
                        <li onclick='show("sombra", "sombra"); show("carrito", "carrito")'><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
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
        <div class="wrapper row4 bgded overlay">
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
                <input onkeypress="validateEnter(event, email, this)" id="password" name="password" class="btmspace-15" type="password" value="" placeholder="Contraseña">
                <p align="right">
                    <button onclick="checaLogin(email, password)">
                        &nbsp&nbsp&nbsp Ingresar &nbsp&nbsp&nbsp
                    </button>
                </p>
            </fieldset>
            <!--/form-->    
        </div>
        
                <% if(session.getAttribute("nombre") != null){ %>


        <div id="carrito" class="wrapper row3 hide">
            <br>
            <div style="margin: 0 auto; width: 25%;"> <img src="images/carrito.PNG" alt=""> </div>
            <br>
            <div class="content" style="margin: 0px;"> 
                    <%
                        for (producto prod : a) {
                            consulta = "select * from carrito where idProducto = " + prod.idProducto + " and idSucursal = " + prod.idSucursal + ";";
                            objConn7.Consult(consulta);
                            int nProd = 0;
                            if (objConn7.rs != null) {
                                try {
                                    objConn7.rs.last();
                                    nProd = objConn7.rs.getRow();
                                    objConn7.rs.first();
                                } catch (Exception e) {
                                }
                            }
                            if (nProd > 0) {
                    %>  
                    <div class="group btmspace-15 demo">
                        <div class="one_quarter first">
                            <div class="contenedor">
                                <%out.print("<img src='returnImagen.jsp?idImagen=" + objConn7.rs.getString(2) + "' alt=''>");%>
                            </div>
                        </div>
                        <div class="one_half" style="color: #000000; margin: 0px;">
                            <h2> <%out.print(objConn7.rs.getString(3));%> </h2>
                            <b>Descripción: </b> <%out.print(objConn7.rs.getString(4));%>
                            <br><b>Disponibilidad: </b> <%out.print(objConn7.rs.getString(7));%>
                            <br><b>Sucursal: </b> <%out.print(objConn7.rs.getString(6));%>
                        </div>
                        <div class="one_quarter" style="margin: 0px; width: 25%">
                            <div class="two_third first" style="color: #000000;">
                                <br><br><br>
                                <i class="fa fa-minus-circle one_quarter" onclick='sub2(<%out.print("cant2" + prod.idProducto + "_" + prod.idSucursal + "," + prod.idProducto + "," + prod.idSucursal);%>)' style="font-size:1.8rem;width: 30%;cursor: pointer;"></i>
                                <input id="cant2<%out.print(prod.idProducto + "_" + prod.idSucursal);%>" class="btmspace-15 one_third" type="text" value="<%out.print(prod.cantidad);%>" style="width: 25%; text-align: center;" name="cant2<%out.print(prod.idProducto + "_" + prod.idSucursal);%>" onchange="actualizacarrito(<%out.print(prod.idProducto + "," + prod.idSucursal + "," + prod.cantidad);%>)">
                                <i class="fa fa-plus-circle one_quarter" onclick='add2(<%out.print("cant2" + prod.idProducto + "_" + prod.idSucursal + "," + prod.idProducto + "," + prod.idSucursal + "," + objConn7.rs.getString(7));%>)' style="font-size:1.8rem; width: 30%;margin-left: 5px;cursor: pointer;"></i>
                            </div>
                            <div class="one_third" style="color: #000000;">
                                <b>Precio: </b><br> $<%out.print(decimal(objConn7.rs.getString(8), x));%>
                                <br><br><b>Subtotal: </b><br> $<%out.print(decimal(objConn7.rs.getString(8), x) * prod.cantidad);%>
                            </div>
                        </div>
                    </div>
                    <hr class="style-two">
                    <%    }
                        }
                    %> 
                    <div id="newsletter" class="fl_right">
                        <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Realizar Compra &nbsp&nbsp&nbsp</button>
                    </div>
                
            </div>
        </div>
                    <%}%>
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
