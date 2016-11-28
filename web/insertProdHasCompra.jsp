<%-- 
    Document   : inserProdHasCompra
    Created on : 28-nov-2016, 4:29:08
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    objConn.Connect();
    String consulta;
    String idCompra = request.getParameter("idCompra");
    String idProducto = request.getParameter("idProducto");
    String cantidad = request.getParameter("cantidad");
    String precio = request.getParameter("precio");
    consulta = "insert into producto_has_compra values(?,?,?,?);"; 
    String[] datos = {idProducto,idCompra,cantidad,precio};
    objConn.safeUpdate(consulta, datos);   
    objConn.desConnect();
%>
