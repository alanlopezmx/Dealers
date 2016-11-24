<!DOCTYPE html>

<html>
    <head>
        <title>Dealers | Administrador</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

        <script type="text/javascript" language="JavaScript">
            function actualizaDivContenido(op) {
                var idLogin = $('#idLogin').val();
                $.post('adminAjax.jsp', {
                    op: op,
                    idLogin: idLogin,
                }, function (responseText) {
                    $('#contenido').html(responseText);
                    switch (op) {
                        case 1:
                            document.altaproducto.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario(this);
                            });
                            break;

                        case 3:
                            document.altacategoria.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario(this);
                            });
                            break;
                        case 5:
                            document.altacliente.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario(this);
                            });
                            break;
                        case 7:
                            document.altaproveedor.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario(this);
                            });
                            break;
                        case 9:
                            document.altaadministrador.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario(this);
                            });
                            break;
                        case 11:
                            document.altapromocion.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario(this);
                            });

                    }
                });
            }

            window.onload = function () {
                actualizaDivContenido(1);
            }
        </script>
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
            if (!tipoLogin.equals("ADMINISTRADOR")) {
        %>
        <jsp:forward page="index.jsp"/>
        <%
            }
        %>
    </head>
    <body id="top">
        <input type="hidden" id="idLogin" value="<%=idLogin%>">
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
                        <% if (nombreLogin.equals("")) { %>
                        <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                        <li onclick='show("pantalla", "pantalla"); show("login", "login")'><a href="#">Iniciar Sesión</a></li>
                        <li><a href="registrarse.jsp">Registrarse</a></li>
                            <%} else{%>
                        <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                                <%
                                    if (tipoLogin.equals("NORMAL") || tipoLogin.equals("MAYORITARIO")) {
                                %>
                        <li id="username"> <a href="cliente.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                            <%} else if (tipoLogin.equals("ADMINISTRADOR")) {%>
                        <li id="username">  <a href="administrador.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                            <%} else {%>
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
                <h6 class="heading"><center>Administración General</center></h6>
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
                <div class="sidebar one_quarter first" style="margin-bottom: 25px">
                    <!-- ################################################################################################ -->
                    <nav class="sdb_holder">
                        <ul>
                            <li> <b> Producto </b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(1);">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(2);">Modificar / Eliminar</a></li>
                                    <li><a href="javascript:actualizaDivContenido(11);">Agregar Promoción</a></li>
                                </ul>
                            </li>
                            <li> <br> <b> Categoria </b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(3);">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(4);">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
                            <li> <br> <b>Clientes</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(5);">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(6);">Modificar / Eliminar</a></li>
                                </ul>
                            </li>   
                            <li> <br> <b>Proveedores</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(7);">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(8);">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
                            <li><br> <b>Administradores</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(9);">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(10);">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
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