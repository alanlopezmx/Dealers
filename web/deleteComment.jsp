<%-- 
    Document   : deleteComment
    Created on : 26/11/2016, 11:17:27 AM
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
            String tipoLogin = (String) session.getAttribute("tipo");
            String idComentario="";
            String idProducto="";
            String idUsuario=(String)session.getAttribute("id");
            String consulta="";
            if(request.getParameter("idProducto")!=null){
                idProducto = new String(request.getParameter("idProducto").getBytes("ISO-8859-1"),"UTF-8");
                idProducto=idProducto.trim();
            }
            if(request.getParameter("idComentario")!=null){
                idComentario = new String(request.getParameter("idComentario").getBytes("ISO-8859-1"),"UTF-8");
                idComentario=idComentario.trim();
            }
            if(tipoLogin.equals("ADMINISTRADOR")){
                consulta = "delete from comentario where"
                    + " Producto_idProducto="+idProducto
                    + " and idComentario="+idComentario+";";
            }else{
                consulta = "delete from comentario where"
                    + " Producto_idProducto="+idProducto
                    + " and Usuario_idUsuario="+idUsuario
                    + " and idComentario="+idComentario+";";
            }
            objConn.Update(consulta);
            objConn.desConnect();
        %>
        <jsp:forward page="producto.jsp">
            <jsp:param name="mensaje" value="<br>Comentario dado de baja con exito.<br>"/>
            <jsp:param name="idproducto" value="<%=idProducto%>"/>
        </jsp:forward>
    </body>
</html>
