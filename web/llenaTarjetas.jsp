<%-- 
    Document   : llenaTarjetas
    Created on : 24-nov-2016, 22:01:47
    Author     : monic
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idTar=request.getParameter("idTar");
    String consulta = "select * from tarjeta where idTarjeta=?;";
    String[] datos = {idTar};
    objConn.safeConsult(consulta, datos);
%>
<form id="newsletter" method="post" action="modificaTarjeta.jsp" name="modificaTarjeta">
    <fieldset>
        <br>
        <b><center>Modificar Tarjeta</center></b>
        <input type="hidden" name="idTar" value="<%=idTar%>">
        <p align="left"><b>Nombre del Titular:</b></p>
        <input onchange="soloLetras(this)" class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Nombre del titular" name="nombretitular" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <p align="left"><b>Marca:</b></p>
          <input onchange="soloLetras(this)" class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Marca" name="marca" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half">
            <p align="left"><b>Banco:</b></p>
          <input onchange="soloLetras(this)" class="btmspace-15" type="text" value="<%=objConn.rs.getString(5)%>" placeholder="Banco" name="banco" style="border-color: rgb(60, 179, 113)">
        </section>
        <p align="left"><b>Número de la Tarjeta:</b></p>
        <input onchange="soloNumeros(this)" class="btmspace-15" type="text" maxlength="16" value="<%=objConn.rs.getString(6)%>" placeholder="Número de tarjeta" name="numerotarjeta" style="border-color: rgb(60, 179, 113)">
        <section class="one_third first">
            <p align="left"><b>Mes de Vigencia:</b></p>
          <input onchange="validaMes(this)" class="btmspace-15" type="text" maxlength="2" value="<%=objConn.rs.getString(7)%>" placeholder="Mes de vigencia (MM)" name="mesvigencia" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_third">
            <p align="left"><b>Año de Vigencia:</b></p>
          <input onchange="soloNumeros(this)" class="btmspace-15" type="text" maxlength="2" value="<%=objConn.rs.getString(8)%>" placeholder="Año de vigencia (YY)" name="aniovigencia" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_third">
            <p align="left"><b>Código de Seguridad:</b></p>
          <input onchange="soloNumeros(this)" class="btmspace-15" type="password" maxlength="3" value="<%=objConn.rs.getString(9)%>" placeholder="Código de Seguridad" name="codvigencia" style="border-color: rgb(60, 179, 113)">
        </section>
        <br>
        <p align="right">
          <button type="submit" value="submit">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button>
        </p>
    </fieldset>
</form>
<%objConn.desConnect();%>