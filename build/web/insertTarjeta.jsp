<%-- 
    Document   : insertTarjeta
    Created on : 24-nov-2016, 19:32:12
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    consulta = "insert into tarjeta (Usuario_idUsuario,nombre_titular,marca,banco,num_tarjeta,mes_vig,anio_vig,codigo_seguridad) values('"
            + request.getParameter("idCliente") + "','" 
            + request.getParameter("nombretitular") + "','" 
            + request.getParameter("marca") + "','" 
            + request.getParameter("banco") + "','" 
            + request.getParameter("numerotarjeta") + "','"
            + request.getParameter("mesvigencia") + "','"
            + request.getParameter("aniovigencia") + "','"
            + request.getParameter("codvigencia")+ "');";
    objConn.Update(consulta);
    objConn.desConnect();
%>
<jsp:forward page="cliente.jsp">
    <jsp:param name="mensaje" value="Modificacion exitosa"/>
</jsp:forward>

