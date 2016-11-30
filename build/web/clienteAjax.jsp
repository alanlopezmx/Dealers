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
            switch (opcion) {
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
                <button type="button" onclick='habilitar(nombre, appat, apmat, telefono)' style="background-color: #23B8C1"><div id="txtbtn">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</div></button>
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
                <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange='checaPass(password1, this)'>
                <p align="center">
                    <button type="button" onclick='guardaNuevoPass(passActual, password1, password2)' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Guardar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                break;

            case 3:
        %>  <fieldset id="newsletter">
            <%
                consulta = "select * from domicilio where Usuario_idUsuario=" + idLogin + ";";
                objConn.Consult(consulta);
                n = 0;
                if (objConn.rs != null) {
                    try {
                        objConn.rs.last();
                        n = objConn.rs.getRow();
                        objConn.rs.first();
                    } catch (Exception e) {
                    }
                }
                for (int i = 0; i < n; i++) {
                    if (i % 2 == 0) {
                        out.print("<div class='one_half first direcciones'>");
                    } else {
                        out.print("<div class='one_half direcciones'>");
                    }
                    out.print("<div class='tachita'><a onclick='ConfirmEliminarDir(" + objConn.rs.getString(1) + ")'> <i class='fa fa-trash'></i></a></div>");
                    out.print("<b>" + objConn.rs.getString(3) + "</b><br>"
                            + objConn.rs.getString(4) + " " + objConn.rs.getString(5) + " <br>"
                            + objConn.rs.getString(6) + " <br>"
                            + objConn.rs.getString(7) + " <br>"
                            + objConn.rs.getString(8) + " <br>"
                            + objConn.rs.getString(9)
                            + "<p align='right'> <a onclick=\"llenaCampos(" + objConn.rs.getString(1) + "); show('modificaDir','modificaDir'); show('sombra','sombra');\"> Editar </a> </p>"
                            + "</div>");
                    objConn.rs.next();
                }
            %>
            <!--llenaCampos(" + objConn.rs.getString(1) + ");-->
            <div class="clear"></div>
            <br>
            <p align="center">
                <button onclick='show("sombra", "sombra"); show("nuevadir", "nuevadir"); ' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar Dirección &nbsp&nbsp&nbsp</button>
            </p>
        </fieldset>
        <div id="sombra" class="hide" onclick='hide("sombra"); hide("nuevadir"); hide("modificaDir")'> </div>
        <div id="nuevadir" class="hide">
            <form id="newsletter" method="post" action="insertDireccion.jsp" name="altadireccion">
                <fieldset>
                    <br>
                    <b><center>Agregar nueva dirección</center></b>
                    <br><br>
                    <input type="hidden" name="idCliente" value="<%=idLogin%>">
                    <input onchange="noVacio(this)" name="dirname" class="btmspace-15" type="text" value="" placeholder="Nombre de dirección">
                    <section class="one_half first">
                        <input onchange="noVacio(this)" name="calle" class="btmspace-15" type="text" value="" placeholder="Calle">
                    </section>  
                    <section class="one_half">
                        <input onchange="soloNumeros(this)" name="numero" class="btmspace-15" type="text" value="" placeholder="Número">
                    </section>
                    <input onchange="noVacio(this)" name="colonia" class="btmspace-15" type="text" value="" placeholder="Colonia">
                    <section class="one_half first">
                        <input onchange="soloLetras(this)" name="ciudad" class="btmspace-15" type="text" value="" placeholder="Ciudad">
                    </section>
                    <section class="one_half">
                        <input onchange="soloNumeros(this)" name="cp" class="btmspace-15" type="text" value="" placeholder="Código Postal">
                    </section>
                    <input onchange="soloLetras(this)" name="estado" class="btmspace-15" type="text" value="" placeholder="Estado">
                    <p align="right">
                        <button type="submit" value="submit">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <div id="modificaDir" class="hide"></div>
        <%
                break;

            case 4:
        %>
        <fieldset id="newsletter">
            <%
                consulta = "select * from tarjeta where Usuario_idUsuario=" + idLogin + ";";
                objConn.Consult(consulta);
                n = 0;
                if (objConn.rs != null) {
                    try {
                        objConn.rs.last();
                        n = objConn.rs.getRow();
                        objConn.rs.first();
                    } catch (Exception e) {
                    }
                }
                for (int i = 0; i < n; i++) {
                    if (i % 2 == 0) {
                        out.print("<div class='one_half first direcciones'>");
                    } else {
                        out.print("<div class='one_half direcciones'>");
                    }
                    out.print("<div class='tachita'><a onclick='ConfirmEliminarTarjeta(" + objConn.rs.getString(1) + ")'> <i class='fa fa-trash'></i></a></div>");
                    out.print("<b>" + objConn.rs.getString(3) + "</b><br>"
                            + objConn.rs.getString(4) + " <br>"
                            + objConn.rs.getString(5) + " <br>"
                            + objConn.rs.getString(6) + " <br>"
                            + objConn.rs.getString(7) + "/" + objConn.rs.getString(8) + " <br>"
                            + "<p align='right'> <a onclick=\"llenaCamposTarjeta(" + objConn.rs.getString(1) + "); show('modificaTar','modificaTar'); show('sombra','sombra');\"> Editar </a> </p>"
                            + "</div>");
                    objConn.rs.next();
                }
            %>
            <!--llenaCampos(" + objConn.rs.getString(1) + ");-->
            <div class="clear"></div>
            <br>
            <p align="center">
                <button onclick='show("nuevaTar", "nuevaTar"); show("sombra", "sombra");' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar Nueva Tarjeta &nbsp&nbsp&nbsp</button>
            </p>
        </fieldset>
        <div id="sombra" class="hide" onclick='hide("sombra"); hide("nuevaTar"); hide("modificaTar")'> </div>
        <div id="nuevaTar" class="hide">
            <form id="newsletter" method="post" action="insertTarjeta.jsp" name="altaTarjeta">
                <fieldset>
                    <br>
                    <b><center>Agregar nueva Tarjeta</center></b>
                    <br><br>
                    <input type="hidden" name="idCliente" value="<%=idLogin%>">
                    <input onchange="soloLetras(this)" class="btmspace-15" type="text" value="" placeholder="Nombre del titular" name="nombretitular">
                    <section class="one_half first">
                        <input onchange="soloLetras(this)" class="btmspace-15" type="text" value="" placeholder="Marca" name="marca">
                    </section>
                    <section class="one_half">
                        <input onchange="soloLetras(this)" class="btmspace-15" type="text" value="" placeholder="Banco" name="banco">
                    </section>
                    <input onchange="soloNumeros(this)" class="btmspace-15" type="text" maxlength="16" value="" placeholder="Número de tarjeta" name="numerotarjeta">
                    <section class="one_third first">
                        <input onchange="validaMes(this)" class="btmspace-15" type="text" maxlength="2" value="" placeholder="Mes de vigencia (MM)" name="mesvigencia">
                    </section>
                    <section class="one_third">
                        <input onchange="soloNumeros(this)" class="btmspace-15" type="text" maxlength="2" value="" placeholder="Año de vigencia (YY)" name="aniovigencia">
                    </section>
                    <section class="one_third">
                        <input onchange="soloNumeros(this)" class="btmspace-15" type="password" maxlength="3" value="" placeholder="Código de Seguridad" name="codvigencia">
                    </section>
                    <br>
                    <p align="right">
                        <button type="submit" value="submit">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                    </p>
                </fieldset>
            </form>
        </div>
        <div id="modificaTar" class="hide"></div>
        <%
                break;

            case 5:
                consulta = "select * from venta where Usuario_idUsuario=" + idLogin + ";";
                objConn.Consult(consulta);
                n = 0;
                if (objConn.rs != null) {
                    try {
                        objConn.rs.last();
                        n = objConn.rs.getRow();
                        objConn.rs.first();
                    } catch (Exception e) {
                    }
                }
                
                if (n==0){
                    %> 
                    <br>
                    <b><center>Aún no haz realizado ninguna compra</center></b>
                    <br><br>
                    <%
                } else {
                    %> <table>
                    <tr>
                      <th>ID de Compra </th>
                      <th>Fecha</th>
                      <th>Estado</th>
                      <th>Método de pago</th>
                      <th>Total</th>
                      <th>Opciones</th>
                    </tr>
                    <%
                    for (int i = 0; i < n; i++) {
                        out.print("<tr>");
                        out.print("<td>"+ objConn.rs.getString(1) + "</td>"
                                + "<td>"+ objConn.rs.getString(3) + "</td>"
                                + "<td>"+ objConn.rs.getString(5) + "</td>"
                                + "<td>"+ objConn.rs.getString(7) + "</td>"
                                + "<td>$"+ objConn.rs.getString(4) + "</td>"
                                + "<td><a href='#' onclick=\"detalleCompra(" + objConn.rs.getString(1) +",'Compra','" + objConn.rs.getString(5) + "'); show('sombra', 'sombra'); show('carrito', 'carrito wrapper row3')\">Ver detalle</a></td>");
                        objConn.rs.next();
                    }
                }
           
        %>
            </table>
            <div id="sombra" class="hide" onclick='hide("sombra"); hide("carrito");'></div>
            <div id="carrito" class="wrapper row3 hide" style="top: -10%;"> </div>
        <%
                    break;
            }
            objConn.desConnect();
        %>      

    </body>
</html>