<%-- 
    Document   : modificaCat
    Created on : 24-nov-2016, 0:47:08
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<!DOCTYPE html>
<%
    int n;
    String idCategoria = request.getParameter("idCategoria");
    String consulta = "select * from categoria where idCategoria='" + idCategoria + "';";
    objConn.Consult(consulta);
%>
<fieldset id="newsletter">
    <form method="post" name="modCat" action="modificaCategorias" enctype="multipart/form-data">
        <input type="hidden" name="idCategoria" id="idCategoria" value="<%=idCategoria%>"/>
        <b>Nombre:<br></b>
        <input onchange='noVacio(this)' name="nombre" class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Nombre" style="border-color: rgb(60, 179, 113)">
        <section class="one_half first">
            <input id="uploadFile" placeholder="Elegir Archivo" disabled="disabled"/>
        </section>
        <section class="one_half">
            <div class="fileUpload btn btn-primary">
                <span>Cargar</span>
                <input name="file" accept="image/*" id="uploadBtn"type="file" class="upload" onchange='cambiaValor(this.value)'/>  
            </div>
        </section>
        <br><br><br>
        <div class="fl_left" style="margin-right: 20px;">
            <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button> 
        </div>
    </form>
    <div>  
        <button onclick='eliminaCat()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Eliminar &nbsp&nbsp&nbsp</button>
    </div>
</fieldset>