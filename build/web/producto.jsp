<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="mysqlpackage.MySqlConn"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Dealers | Producto</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <script type="text/javascript" src="layout/scripts/validaFormularios.js"></script>
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
        <style>
            div.stars {
                float: right;
                width: 270px;
                display: inline-block;
            }

            input.star { display: none; }

            label.star {
                float: right;
                padding: 10px;
                font-size: 25px;
                color: #444;
                transition: all .2s;
            }

            input.star:checked ~ label.star:before {
                content: '\f005';
                color: #FD4;
                transition: all .25s;
            }

            input.star-5:checked ~ label.star:before {
                color: #FE7;
                text-shadow: 0 0 20px #952;
            }

            input.star-1:checked ~ label.star:before { color: #F62; }

            label.star:hover { transform: rotate(-15deg) scale(1.3); }

            label.star:before {
                content: '\f006';
                font-family: FontAwesome;
            }
        </style>
    </head>
    <%
        String nombreLogin = "";
        String idLogin = "";
        String tipoLogin = "";
        String msjerror = "";
        if (session.getAttribute("nombre") != null) {
            nombreLogin = (String) session.getAttribute("nombre");
            idLogin = (String) session.getAttribute("id");
            tipoLogin = (String) session.getAttribute("tipo");
        }
    %>
    <body id="top">
        <div class="busqueda" id="busq"></div>
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
                        <% if (nombreLogin.equals("")) { %>
                        <li onclick='show("sombra", "sombra"); show("carrito", "carrito wrapper row3")'>
                        <li><i style="font-style: #23B8C1; font-size:1.8rem;"></i></li>
                        <li onclick='show("pantalla", "pantalla"); show("login", "login")'><a href="#">Iniciar Sesión</a></li>
                        <li><a href="registrarse.jsp">Registrarse</a></li>
                            <%} else{%>
                        <li onclick='show("sombra", "sombra"); show("carrito", "carrito")'>
                                <%
                                    if (tipoLogin.equals("NORMAL") || tipoLogin.equals("MAYORITARIO")) {
                                        ;            %>
                        <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                        <li id="username"> <a href="cliente.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                            <%} else if (tipoLogin.equals("ADMINISTRADOR")) {%>
                        <li id="username">  <a href="administrador.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                            <%} else {%>
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
        <!-- ################################################################################################ -->
        <%
            int idproducto = Integer.parseInt(request.getParameter("idproducto"));
            String consulta = "select nombre, Categoria_idCategoria, precio_venta, descripcion_larga "
                    + "from producto where idProducto=" + idproducto + ";";
            MySqlConn objConn = new MySqlConn();
            MySqlConn objConn1 = new MySqlConn();
            MySqlConn objConn2 = new MySqlConn();
            MySqlConn objConn3 = new MySqlConn();
            MySqlConn objConn4 = new MySqlConn();
            MySqlConn objConn5 = new MySqlConn();
            MySqlConn objConn6 = new MySqlConn();
            objConn.Consult(consulta);
            int n = 0, n1 = 0, n2 = 0, n3 = 0;
            if (objConn.rs != null) {
                try {
                    objConn.rs.last();
                    n = objConn.rs.getRow();
                    objConn.rs.first();
                } catch (Exception e) {
                }
            }
            if (n > 0) {
                //Para la categoria
                String categoria = "select categoria.nombre from categoria, producto "
                        + "where idProducto=" + idproducto
                        + " and idCategoria = " + objConn.rs.getString(2) + ";";
                objConn1.Consult(categoria);

                //Para la cantidad
                String disponibles = "select sum(cantidad) from producto_has_sucursal "
                        + "where Producto_idProducto=" + idproducto + ";";
                objConn2.Consult(disponibles);

                //Para la imagen
                String consulta1 = "select idImagen from imagen where Producto_idProducto=" + idproducto + ";";
                objConn3.Consult(consulta1);
                if (objConn3.rs != null) {
                    try {
                        objConn3.rs.last();
                        n1 = objConn3.rs.getRow();
                        objConn3.rs.first();
                    } catch (Exception e) {
                    }
                }
            }
        %>
        <div class="wrapper row3">
            <main class="hoc container clear">
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="sidebar one_quarter first" style="margin-bottom: 25px">
                    <h6>Categor&iacute;as</h6>
                    <nav class="sdb_holder">
                        <ul>
                            <%
                                String nomcat = "select nombre, idCategoria from categoria;";
                                objConn6.Consult(nomcat);
                                if (objConn6.rs != null) {
                                    try {
                                        objConn6.rs.last();
                                        n3 = objConn6.rs.getRow();
                                        objConn6.rs.first();
                                    } catch (Exception e) {
                                    }
                                }
                                for (int i = 0; i < n3; i++) {
                                    out.print("<li><a href='productos.jsp?idcategoria=" + objConn6.rs.getString(2) + "'>" + objConn6.rs.getString(1) + "</a></li>");
                                    objConn6.rs.next();
                                }
                            %>
                        </ul>
                    </nav>
                </div>
                <!-- ################################################################################################ -->
                <!-- ################################################################################################ -->
                <div class="content three_quarter">
                    <!-- ################################################################################################ -->
                    <center><h1><%out.print(objConn.rs.getString(1));%></h1></center>
                    <div class="one_half first">
                        <div id="productos" class="hoc clear">
                            <!-- ################################################################################################ -->
                            <div class="flexslider basicslider">
                                <ul class="slides">
                                    <%
                                        for (int i = 0; i < n1; i++) {
                                            out.println("<li><article><a href='#'><img src='returnImagen.jsp?idImagen=" + objConn3.rs.getString(1) + "' alt=''></a></article></li>");
                                            objConn3.rs.next();
                                        }
                                    %>
                                </ul>
                            </div>
                            <!-- ################################################################################################ -->
                        </div>


                        <!--<img class="imgl borderedbox inspace-5" src="../images/logo2.png" alt="">-->
                    </div>

                    <div class="one_half">
                        <div class="one_third first">
                            <p align="right">
                                <b>Clave:
                                    <br>Categor&iacute;a:
                                    <br>Disponibles:
                                    <br>Precio:
                                    <br>Descripci&oacute;n:
                                </b>
                            </p>
                        </div>
                        <div class="two_third">
                            <p align="justify">
                                <%out.print(idproducto);%>
                                <br><%out.print(objConn1.rs.getString(1));%>
                                <br><%out.print(objConn2.rs.getString(1));%>
                                <br>$<%out.print(objConn.rs.getString(3));%>
                                <br><%out.print(objConn.rs.getString(4));%>
                            </p>
                            <div id=comments>
                                <center>  <!--<button type="button"> Agregar al Carrito </button>-->
                                    <input type="submit" name="btncarrito" value="Agregar al Carrito" onclick='show("sombra", "sombra"); show("agregar", "agregar");' >
                                </center>
                            </div>
                        </div>
                    </div>

                    <div class="clear"></div>
                    <div id="comments">
                        <br>
                        <h2>Comentarios</h2>
                        <ul>
                            <%
                                //Para los comentarios
                                //Comentarios
                                String consulta3 = "select * from comentario "
                                        + "where Producto_idProducto =" + idproducto + ";";
                                objConn5.Consult(consulta3);
                                if (objConn5.rs != null) {
                                    try {
                                        objConn5.rs.last();
                                        n2 = objConn5.rs.getRow();
                                        objConn5.rs.first();
                                    } catch (Exception e) {
                                    }
                                }
                                String aux = "";
                                for (int i = 0; i < n2; i++) {
                                    ////Nombre de usuario
                                    String consulta2 = "select nombre, ap_paterno, ap_materno from usuario, comentario "
                                            + "where idComentario=" + objConn5.rs.getString(1)
                                            + " and idUsuario = " + objConn5.rs.getString(6) + ";";
                                    objConn4.Consult(consulta2);
                                    if (objConn4.rs.getString(3) != null) {
                                        aux = objConn4.rs.getString(3);
                                    } else {
                                        aux = "";
                                    }
                                    ////
                                    String estrellas = "";
                                    for (int p = 0; p < 5; p++) {
                                        if (p < Integer.parseInt(objConn5.rs.getString(4))) {
                                            estrellas += "<spam class='fa fa-star' style='font-size:1rem;'></spam>";
                                        } else {
                                            estrellas += "<spam class='fa fa-star-o' style='font-size:1rem;'></spam>";
                                        }
                                    }
                                    out.println(""
                                            + "<li>"
                                            + "<article>"
                                            + "<header>"
                                            + "<figure class='avatar'><img src='images/avatar.png' alt=''></figure>"
                                            + "<address>  Por <a href='' onclick='return false;'> " + objConn4.rs.getString(1) + " " + objConn4.rs.getString(2) + " " + aux + " </a></address>"
                                            + "<time datetime='2045-04-06T08:15+00:00'>" + objConn5.rs.getString(2) + "</time>"
                                            + "</header>"
                                            + "<div class='comcont'>"
                                            + "<p><b>Calificación: </b>" + estrellas + "</p>"
                                            + "<p>" + objConn5.rs.getString(3) + "</p>"
                                            + "</div>"
                                            + "</article>"
                                            + "</li>");
                                    objConn5.rs.next();
                                }
                            %>
                        </ul>
                        <%
                            if (session.getAttribute("nombre") != null) {
                        %>
                        <h2>Escribe un comentario</h2>
                        <form action="insertComment.jsp?idProducto=<%out.print(idproducto);%>" method="post" name="insertComment">
                            <div class="block clear">
                                <textarea required name="comentario" id="comment" cols="25" rows="10"></textarea>
                            </div>
                            <div class="one_half first">
                                <input type="submit" name="submit" value="Enviar">
                                &nbsp;
                                <input type="reset" name="reset" value="Borrar">
                            </div>
                            <div class="stars one_half">
                                <input class="star star-5" id="star-5" type="radio" name="star" value="5"/>
                                <label class="star star-5" for="star-5"></label>
                                <input class="star star-4" id="star-4" type="radio" name="star" value="4"/>
                                <label class="star star-4" for="star-4"></label>
                                <input checked class="star star-3" id="star-3" type="radio" name="star" value="3"/>
                                <label class="star star-3" for="star-3"></label>
                                <input class="star star-2" id="star-2" type="radio" name="star" value="2"/>
                                <label class="star star-2" for="star-2"></label>
                                <input class="star star-1" id="star-1" type="radio" name="star" value="1"/>
                                <label class="star star-1" for="star-1"></label>
                            </div>
                        </form>
                        <%
                            }
                            objConn.desConnect();
                        %>

                    </div>
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
                <input id="password" onkeypress="validateEnter(event, email, this)" name="password" class="btmspace-15" type="password" value="" placeholder="Contraseña">
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

        <div id="sombra" class="hide" onclick='hide("sombra"); hide("agregar"); hide("carrito");'></div>
        <div id="agregar" class="hide">
            <div style="margin: 0 auto; width: 65%;"> <img src="images/addcarrito.PNG" alt=""> </div>
            <br>
            <div class="sucursal">
                <div class="three_quarter first" style="text-align: left">
                    <h2>Nombre Sucursal</h2>
                    <b>Domicilio</b>
                    <br>
                    Calle
                </div>
                <div class="one_quarter fl_right" style="margin: auto;">
                    <b>Disponibles: </b> 
                    <br><br>
                    <i class="fa fa-minus-circle one_quarter" onclick='sub()' style="font-size:1.8rem;width: 30%"></i>
                    <input id="cantidad" class="btmspace-15 one_third" type="text" value=1 style="width: 20%; text-align: center;">
                    <i class="fa fa-plus-circle one_quarter" onclick='add()' style="font-size:1.8rem; width: 30%;margin-left: 10px;"></i>
                </div>
            </div>


            <div id="newsletter" class="fl_right" style="margin-top: 40px;" >    
                <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Comprar &nbsp&nbsp&nbsp</button>
            </div>
            <div id="newsletter" class="fl_right"style="margin-right: 20px;margin-top: 40px;">
                <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
            </div>

        </div>

        <div id="carrito" class="wrapper row3 hide">
            <div class="content" style="margin: 0px;"> 
                <br>
                <div style="margin: 0 auto; width: 25%;"> <img src="images/carrito.PNG" alt=""> </div>
                <br>
                <div class="group btmspace-50 demo">
                    <div class="one_quarter first">
                        <div class="contenedor">
                            <figure class="avatar"><img src="images/5_2.png" alt=""></figure>
                        </div>
                    </div>
                    <div class="one_half" style="color: #000000; margin: 0px;">
                        <h2> Nombre </h2>
                        <b>Descripción: </b> El articulo fabricado con la mas alta calidad en dispositivos electronicos.
                        <br><b>Disponibilidad: </b> 6
                        <br><b>Sucursal: </b> Ojo Caliente
                    </div>
                    <div class="one_quarter" style="margin: 0px; width: 25%">
                        <div class="two_third first" style="color: #000000;">
                            <br><br><br>
                            <i class="fa fa-minus-circle fl_left" onclick='sub()' style="font-size:1.8rem;width: 30%"></i>
                            <input id="cantidad" class="btmspace-15 fl_left" type="text" value=1 style="width: 20%; text-align: center;">
                            <i class="fa fa-plus-circle fl_left" onclick='add()' style="font-size:1.8rem; width: 30%"></i>
                        </div>
                        <div class="one_third" style="color: #000000;">
                            <b>Precio: </b><br> $1290.00
                            <br><br><b>Subtotal: </b><br> $1290.00
                        </div>
                    </div>
                </div>
                <div id="newsletter" class="fl_right">
                    <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Realizar Compra &nbsp&nbsp&nbsp</button>
                </div>
            </div>
        </div>
        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>
    </body>
</html>
