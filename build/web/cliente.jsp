<!DOCTYPE html>

<html>
<head>
<title>Dealers | Cliente</title>
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
<script type="text/javascript" language="JavaScript">    
    function actualizaDivContenido(op){
        var idLogin = $('#idLogin').val();
        $.post('clienteAjax.jsp', {
                op : op,
                idLogin: idLogin,
        }, function(responseText) {
                $('#contenido').html(responseText);
                switch (op){
                case 3:
                    document.altadireccion.addEventListener('submit', function(event){
                        event.preventDefault();
                        validarFormulario(this);
                    });
                    break;
                    
                case 4:
                    document.altaTarjeta.addEventListener('submit', function(event){
                        event.preventDefault();
                        validarFormulario(this);
                    });
                    break;
            }
        });
    }
    
    window.onload = function () {
        actualizaDivContenido(1);
    }
           
</script>

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
    if(!tipoLogin.equals("NORMAL") && !tipoLogin.equals("MAYORITARIO")){
        %>
        <jsp:forward page="index.jsp"/>
        <%
    }
%>
<body id="top">
    <div class="busqueda" id="busq"></div>
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
                    <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                    <li id="username"> <a href="cliente.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
                <%}else if(tipoLogin.equals("ADMINISTRADOR")){%>
                    <li id="username">  <a href="administrador.jsp"> Bienvenido <%out.print(nombreLogin);%></a></li>
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
    <div class="sidebar one_quarter first" style="margin-bottom: 25px">
      <!-- ################################################################################################ -->
      <nav class="sdb_holder">
        <ul>
          <li><a href="javascript:actualizaDivContenido(1);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Datos Personales</a></li>
          <li><a href="javascript:actualizaDivContenido(2);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Modificar Contraseña</a></li>
          <li><a href="javascript:actualizaDivContenido(3);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Direcciones</a></li>
          <li><a href="javascript:actualizaDivContenido(4);" onclick="$('#contenido').removeClass('three_quarter'); $('#contenido').addClass('one_half'); $('#contenido').addClass('añadeMargen');">Tarjetas</a></li>
          <li><a href="javascript:actualizaDivContenido(5);" onclick="$('#contenido').removeClass('one_half'); $('#contenido').removeClass('añadeMargen'); $('#contenido').addClass('three_quarter');">Historial de Compras</a></li>
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
