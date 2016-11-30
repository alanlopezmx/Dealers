<!DOCTYPE html>

<html>
    <head>
        <title>Dealers | <%=(String) session.getAttribute("tipo")%></title>
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

            function actualizaDivContenido(op) {
                $.post('adminAjax.jsp', {
                    op: op,
                }, function (responseText) {
                    $('#contenido').html(responseText);
                    switch (op) {
                        case 1:
                            document.altaproducto.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario3(this);
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
                            break;
                        case 12:
                            document.altasucursal.addEventListener('submit', function (event) {
                                event.preventDefault();
                                validarFormulario(this);
                            });
                            break;

                    }
                });
            }

            window.onload = function () {
                actualizaDivContenido(5);
                $('#busqtext').on('change textInput input', busqueda);
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
            if (!tipoLogin.equals("ADMINISTRADOR") && !tipoLogin.equals("VENDEDOR")) {
        %>
        <jsp:forward page="index.jsp"/>
        <%
            }
        %>
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
                        <% if (nombreLogin.equals("")) { %>
                        <li><i style="font-style: #23B8C1; font-size:1.8rem;"></i></li>
                        <li onclick='show("pantalla", "pantalla"); show("login", "login")'><a href="#">Iniciar Sesión</a></li>
                        <li><a href="registrarse.jsp">Registrarse</a></li>
                            <%} else{%>
                                <%
                                    if (tipoLogin.equals("NORMAL") || tipoLogin.equals("MAYORITARIO")) {
                                %>
                        <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                        <li id="username"> <a href="cliente.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                            <%} else if (tipoLogin.equals("ADMINISTRADOR") || tipoLogin.equals("VENDEDOR")) {%>
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
                <div class="sidebar one_quarter first" style="margin-bottom: 25px;">
                    <!-- ################################################################################################ -->
                    <nav class="sdb_holder">
                        <ul>
                            <li> <b>Clientes</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(5);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(6);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
                            <%if (tipoLogin.equals("ADMINISTRADOR")) {%>
                            <li> <br> <b> Producto </b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(1);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(2);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar / Eliminar</a></li>
                                    <li><a href="javascript:actualizaDivContenido(11);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Agregar Promoción</a></li>
                                </ul>
                            </li>
                            <li> <br> <b> Categoria </b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(3);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(4);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
                            
                            <%}%>
                            <li><br> <b>Ventas</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(19);" onclick="$('#contenido').removeClass('one_half'); $('#contenido').removeClass('añadeMargen'); $('#contenido').addClass('three_quarter');">Ver Pedidos</a></li>
                                    <li><a href="javascript:actualizaDivContenido(16);" onclick="$('#contenido').removeClass('one_half'); $('#contenido').removeClass('añadeMargen'); $('#contenido').addClass('three_quarter');">Historial de Ventas</a></li>
                                </ul>
                            </li>
                            <%
                            if (tipoLogin.equals("VENDEDOR")) {%>
                              
                            <li><br> <b>Información Personal</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(14);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Datos Personales</a></li>
                                    <li><a href="javascript:actualizaDivContenido(15);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar Contraseña</a></li>
                                </ul>
                            </li>
                            <%}%>
                            
                            <%if (tipoLogin.equals("ADMINISTRADOR")) {%>
                            <li> <br> <b>Vendedores</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(17);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(18);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
                            <li> <br> <b>Proveedores</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(7);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(8);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar / Eliminar</a></li>
                                    <li><a href="javascript:actualizaDivContenido(20);" onclick="$('#contenido').removeClass('one_half'); $('#contenido').removeClass('añadeMargen'); $('#contenido').addClass('three_quarter');">Realizar Pedido</a></li>
                                    <li><a href="javascript:actualizaDivContenido(21);" onclick="$('#contenido').removeClass('one_half'); $('#contenido').removeClass('añadeMargen'); $('#contenido').addClass('three_quarter');">Historial de Compras</a></li>
                                </ul>
                            </li>
                            <li><br> <b>Administradores</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(9);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(10);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
                            <li><br> <b>Sucursales</b>
                                <ul>
                                    <li><a href="javascript:actualizaDivContenido(12);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Alta</a></li>
                                    <li><a href="javascript:actualizaDivContenido(13);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar / Eliminar</a></li>
                                </ul>
                            </li>
                           <%}%>
                        </ul>
                    </nav>

                </div>

                <!-- ################################################################################################ -->
                <!-- ################################################################################################ -->
                <div id="contenido" class="content one_half añadeMargen">
                    <!-- ################################################################################################ -->

                </div>
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