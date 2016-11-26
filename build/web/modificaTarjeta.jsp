<%-- 
    Document   : modificaTarjeta
    Created on : 24-nov-2016, 22:29:13
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta = "update tarjeta set nombre_titular='" + request.getParameter("nombretitular")
            + "', marca='" + request.getParameter("marca")
            + "', banco='" + request.getParameter("banco")
            + "', num_tarjeta='" + request.getParameter("numerotarjeta")
            + "', mes_vig='" + request.getParameter("mesvigencia")
            + "', anio_vig='" + request.getParameter("aniovigencia")
            + "', codigo_seguridad='" + request.getParameter("codvigencia")
            + "' where idTarjeta='" + request.getParameter("idTar") + "';";
    objConn.Update(consulta);
    objConn.desConnect();
%>
<jsp:forward page = "cliente.jsp">
    <jsp:param name="mensaje" value="Modificado" />
</jsp:forward>
