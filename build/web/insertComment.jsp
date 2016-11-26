<%-- 
    Document   : insertComment
    Created on : 24/11/2016, 07:42:28 PM
    Author     : dario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
        <%
            
            String fecha="current_timestamp()";
            String comentario="";
            String calificacion="";
            String idProducto="";
            String idUsuario=(String)session.getAttribute("id");
            if(request.getParameter("comentario")!=null){
                comentario = new String(request.getParameter("comentario").getBytes("ISO-8859-1"),"UTF-8");
                comentario=comentario.trim();
            }
            if(request.getParameter("star")!=null){
                calificacion = new String(request.getParameter("star").getBytes("ISO-8859-1"),"UTF-8");
                calificacion=calificacion.trim();
            }
            if(request.getParameter("idProducto")!=null){
                idProducto = new String(request.getParameter("idProducto").getBytes("ISO-8859-1"),"UTF-8");
                idProducto=idProducto.trim();
            }
            System.out.print("cal" +calificacion);
            String consulta = "insert into comentario (fecha, comentario, calificacion, Producto_idProducto, Usuario_idUsuario) values("
            + fecha + ",'" + comentario + "','" + calificacion + "','" + idProducto + "','" + idUsuario + "');";
            objConn.Update(consulta);
            objConn.desConnect();
        %>
        <jsp:forward page="producto.jsp">
            <jsp:param name="mensaje" value="<br>Usuario dado de alta con exito.<br>"/>
            <jsp:param name="idproducto" value="<%=idProducto%>"/>
        </jsp:forward>
    </body>
</html>
