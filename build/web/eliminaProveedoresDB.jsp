<%-- 
    Document   : eliminaProveedoresDB
    Created on : 24-nov-2016, 2:33:32
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idProveedor="";
    if (request.getParameter("idProveedor") != null) {
        idProveedor = request.getParameter("idProveedor");
    }

    String consulta = "delete from proveedor where idProveedor=?;";
    String[] datos = {idProveedor};
    //Ejecutamos la consulta
    objConn.safeUpdate(consulta, datos);
    //n indicara cuantos registros cumplen las condiciones
    objConn.desConnect();
%>
