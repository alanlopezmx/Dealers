<%-- 
    Document   : adminAjax
    Created on : 21-nov-2016, 2:09:48
    Author     : monic
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
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
            ArrayList<producto> a = (ArrayList<producto>) session.getAttribute("carrito");
            Collections.sort(a);
            int opcion = Integer.parseInt(request.getParameter("op"));
            String idLogin = request.getParameter("idLogin");
            int n = 0, idSucursal = 0;
            String consulta;
            switch (opcion) {
                case 1: // Tipo de envio
        %>

        <%
            for (producto aux : a) {
                if (idSucursal != aux.idSucursal) {
                    idSucursal = aux.idSucursal;
                    consulta = "select nombre from sucursal where idSucursal=" + idSucursal + ";";
                    objConn.Consult(consulta);
                    if (objConn.rs != null) {
                        try {
                            objConn.rs.last();
                            n = objConn.rs.getRow();
                            objConn.rs.first();
                        } catch (Exception e) {
                        }
                    }
                    if (n > 0) {
                        out.println("<br><h1 class='center'>" + objConn.rs.getString(1) + "</h1>");
                    }

        %>
        Elige una opción de envio:
        <br ><br>
        <input type="radio" name="envioOp<%out.print(idSucursal);%>" id="envioOpR<%out.print(idSucursal);%>" class="css-checkbox" onclick="ocultarDirecciones(<%out.print("contDirecciones" + idSucursal);%>);tipoEnvio(<%out.print(idSucursal + ",0");%>)"/>
        <label for="envioOpR<%out.print(idSucursal);%>" class="css-label radGroup2">Recoger en sucursal</label>
        <br>
        <input type="radio" name="envioOp<%out.print(idSucursal);%>" id="envioOpE<%out.print(idSucursal);%>" class="css-checkbox" onclick="mostrarDirecciones(contDirecciones<%out.print(idSucursal + "," + idSucursal);%>)" />
        <label for="envioOpE<%out.print(idSucursal);%>" class="css-label radGroup2">Envio a domicilio</label>

        <div id="contDirecciones<%out.print(idSucursal);%>"></div>      

        <%}
            } %>
            
       
        <fieldset id="newsletter" class="first">  
            <div class="clear"></div>
            <br>
            <p align="center">
                <button onclick='tipoEnvio()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Continuar &nbsp&nbsp&nbsp</button>
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
        <%
                break;
            case 2: // Tipo de pago
                for (producto aux : a) {
                    if (idSucursal != aux.idSucursal) {
                        idSucursal = aux.idSucursal;
                        consulta = "select nombre from sucursal where idSucursal=" + idSucursal + ";";
                        objConn.Consult(consulta);
                        if (objConn.rs != null) {
                            try {
                                objConn.rs.last();
                                n = objConn.rs.getRow();
                                objConn.rs.first();
                            } catch (Exception e) {
                            }
                        }
                        if (n > 0 && aux.tipoEnvio != 0) {
                            out.println("<br><div class='container first'><br><h1 class='center'>" + objConn.rs.getString(1) + "</h1><div>");
                        

        %>
        Elige una tarjeta:

        <div id="contDirecciones<%out.print(idSucursal);%>">
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
                        out.print("<div class='one_third first direcciones'>");
                    } else {
                        out.print("<div class='one_third direcciones'>");
                    }
                    if(aux.idSucursal == idSucursal && aux.tipoPago == Integer.parseInt(objConn.rs.getString(1)))
                        out.print("<div class='dir'><input checked class='dir' id='tar-" + objConn.rs.getString(1) + "-" + idSucursal + "' type='radio' name='tar" + idSucursal + "' onclick='tipoPago(" + idSucursal + "," + objConn.rs.getString(1) + ")' /><label class='dir' for='tar-" + objConn.rs.getString(1) + "-" + idSucursal + "' value=" + objConn.rs.getString(1) + "'></label></div>");
                    else
                        out.print("<div class='dir'><input class='dir' id='tar-" + objConn.rs.getString(1) + "-" + idSucursal + "' type='radio' name='tar" + idSucursal + "' onclick='tipoPago(" + idSucursal + "," + objConn.rs.getString(1) + ")' /><label class='dir' for='tar-" + objConn.rs.getString(1) + "-" + idSucursal + "' value=" + objConn.rs.getString(1) + "'></label></div>");

                    out.print("<b>" + objConn.rs.getString(3) + "</b><br>"
                            + objConn.rs.getString(4) + " <br>"
                            + objConn.rs.getString(5) + " <br>"
                            + objConn.rs.getString(6) + " <br>"
                            + objConn.rs.getString(7) + "/" + objConn.rs.getString(8) + " <br>"
                            + "</div>");
                    objConn.rs.next();
                }
            %>
        </div>      

        <%}
            if (n > 0 && aux.tipoEnvio == 0) {
                out.println("<br><h1 class='center'>" + objConn.rs.getString(1) + "</h1><br> Pago en caja");
            }
            }} %>
        <fieldset id="newsletter" class="first">  
            <div class="clear"></div>
            <br>
            <p align="center">
                <button onclick='tipoEnvio()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Continuar &nbsp&nbsp&nbsp</button>
            </p>
        </fieldset>
        <%
                break;

            case 3: // Alta categoria
        %>
        <div class="wrapper row3">
            <br>
            <br>
            <div class="content fl_right" style="margin: 0px;"> 
                <form action="" method="post" name="agregarCarrito">
                <%
                    idSucursal=0;
                    int total= 0;
                for(producto prod:a){
                    consulta = "select * from carrito where idProducto = " + prod.idProducto + " and idSucursal = " + prod.idSucursal +";";
                    objConn.Consult(consulta);
                    int nProd = 0;
                    if (objConn.rs != null) {
                        try {
                            objConn.rs.last();
                            nProd = objConn.rs.getRow();
                            objConn.rs.first();
                        } catch (Exception e) {
                        }
                    }
                    if(nProd > 0){
                        prod.precio = Integer.parseInt(objConn.rs.getString(8));
                        if (idSucursal != prod.idSucursal) {
                            out.println("<br><h1 class='center'>" + objConn.rs.getString(6) + "</h1>");
                            idSucursal = prod.idSucursal;
                            out.print("<div class='fl_right'>");
                            if(prod.tipoEnvio == 0)
                                out.print("<br><b>Recoger en sucursal</b>");
                            else{
                                out.print("<br><b>Envio a domicilio $99.00</b>");
                                total += 99;
                            }
                            if(prod.tipoPago == 0)
                                out.print("<br><b>Pago en sucursal</b>");
                            else 
                                out.print("<br><b>Pago con tarjeta</b>");
                            out.print("</div><br>"); 
                        }
                    
                        total += Integer.parseInt(objConn.rs.getString(8))*prod.cantidad;
                    
                %>  
                <div class="group btmspace-15 demo fl_right">
                    <div class="one_third first">
                        <div class="contenedor">
                                <%out.print("<img src='returnImagen.jsp?idImagen=" + objConn.rs.getString(2) + "' alt=''>");%>
                        </div>
                    </div>
                    <div class="one_third" style="color: #000000; margin: 0px;">
                        <h2> <%out.print(objConn.rs.getString(3));%> </h2>
                        <b>Descripción: </b> <br><%out.print(objConn.rs.getString(4));%><br>
                        <b>Cantidad: </b> <%out.print(prod.cantidad);%> <br>
                        <b>Precio: </b> $<%out.print(objConn.rs.getString(8));%>
                    </div>
                    <div class="one_quarter" style="margin: 0px; width: 25%">
                            <br><br><b>Subtotal: </b><br> $<%out.print(Integer.parseInt(objConn.rs.getString(8))*prod.cantidad);%>
                    </div>
                </div>
                        <hr class="style-two">
                        
                        
                <%    }
                }    
                %> 
                <div class="container fl_right">
                    <b>Total: $</b> <%out.print(total);%> 
                </div>
                <br><br>
                <div id="newsletter" class="container fl_right">
                    <button onclick="insertVenta()" type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Realizar Compra &nbsp&nbsp&nbsp</button>
                </div>
                </form>
            </div>
                
        </div>
        <%
                    break;
            }
        %>
        
        
        <script src="layout/scripts/jquery.backtotop.js" type="text/javascript"></script>
    </body>
</html>
