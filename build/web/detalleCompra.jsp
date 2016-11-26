<%-- 
    Document   : detalleCompra
    Created on : 25-nov-2016, 22:59:16
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page import="mysqlpackage.MySqlConn"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    MySqlConn objConn2 = new MySqlConn();
    String idVenta = request.getParameter("idVenta");
    String consulta = "select distinct sucursal.nombre, producto.*,Producto_has_Venta.precio_venta,Producto_has_Venta.cantidad from  venta,producto,Producto_has_Venta, sucursal,Producto_has_Sucursal"
            + " where venta.idVenta = '" + idVenta + "'"
            + " and Producto_has_Venta.Venta_idVenta = venta.idVenta"
            + " and Producto_has_Venta.Producto_idProducto = producto.idProducto"
            + " and Producto_has_Venta.Sucursal_idSucursal = Sucursal.idSucursal;";

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
    <%  String idProducto = objConn.rs.getString(2);
        for (int i = 0; i < n; i++) {
            consulta = "select * from imagen where producto_idProducto='" + objConn.rs.getString(2) + "';";
            objConn2.Consult(consulta);
    %>
    <div class="group btmspace-10 demo">
        <div class="one_quarter first">
            <div class="imgcarrito">
                <img src="returnImagen.jsp?idImagen=<%=objConn2.rs.getString(1)%>">
            </div>
        </div>
        <div class="one_half" style="color: #000000; margin: 0px;">
            <br>
            <b> <%=objConn.rs.getString(3)%> </b><br><br>
            <b>Descripción: </b> <%=objConn.rs.getString(4)%>
            <br><b>Precio: </b> $<%=objConn.rs.getString(8)%>
            <br><b>Sucursal: </b><%=objConn.rs.getString(1)%>
        </div>
        <div class="one_quarter" style="margin: 0px; width: 25%">
            <div class="two_third first" style="color: #000000;">
                <br><br><br><b>Cantidad:</b><br><br><%=objConn.rs.getString(9)%>
            </div>
            <div class="one_third" style="color: #000000;">
                <%
                    float subtotal = Float.parseFloat(objConn.rs.getString(9)) * Float.parseFloat(objConn.rs.getString(8));
                %>
                <br><br><br><b>Subtotal: </b><br><br>$<%=subtotal%>
            </div>
        </div>
    </div>
    <hr class="style-two">
    <%
            objConn.rs.next();
        }
    %>
</div>
<%objConn.desConnect();
    objConn2.desConnect();
%>