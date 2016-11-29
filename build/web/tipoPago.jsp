<%-- 
    Document   : tipoPago
    Created on : 28/11/2016, 12:50:24 AM
    Author     : alan_
--%>

<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<producto> a = (ArrayList<producto>) session.getAttribute("carrito");
    int idSucursal = Integer.parseInt(request.getParameter("idSucursal"));
    int idTarjeta = Integer.parseInt(request.getParameter("idTarjeta"));    
    for(producto prod: a){
        if(prod.idSucursal == idSucursal){
            prod.tipoPago = idTarjeta;
        }
    }
    idTarjeta = idTarjeta+0;
%>