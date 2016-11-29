<%-- 
    Document   : detalleCompraProv
    Created on : 28-nov-2016, 22:52:49
    Author     : monic
--%>

<%@page import="mysqlpackage.MySqlConn"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    MySqlConn objConn2 = new MySqlConn();
    String idCompra = request.getParameter("idCompra");
    String consulta = "select * from detalleCompra where idCompra = " + idCompra;

    objConn.Consult(consulta);

    int n = 0;
    if (objConn.rs != null) {
        try {
            objConn.rs.last();
            n = objConn.rs.getRow();
            objConn.rs.first();
        } catch (Exception e) {
        }
    }
%>
<div class="content" style="margin: 0px;"> 
    <br>
    <div style="margin: 0 auto; width: 30%;"> <h1> <b> Detalle de Compra </b> </h1> </div>
    <br>
    <hr class="style-two">
    <%  if (n>0){
        String idProducto = objConn.rs.getString(2);
        for (int i = 0; i < n; i++) {
            consulta = "select * from imagen where producto_idProducto='" + objConn.rs.getString(2) + "';";
            objConn2.Consult(consulta);
    %>
    <div class="group btmspace-10 demo">
        <div class="one_quarter first">
            <br>
            <div class="imgcarrito">
                <img src="returnImagen.jsp?idImagen=<%=objConn2.rs.getString(1)%>">
            </div>
        </div>
        <div class="one_half" style="color: #000000; margin: 0px;">
            <br>
            <b> <%=objConn.rs.getString(3)%> </b><br><br>
            <b>Descripción: </b> <%=objConn.rs.getString(4)%>
            <br><b>Precio: </b> $<%=objConn.rs.getString(6)%>
        </div>
        <div class="one_quarter" style="margin: 0px; width: 25%">
            <div class="two_third first" style="color: #000000;">
                <br><b>Cantidad:</b><br><br><%=objConn.rs.getString(5)%>
            </div>
            <div class="one_third" style="color: #000000;">
                <%
                    float subtotal = Float.parseFloat(objConn.rs.getString(5)) * Float.parseFloat(objConn.rs.getString(6));
                %>
                <br><b>Subtotal: </b><br><br>$<%=subtotal%>
            </div>
        </div>
    </div>
    <hr class="style-two">
    <%
            objConn.rs.next();
        }
    }
 %>
</div>
<%objConn.desConnect();
    objConn2.desConnect();
%>