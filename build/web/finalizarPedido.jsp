<%-- 
    Document   : finalizarPedido
    Created on : 27-nov-2016, 19:20:30
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta = "update venta set estado_venta=4 where idVenta='" + request.getParameter("idVenta") + "';";
    objConn.Update(consulta); 
    objConn.desConnect();
%>