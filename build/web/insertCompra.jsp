<%-- 
    Document   : insertCompra
    Created on : 28-nov-2016, 3:49:21
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    String idProveedor = request.getParameter("idProveedor");
    String total = request.getParameter("total");
    consulta = "insert into Compra(Proveedor_idProveedor,fecha,total) values(?,current_timestamp(),?);"; 
    String[] datos = {idProveedor,total};
    objConn.safeUpdate(consulta, datos);   
    consulta = "select max(idCompra) from compra;";
    objConn.Consult(consulta);
%>
<%=objConn.rs.getString(1)%><%
    objConn.desConnect();
%>