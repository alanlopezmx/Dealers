<%-- 
    Document   : busqajax
    Created on : 27-nov-2016, 23:10:23
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    String buscar = request.getParameter("busqueda");
    if (buscar != null && !buscar.isEmpty()) {
        objConn.Connect();
        consulta = "select idProducto, nombre from producto where nombre like '" + buscar + "%';";
        objConn.Consult(consulta);
        for (int i = 1; i <= objConn.rs.getRow(); i++) {
        %>
        <a href="producto.jsp?idproducto=<%=objConn.rs.getString(1)%>"> <div style="background-color: #F8F8F8; border-bottom: 3px solid; padding: 12px 10px;"> <%=objConn.rs.getString(2)%> </div></a>
        <%
        objConn.rs.next();	
        }
    }
objConn.desConnect();
%>