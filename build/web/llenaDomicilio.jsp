<%-- 
    Document   : llenaDomicilio
    Created on : 24-nov-2016, 12:26:43
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idDir=request.getParameter("idDir");
    String consulta = "select * from domicilio where idDomicilio=?;";
    String[] datos = {idDir};
    objConn.safeConsult(consulta, datos);
    
%>
<form id="newsletter" method="post" action="modificaDireccion.jsp" name="modificadireccion">
    <fieldset>
        <br>
        <b><center>Modificar Dirección</center></b>
        <input type="hidden" name="idDomicilio" value="<%=idDir%>">
        <p align="left"><b>Nombre de la Dirección:</b></p>
        <input onchange="noVacio(this)" name="dirname" class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Nombre de dirección" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <p align="left"><b>Calle:</b></p>
            <input onchange="noVacio(this)" name="calle" class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Calle" style="border-color: rgb(60, 179, 113)">
        </section>  
        <section class="one_half">
            <p align="left"><b>Número:</b></p>
            <input onchange="soloNumeros(this)" name="numero" class="btmspace-15" type="text" value="<%=objConn.rs.getString(5)%>" placeholder="Número" style="border-color: rgb(60, 179, 113)">
        </section>
        <p align="left"><b>Colonia:</b></p>
        <input onchange="noVacio(this)" name="colonia" class="btmspace-15" type="text" value="<%=objConn.rs.getString(6)%>" placeholder="Colonia" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <p align="left"><b>Ciudad:</b></p>
            <input onchange="soloLetras(this)" name="ciudad" class="btmspace-15" type="text" value="<%=objConn.rs.getString(7)%>" placeholder="Ciudad" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half">
            <p align="left"><b>Código Postal:</b></p>
            <input onchange="soloNumeros(this)" name="cp" class="btmspace-15" type="text" value="<%=objConn.rs.getString(9)%>" placeholder="Código Postal" style="border-color: rgb(60, 179, 113)">
        </section>
        <p align="left"><b>Estado:</b></p>
        <input onchange="soloLetras(this)" name="estado" class="btmspace-15" type="text" value="<%=objConn.rs.getString(8)%>" placeholder="Estado" style="border-color: rgb(60, 179, 113)">
        <p align="right">
            <button type="submit" value="submit">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button>
        </p>
    </fieldset>
</form>
<%objConn.desConnect();%>