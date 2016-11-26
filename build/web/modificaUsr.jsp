<%-- 
    Document   : modificaUsr
    Created on : 24-nov-2016, 1:41:39
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page import="com.sun.org.apache.bcel.internal.generic.IfInstruction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idUsuario = request.getParameter("idUsuario");
    String consulta;
    consulta = "select * from usuario where idUsuario='" + idUsuario + "';";
    objConn.Consult(consulta);
%>
<!DOCTYPE html>
<fieldset id="newsletter">
    <form method="post" action="modificaUsuario" name="modusr">

        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del cliente</b>
        <br><br>
        <input name='idUsuario' id="idUsuario" value='<%=idUsuario%>' type="hidden"/>
        <input name="nombre" class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Nombre" onchange="soloLetras(this)" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <input name="appat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Apellido Paterno" onchange="soloLetras(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <section class="one_half">
            <input name="apmat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Apellido Materno" onchange="soloLetrasyNull(this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <input name="telefono" class="btmspace-15" type="text" value="<%=objConn.rs.getString(5)%>" placeholder="Teléfono" onchange="soloNumeros(this)" style="border-color: rgb(60, 179, 113)">
        <input name="email" class="btmspace-15" type="text" value="<%=objConn.rs.getString(6)%>" placeholder="Correo" onchange="validaCorreo(this)" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <input name="password1" class="btmspace-15" type="password" value="" placeholder="Contraseña" onchange="noVacio(this)" style="border-color: rgb(60, 179, 113)">
        </section>  
        <section class="one_half">
            <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange="checaPass(password1, this)" style="border-color: rgb(60, 179, 113)">
        </section>
        <%if (objConn.rs.getString(8).equals("NORMAL") || objConn.rs.getString(8).equals("MAYORITARIO")) {%>
        <div class="caja">
            <select name="tipo">
                <%

                    if (objConn.rs.getString(8).equals("NORMAL")) {
                %>
                <option disabled> Tipo de Cliente... </option> 
                <option value="NORMAL" selected>Normal</option>
                <option value="MAYORITARIO">Mayoritario</option>
                <%} else {%>
                <option disabled> Tipo de Cliente... </option> 
                <option value="NORMAL">Normal</option>
                <option value="MAYORITARIO" selected>Mayoritario</option>
                <%}%>
            </select>
        </div>
        <%}%>
        <%if (objConn.rs.getString(8).equals("VENDEDOR")) {%>
        <input name="tipo" value="VENDEDOR" type="hidden"/>
        <div class="caja">
            <select name="idSucursal">
                <%
                    consulta = "select sucursal_idSucursal from usuario where idUsuario='" + idUsuario + "';";
                    objConn.Consult(consulta);
                    int idSucursal = -1;
                    int n = 0;
                    if (objConn.rs != null) {
                        try {
                            objConn.rs.last();
                            n = objConn.rs.getRow();
                            objConn.rs.first();
                        } catch (Exception e) {
                        }
                    }
                    if (n > 0 && objConn.rs.getString(1)!=null) {
                        idSucursal = Integer.parseInt(objConn.rs.getString(1));
                    }
                    if(idSucursal==-1){
                        out.println("<option value='0' disabled selected> Selecciona la sucursal... </option> ");
                    }
                    else{
                        out.println("<option value='0' disabled> Selecciona la sucursal... </option> ");
                    }
                    consulta = "select idSucursal, nombre from sucursal;";
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
                    for (int i = 0; i < n; i++) {
                        if (idSucursal == Integer.parseInt(objConn.rs.getString(1))) {
                            out.println("<option selected value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                        } else {
                            out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                        }
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <%}%>
        <br><br><br>
        <div class="fl_left" style="margin-right: 20px;">
            <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button> 
        </div>

    </form>
    <div>  
        <button onclick='eliminaUsr()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Eliminar &nbsp&nbsp&nbsp</button>
    </div>
</fieldset>
<%objConn.desConnect();%>
