<%-- 
    Document   : modProv
    Created on : 24-nov-2016, 2:22:23
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idProveedor = request.getParameter("idProveedor");
    String consulta = "select * from proveedor where idProveedor='" + idProveedor + "';";
    objConn.Consult(consulta);
%>
<fieldset id="newsletter">
    <form method="post" action="modificaProveedor" name="modprov">

        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del proveedor</b>
        <br><br>
        <input name='idProveedor' id="idProveedor" value='<%=idProveedor%>' type="hidden"/>
        <input name="nombre" class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Nombre" onchange="soloLetras(this)" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <input name="appat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Apellido Paterno" onchange="soloLetras(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half">
            <input name="apmat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Apellido Materno" onchange="soloLetrasyNull(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <input name="telefono" class="btmspace-15" type="text" value="<%=objConn.rs.getString(5)%>" placeholder="Teléfono" onchange="soloNumeros(this)" style="border-color: rgb(60, 179, 113)">
        <input name="rfc" class="btmspace-15" type="text" value="<%=objConn.rs.getString(6)%>" placeholder="RFC" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <input name="calle" class="btmspace-15" type="text" value="<%=objConn.rs.getString(7)%>" placeholder="Calle" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        </section>  
        <section class="one_half">
            <input name="numero" class="btmspace-15" type="text" value="<%=objConn.rs.getString(8)%>" placeholder="Numero" onchange="soloNumeros(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <input name="colonia" class="btmspace-15" type="text" value="<%=objConn.rs.getString(9)%>" placeholder="Colonia" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        <input name="ciudad" class="btmspace-15" type="text" value="<%=objConn.rs.getString(10)%>" placeholder="Ciudad" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        <input name="estado" class="btmspace-15" type="text" value="<%=objConn.rs.getString(11)%>" placeholder="Estado" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <input name="pais" class="btmspace-15" type="text" value="<%=objConn.rs.getString(12)%>" placeholder="País" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half">
            <input name="cp" class="btmspace-15" type="text" value="<%=objConn.rs.getString(13)%>" placeholder="Código Postal" onchange="soloNumeros(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <br><br><br>
        <div class="fl_left" style="margin-right: 20px;">
            <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button> 
        </div>

    </form>
    <div>  
        <button onclick='eliminaProv()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Eliminar &nbsp&nbsp&nbsp</button>
    </div>
</fieldset>
<%objConn.desConnect();%>
