<%-- 
    Document   : eliminaDirDB
    Created on : 24-nov-2016, 12:15:04
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idDir=request.getParameter("idDir");
    String consulta = "delete from domicilio where idDomicilio=?;";
    String[] datos = {idDir};
    //Ejecutamos la consulta
    objConn.safeUpdate(consulta, datos);
    //n indicara cuantos registros cumplen las condiciones
    objConn.desConnect();
%>