<%-- 
    Document   : eliminaSucursalDB
    Created on : 24-nov-2016, 19:46:18
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idSucursal="";
    if (request.getParameter("idSucursal") != null) {
        idSucursal = request.getParameter("idSucursal");
    }

    String consulta = "delete from sucursal where idSucursal=?;";
    String[] datos = {idSucursal};
    //Ejecutamos la consulta
    objConn.safeUpdate(consulta, datos);
    //n indicara cuantos registros cumplen las condiciones
    objConn.desConnect();
%>

