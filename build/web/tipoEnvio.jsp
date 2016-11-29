<%-- 
    Document   : tipoEnvio
    Created on : 27/11/2016, 10:12:27 PM
    Author     : alan_
--%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<producto> a = (ArrayList<producto>) session.getAttribute("carrito");
    int idSucursal = Integer.parseInt(request.getParameter("idSucursal"));
    int idDomicilio = Integer.parseInt(request.getParameter("idDomicilio"));    
    for(producto prod: a){
        if(prod.idSucursal == idSucursal){
            prod.tipoEnvio = idDomicilio;
        }
    }
    idDomicilio = idDomicilio+0;
%>