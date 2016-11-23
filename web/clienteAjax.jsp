<%-- 
    Document   : actualizaContAjax
    Created on : 20-nov-2016, 20:54:23
    Author     : monic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <script src="layout/scripts/validaFormularios.js"></script>
    </head>
    <body>
        <%
            int opcion = Integer.parseInt(request.getParameter("op"));
            String idLogin = request.getParameter("idLogin");
            String consulta;
            int n;
            switch(opcion){
                case 1:
         %>
                    <fieldset id="newsletter">
                        <%
                            consulta = "select nombre, ap_paterno, ap_materno, telefono from usuario where idUsuario=?;";
                            String[] datos = {idLogin};
                            //Ejecutamos la consulta
                            objConn.safeConsult(consulta, datos);
                        %>
                      <input onchange='soloLetras(this)' id="nombre" name="nombre" class="btmspace-15" type="text" value="<%=objConn.rs.getString(1)%>" placeholder="Nombre" disabled>
                      <section class="one_half first">
                        <input onchange='soloLetras(this)' id="appat" name="appat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Apellido Paterno" disabled>
                      </section>
                      <section class="one_half">
                        <input onchange='soloLetras(this)' id="apmat" name="apmat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Apellido Materno" disabled>
                      </section>
                      <input onchange='soloNumeros(this)' id="telefono" name="telefono" class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Teléfono" disabled>
                      <p align="center">
                          <button type="button" onclick='habilitar(nombre,appat,apmat,telefono)' style="background-color: #23B8C1"><div id="txtbtn">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</div></button>
                      </p>
                    </fieldset>
        <%
                break;
            
                case 2:
        %>
                    <form id="newsletter" method="post" action="#">
                        <fieldset>
                            <center><div id='msjPass'></div></center><br>
                          <input name="passActual" class="btmspace-15" type="password" value="" placeholder="Contraseña Actual" onchange='checaPassActual(this)'>
                          <input name="password1" class="btmspace-15" type="password" value="" placeholder="Nueva Contraseña" onchange='noVacio(this)'>
                          <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange='checaPass(password1,this)'>
                          <p align="center">
                            <button type="button" onclick='guardaNuevoPass(passActual,password1,password2)' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Guardar &nbsp&nbsp&nbsp</button>
                          </p>
                        </fieldset>
                    </form>
        <%
                break;
                
                case 3:
                %>  <form id="newsletter">
                        <div class="one_half first direcciones">
                            <b>Casa</b><br>
                            Cieneguillas 505 <br>
                            Ojocaliente II <br>
                            Tel. 4499993467 <br>
                            Aguascalientes, México <br>
                            20196
                            <p align="right"> <a href="#"> Editar </a> </p>
                        </div>
                        <div class="one_half direcciones">
                            <b>Trabajo</b><br>
                            Cieneguillas 505 <br>
                            Ojocaliente II <br>
                            Tel. 4499993467 <br>
                            Aguascalientes, México <br>
                            20196
                            <p align="right"> <a href="#"> Editar </a> </p> 
                        </div>

                        <div class="clear"></div>
                        <br>
                        <p align="center">
                            <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar Dirección &nbsp&nbsp&nbsp</button>
                        </p>
                    </form>
        <%
                break;
                
                case 4:
        %>
                    Holaaa
        <%
                break;
                
                case 5:
        %>
                    Holaaa
        <%
                break;
            }
        %>      
        
    </body>
</html>
