<%-- 
    Document   : eliminaUsuariosDB
    Created on : 24-nov-2016, 2:03:14
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idUsuario="";
    if (request.getParameter("idUsuario") != null) {
        idUsuario = request.getParameter("idUsuario");
    }

    String consulta = "delete from usuario where idUsuario=?;";
    String[] datos = {idUsuario};
    //Ejecutamos la consulta
    objConn.safeUpdate(consulta, datos);
    //n indicara cuantos registros cumplen las condiciones
%>

