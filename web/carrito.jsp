<%-- 
    Document   : carrito.jsp
    Created on : 26/11/2016, 08:28:17 PM
    Author     : alan_
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    ArrayList<producto> ba = new ArrayList<>();
    session.setAttribute("carrito", ba);
%>