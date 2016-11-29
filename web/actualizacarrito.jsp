<%-- 
    Document   : actualizacarrito
    Created on : 27/11/2016, 07:55:17 PM
    Author     : alan_
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<producto> a = (ArrayList<producto>) session.getAttribute("carrito");
    int idProducto = Integer.parseInt(request.getParameter("idProducto"));
    int idSucursal = Integer.parseInt(request.getParameter("idSucursal"));
    int cantidad = Integer.parseInt(request.getParameter("cantidad"));

    for(producto prod : a){
        if(prod.idProducto == idProducto && prod.idSucursal== idSucursal){
            prod.cantidad = cantidad;
        }
    }
    cantidad = cantidad + 0;
%>