<%-- 
    Document   : registrarse
    Created on : 20-nov-2016, 20:29:32
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Dealers | Registro</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

    <script type="text/javascript">
        window.onload = function () {
        document.registro.addEventListener('submit', function(event){
                    event.preventDefault();
                    validarFormulario(this);
                });
            }
            

        
    </script>
</head>
<body>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
    <div class="wrapper row0">
      <div id="topbar" class="hoc clear">
        <div class="fl_left imglogo">
          <a href="index.jsp"> <img src="images/logo3.png"> </a>
        </div>
      </div>
    </div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
    <div class="hoc container">
      <div class="one_half first">
          <img src="images/connect.png">
      </div>
      <div class="one_half">
        <div class="row">
            <% if(request.getParameter("mensaje")!=null)
                out.println(request.getParameter("mensaje"));
            %>
          <form name="registro" method="post" action="insertUser.jsp">
            <fieldset id="newsletter">
              <br>
              <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa tus datos para el registro</b>
              <br>
              <br>
              <input name ="nombre" class="btmspace-15" type="text"value="" placeholder="Nombre" onchange='soloLetras(this)'>
              <section class="one_half first">
                <input name="appat" class="btmspace-15" type="text" value="" placeholder="Apellido Paterno" onchange='soloLetras(this)'>
              </section>
              <section class="one_half">
                <input name="apmat" class="btmspace-15" type="text" value="" placeholder="Apellido Materno" onchange='soloLetrasyNull(this)'>
              </section>
              <input name="telefono" class="btmspace-15" type="text" value="" placeholder="Teléfono" onchange='soloNumeros(this)'>
              <input name="email" class="btmspace-15" type="text" value="" placeholder="Email" onchange='validaCorreo(this)' >
              <section class="one_half first">
                <input name="password1" class="btmspace-15" type="password" value="" placeholder="Password" onchange='noVacio(this)'>
              </section>  
              <section class="one_half">
                  <input name="password2" class="btmspace-15" type="password" value="" placeholder="Re-Password" onchange='checaPass(password1,this)'>
              </section>
              <br><br>
              <p align="right">
                <button type="submit" value="submit">&nbsp&nbsp&nbsp Registrarse &nbsp&nbsp&nbsp</button>
              </p>
              </fieldset>
          </form>
        </div>
      </div>
    </div>
        
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
<script src="layout/scripts/jquery.flexslider-min.js"></script>
<script src="layout/scripts/validaFormularios.js"></script>
</body>

</html>
