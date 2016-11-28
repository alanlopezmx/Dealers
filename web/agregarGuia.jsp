<%-- 
    Document   : agregarGuia
    Created on : 27-nov-2016, 19:21:02
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta = "update venta set guia_rastreo='" + request.getParameter("guia")
                + "', estado_venta=3 where idVenta='" + request.getParameter("idVenta") + "';";
            objConn.Update(consulta); 
            objConn.desConnect();
%>
