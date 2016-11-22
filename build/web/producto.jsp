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
<title>Dealers | Producto</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<!--<link rel="stylesheet" href="../layout/materialize/css/materialize.css">-->
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
%>
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
                <li><a href="#"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
                <li onclick='show("pantalla", "pantalla"); show("login", "login")'><a href="#">Iniciar Sesi�n</a></li>
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
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

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
      <h6>Categoría</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="#">Categoría 1</a></li>
          <li><a href="#">Categoría 2</a></li>
        </ul>
      </nav>

      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
    <div class="content three_quarter">
      <!-- ################################################################################################ -->
      <center><h1>Nombre del producto</h1></center>
      <div class="one_half first">


        <div id="productos" class="hoc clear">
          <!-- ################################################################################################ -->
          <div class="flexslider basicslider">
            <ul class="slides">
              <li>
                <article>
                  <img src='../images/cat01.png'>
                </article>
              </li>
              <li>
                <article>
                  <img src='../images/2.png'>
                </article>
              </li>
            </ul>

          </div>
          <!-- ################################################################################################ -->
        </div>


        <!--<img class="imgl borderedbox inspace-5" src="../images/logo2.png" alt="">-->
      </div>

      <div class="one_half">
        <div class="one_third first">
          <p align="right"><b>Clave:<br>Categoría:<br>Disponibles:<br>Precio:<br>Descripcion:</b></p>
        </div>
        <div class="two_third">
          <p align="justify">001<br>Telefonos<br>5<br>$2000<br>dsada sda  cdcsd fdsf sfsdf fds fdsfds fdsfds fdsf fdsfds dasdasdasdasdds</p>
          <div id=comments>

              <center>  <!--<button type="button"> Agregar al Carrito </button>-->
                  <input type="submit" name="btncarrito" value="Agregar al Carrito">
              </center>
            
          </div>
        </div>
      </div>
      <div class="clear"></div>
      <div id="comments">
        <br>
        <h2>Comentarios</h2>
        <ul>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
          <li>
            <article>
              <header>
                <figure class="avatar"><img src="../images/demo/avatar.png" alt=""></figure>
                <address>
                By <a href="#">A Name</a>
                </address>
                <time datetime="2045-04-06T08:15+00:00">Friday, 6<sup>th</sup> April 2045 @08:15:00</time>
              </header>
              <div class="comcont">
                <p>This is an example of a comment made on a post. You can either edit the comment, delete the comment or reply to the comment. Use this as a place to respond to the post or to share what you are thinking.</p>
              </div>
            </article>
          </li>
        </ul>
        <h2>Escribe un comentario</h2>
        <form action="#" method="post">
          <div class="block clear">
            <textarea name="comment" id="comment" cols="25" rows="10"></textarea>
          </div>
          <div>
            <input type="submit" name="submit" value="Enviar">
            &nbsp;
            <input type="reset" name="reset" value="Borrar">
          </div>
        </form>
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

<div id="pantalla" class="hide" onclick='hide("pantalla"); hide("login");'> </div>
<div id="login" class="hide">
    <form id="newsletter" method="post" action="#" name="iniciarsesion">
        <fieldset>
            <br><b><center>Ingresa tus datos</center></b>
            <i class="fa fa-user-o" style="font-size:1.8rem;"></i>
            <input class="btmspace-15" type="text" value="" placeholder="Correo">
            <input class="btmspace-15" type="password" value="" placeholder="Contrase�a">
            <p align="right">
                <button type="submit" value="submit">
                    &nbsp&nbsp&nbsp Ingresar &nbsp&nbsp&nbsp
                </button>
            </p>
        </fieldset>
    </form>    
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="../layout/scripts/jquery.min.js"></script>
<script src="../layout/scripts/jquery.backtotop.js"></script>
<script src="../layout/scripts/jquery.mobilemenu.js"></script>
<script src="../layout/scripts/jquery.flexslider-min.js"></script>
</body>
</html>
