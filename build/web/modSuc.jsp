<%-- 
    Document   : modSuc
    Created on : 24-nov-2016, 18:54:05
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    int n;
    String idSucursal = request.getParameter("idSucursal");
    consulta = "select * from sucursal where idSucursal='" + idSucursal + "';";
    objConn.Consult(consulta);
    n = 0;
    if (objConn.rs != null) {
        try {
            objConn.rs.last();
            n = objConn.rs.getRow();
            objConn.rs.first();
        } catch (Exception e) {
        }
    }
%>
<fieldset id="newsletter">
    <form method="post" action="modificaSucursal" name="modsuc">
        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos de la sucursal</b>
        <br><br>
        <input name="idSucursal" id="idSucursal" value="<%=idSucursal%>" type="hidden"/>
        <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Nombre" name="nombre" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Calle" name="calle" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half">
            <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Número" name="numero" onchange="soloNumeros(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half first">
            <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(5)%>" placeholder="Colonia" name="colonia" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half">
            <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(6)%>" placeholder="Ciudad" name="ciudad" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half first">
            <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(7)%>" placeholder="Estado" name="estado" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        </section>  
        <section class="one_half">
            <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(8)%>" placeholder="Código Postal" name="cp" onchange="soloNumeros(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <input class="btmspace-15" type="text" value="<%=objConn.rs.getString(9)%>" placeholder="Teléfono" name="telefono" onchange="soloNumeros(this)" style="border-color: rgb(60, 179, 113)">
        <br><br><br>
        <div class="fl_left" style="margin-right: 20px;">
            <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button> 
        </div>

    </form>
    <div class="fl_left">  
        <button onclick='eliminaSuc()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Eliminar &nbsp&nbsp&nbsp</button>
    </div>
</fieldset>
<%objConn.desConnect();%>