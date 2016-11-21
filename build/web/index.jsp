
<%@page import="java.sql.Blob"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
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
      <img src="images/logo3.png">
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
        <% if(session.getAttribute("") == null){ %>
        <li><a href="index.html"><i class="fa fa-shopping-cart" style="font-size:1.8rem;"></i></a></li>
        <li><a href="uploadCategoria.jsp">Iniciar Sesión</a></li>
        <li><a href="registrarse.jsp">Registrarse</a></li>
        <%}%>
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
                out.println("<li><article><a href='#'><img src='returnPromo.jsp?idImagen=" + objConn.rs.getString(1) + "' alt=''></a></article></li>");
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
            <img src="images/cat.png" alt="">
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
                        out.println("<li class='one_quarter first'><a href='#'><img src='returnImage.jsp?idCategoria=" + objConn.rs.getString(1) + "' alt=''></a></li>");
                        cont = 0;
                    }
                    else{
                        out.println("<li class='one_quarter'><a href='#'><img src='returnImage.jsp?idCategoria=" + objConn.rs.getString(1) + "' alt=''></a></li>");
                    }
                    objConn.rs.next();
                    cont++;
                }
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
