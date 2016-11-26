<%-- 
    Document   : modAdmin
    Created on : 24-nov-2016, 2:48:50
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String idUsuario = request.getParameter("idUsuario");
    String consulta = "select * from usuario where idUsuario='" + idUsuario + "';";
    objConn.Consult(consulta);
%>
<!DOCTYPE html>
<fieldset id="newsletter">
    <form method="post" action="modificaUsuario" name="modusr">

        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del cliente</b>
        <br><br>
        <input name='idUsuario' id="idUsuario" value='<%=idUsuario%>' type="hidden"/>
        <input name="nombre" class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Nombre" onchange="soloLetras(this)">
        <section class="one_half first">
            <input name="appat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Apellido Paterno" onchange="soloLetras(this)">
        </section>
        <section class="one_half">
            <input name="apmat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Apellido Materno" onchange="soloLetrasyNull(this)">
        </section>
        <input name="telefono" class="btmspace-15" type="text" value="<%=objConn.rs.getString(5)%>" placeholder="Teléfono" onchange="soloNumeros(this)">
        <input name="email" class="btmspace-15" type="text" value="<%=objConn.rs.getString(6)%>" placeholder="Correo" onchange="noVacio(this)">
        <section class="one_half first">
            <input name="password1" class="btmspace-15" type="password" value="" placeholder="Contraseña" onchange="noVacio(this)">
        </section>  
        <section class="one_half">
            <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange="checaPass(password1, this)">
        </section>
       <br><br><br>
       <input name='tipo' value="ADMINISTRADOR" type="hidden"/>
        <div class="fl_left" style="margin-right: 20px;">
            <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button> 
        </div>

    </form>
    <div>  
        <button onclick='eliminaAdmin()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Eliminar &nbsp&nbsp&nbsp</button>
    </div>
</fieldset>
<%objConn.desConnect();%>