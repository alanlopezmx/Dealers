<%-- 
    Document   : eliminaTarDB
    Created on : 24-nov-2016, 22:01:21
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idTar=request.getParameter("idTar");
    String consulta = "delete from tarjeta where idTarjeta=?;";
    String[] datos = {idTar};
    //Ejecutamos la consulta
    objConn.safeUpdate(consulta, datos);
    //n indicara cuantos registros cumplen las condiciones
    objConn.desConnect();
%>
