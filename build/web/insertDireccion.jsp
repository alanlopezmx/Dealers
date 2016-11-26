<%-- 
    Document   : insertDireccion
    Created on : 24-nov-2016, 1:02:51
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    consulta = "insert into domicilio (Usuario_idUsuario,nombre,calle,numero,colonia,ciudad,estado,cp) values('"
            + request.getParameter("idCliente") + "','" 
            + request.getParameter("dirname") + "','" 
            + request.getParameter("calle") + "','" 
            + request.getParameter("numero") + "','" 
            + request.getParameter("colonia") + "','"
            + request.getParameter("ciudad") + "','"
            + request.getParameter("estado") + "','"
            + request.getParameter("cp")+ "');";
    objConn.Update(consulta);
    objConn.desConnect();
%>
<jsp:forward page="cliente.jsp">
    <jsp:param name="mensaje" value="Modificacion exitosa"/>
</jsp:forward>
