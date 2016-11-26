<%-- 
    Document   : modificaDireccion
    Created on : 24-nov-2016, 13:40:43
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta = "update domicilio set nombre='" + request.getParameter("dirname") 
                + "', calle='" + request.getParameter("calle")
                + "', numero='" + request.getParameter("numero")
                + "', colonia='" + request.getParameter("colonia")
                + "', ciudad='" + request.getParameter("ciudad")
                + "', estado='" + request.getParameter("estado")
                + "', cp='" + request.getParameter("cp")
                + "' where idDomicilio='" + request.getParameter("idDomicilio") + "';";
            objConn.Update(consulta); 
            objConn.desConnect();
%>
<jsp:forward page = "cliente.jsp">
    <jsp:param name="mensaje" value="Modificado" />
</jsp:forward>
