<%-- 
    Document   : modificaProductoDB
    Created on : 23-nov-2016, 21:24:07
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idProducto, nombre, descCorta, descLarga, precio, categoria;
    idProducto = request.getParameter("idProducto");
    nombre = request.getParameter("nombre");
    descCorta = request.getParameter("descripcion");
    descLarga = request.getParameter("desclarga");
    precio = request.getParameter("precio");
    categoria = request.getParameter("categoria");
    System.out.println(idProducto + " " + categoria);
    String consulta = "update producto set nombre='" + nombre 
                + "', descripcion='" + descCorta
                + "', descripcion_larga='" + descLarga 
                + "', precio_venta='" + precio
                + "', Categoria_idCategoria='" + categoria
                + "' where idProducto='" + idProducto + "';";
            objConn.Update(consulta); 
%>
<jsp:forward page = "administrador.jsp">
    <jsp:param name="mensaje" value="Modificado" />
</jsp:forward>
