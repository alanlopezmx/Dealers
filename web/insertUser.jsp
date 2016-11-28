<%-- 
    Document   : insertUser
    Created on : 20-nov-2016, 20:34:59
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
        <%
            String nombre = "";
            String appat = "";
            String apmat = "";
            String password = "";
            String email = "";
            String telefono = "";
            if (request.getParameter("nombre") != null) {
                nombre = new String(request.getParameter("nombre").getBytes("ISO-8859-1"), "UTF-8");
                nombre = nombre.trim();

            }
            if (request.getParameter("appat") != null) {
                appat = new String(request.getParameter("appat").getBytes("ISO-8859-1"), "UTF-8");
                appat = appat.trim();
            }
            if (request.getParameter("apmat") != null) {
                apmat = new String(request.getParameter("apmat").getBytes("ISO-8859-1"), "UTF-8");
                apmat = apmat.trim();
            }
            if (request.getParameter("telefono") != null) {
                telefono = new String(request.getParameter("telefono").getBytes("ISO-8859-1"), "UTF-8");
                telefono = telefono.trim();
            }
            if (request.getParameter("email") != null) {
                email = new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8");
                email = email.trim();
            }
            if (request.getParameter("password1") != null) {
                password = new String(request.getParameter("password1").getBytes("ISO-8859-1"), "UTF-8");
                password = password.trim();
            }
            String consulta;
            consulta = "insert into usuario (nombre,ap_paterno,ap_materno,telefono,correo,password,tipo) values("
                    + "'" + nombre + "','" + appat + "','" + apmat + "','" + telefono + "','" + email + "',sha2('"
                    + password + "',512),1);";
            objConn.Update(consulta);
            String mensaje = objConn.exMsg;
            objConn.desConnect();
            if (objConn.exMsg.isEmpty()) {
        %>
        <jsp:forward page="index.jsp">
            <jsp:param name="mensaje" value=""/>
        </jsp:forward>
        <%} else {
        %>  
        <jsp:forward page="registrarse.jsp">
            <jsp:param name="mensaje" value="<%=objConn.exMsg%>"/>
        </jsp:forward>
        <%}%>
    </body>
</html>