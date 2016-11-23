<%-- 
    Document   : modificaDatosPer
    Created on : 22-nov-2016, 23:58:34
    Author     : monic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
 <jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
        <%
           String consulta = "update usuario set nombre='" + request.getParameter("nombre") 
                + "', ap_paterno='" + request.getParameter("appat") 
                + "', ap_materno='" + request.getParameter("apmat") 
                + "', telefono='" + request.getParameter("telefono")
                + "' where idUsuario='" + request.getParameter("idLogin") + "';";
            objConn.Update(consulta);  
            session.setAttribute("nombre", request.getParameter("nombre"));
        %>
