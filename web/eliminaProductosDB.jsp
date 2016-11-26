<%-- 
    Document   : eliminaProductosDB
    Created on : 23-nov-2016, 18:41:13
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idProducto="";
    if (request.getParameter("idProducto") != null) {
        idProducto = request.getParameter("idProducto");
    }

    String consulta = "delete from producto where idProducto=?;";
    String[] datos = {idProducto};
    //Ejecutamos la consulta
    objConn.safeUpdate(consulta, datos);
    //n indicara cuantos registros cumplen las condiciones
    objConn.desConnect();
%>


