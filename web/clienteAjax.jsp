<%-- 
    Document   : actualizaContAjax
    Created on : 20-nov-2016, 20:54:23
    Author     : monic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    </head>
    <body>
        <%
            int opcion = Integer.parseInt(request.getParameter("op"));
            switch(opcion){
                case 1:
        %>
                      <form id="newsletter" method="post" action="#">
                        <fieldset>
                          <input class="btmspace-15" type="text" value="Mónica Fabiola" placeholder="Nombre" disabled>
                          <section class="one_half first">
                            <input class="btmspace-15" type="text" value="Montañez" placeholder="Apellido Paterno" disabled>
                          </section>
                          <section class="one_half">
                            <input class="btmspace-15" type="text" value="Briano" placeholder="Apellido Materno" disabled>
                          </section>
                          <input class="btmspace-15" type="text" value="4499700470" placeholder="Teléfono" disabled>
                          <p align="center">
                            <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button>
                          </p>
                        </fieldset>
                      </form>
        <%
                break;
            
                case 2:
        %>
                    <form id="newsletter" method="post" action="#">
                        <fieldset>
                          <input class="btmspace-15" type="text" value="" placeholder="Contraseña Actual">
                          <input class="btmspace-15" type="text" value="" placeholder="Nueva Contraseña">
                          <input class="btmspace-15" type="text" value="" placeholder="Confirmar Contraseña">
                          <p align="center">
                            <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Guardar &nbsp&nbsp&nbsp</button>
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
