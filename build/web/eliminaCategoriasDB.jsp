<%-- 
    Document   : eliminaCategoriasDB
    Created on : 24-nov-2016, 1:02:29
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idProducto="";
    if (request.getParameter("idCategoria") != null) {
        idProducto = request.getParameter("idCategoria");
    }
    String consulta = "delete from categoria where idCategoria=?;";
    String[] datos = {idProducto};
    //Ejecutamos la consulta
    objConn.safeUpdate(consulta, datos);
    //n indicara cuantos registros cumplen las condiciones
%>

