<%-- 
    Document   : modificaProd
    Created on : 23-nov-2016, 14:28:17
    Author     : monic
--%>

<%@page import="mysqlpackage.MySqlConn"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    int n;
    String idCategoria = request.getParameter("idCategoria");
    String idProducto = request.getParameter("idProducto");
    int op = Integer.parseInt(request.getParameter("op"));
    if (op == 1) {
        consulta = "select idProducto, nombre from producto where Categoria_idCategoria=" + idCategoria + ";";
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
<div class="caja">
    <select name="idProducto" onchange='cargaProductos(this)'>
        <option disabled selected> Selecciona el Producto... </option>
        <%
            for (int i = 0; i < n; i++) {
                out.print("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                objConn.rs.next();
            }
        %>
    </select>
</div>
<%
} else {
    consulta = "select * from producto where idProducto=?;";
    String[] datos = {idProducto};
    //Ejecutamos la consulta
    objConn.safeConsult(consulta, datos);
    String categoria = objConn.rs.getString(6);
%> 
<fieldset id="newsletter">
    <form method="post" name="modProd" action="modificaProductoDB" enctype="multipart/form-data">

        <input type="hidden" name="idProducto" id="idProducto" value="<%=idProducto%>"/>
        <b>Nombre:<br></b>
        <input onchange='noVacio(this)' name="nombre" class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Nombre" style="border-color: rgb(60, 179, 113)">
        <b><br>Descripción Corta:<br></b>
        <input onchange='noVacio(this)' name="descripcion" class="btmspace-15" type="textarea" value="<%=objConn.rs.getString(3)%>" placeholder="Descripción" style="border-color: rgb(60, 179, 113)">
        <b><br>Descripcion Larga:<br></b>
        <textarea onchange='noVacio(this)' class="btmspace-15" name="desclarga" cols="60" rows="5" placeholder="Descripción larga" style="padding: 8px; border-color: rgb(60, 179, 113)"><%=objConn.rs.getString(4)%></textarea>
        <b><br>Precio de Venta:<br></b>
        <input onchange='soloNumeros(this)' name="precio" class="btmspace-15" type="text" value="<%=objConn.rs.getString(5)%>" placeholder="Precio de venta" style="border-color: rgb(60, 179, 113)">
        <b><br>Categoría:<br></b>
        <div class="caja">
            <select name="categoria">
                <option disabled> Categoría... </option> 
                <%
                    consulta = "select idCategoria, nombre from categoria;";
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
                        if (categoria.equals(objConn.rs.getString(1))) {
                            out.println("<option selected value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                        } else {
                            out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                        }
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="container">
            <%
                consulta = "select * from imagen where Producto_idProducto='" + idProducto + "';";
                String tmp;
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
                    tmp = objConn.rs.getString(1);
                    if (i % 3 == 0) {
            %>
            <div class="one_third first">
                <%} else {%>
                <div class="one_third">
                    <%}%>
                    <img src='returnImagen.jsp?idImagen=<%=objConn.rs.getString(1)%>' alt=''>
                </div>
                <%
                        objConn.rs.next();
                    }
                %>
            </div>
            <section class="one_half first">
                <input id="uploadFile" name="uploadFile" placeholder="Elegir Archivo" disabled="disabled"/>
            </section>
            <section class="one_half">
                <div class="fileUpload btn btn-primary">
                    <span>Cargar</span>
                    <input name="file" multiple="true" accept="image/*" id="uploadBtn"type="file" class="upload" onchange='cambiaValor(this.value)'/>  
                </div>
            </section>
            <div class="clear"></div>
            <%
                consulta = "select * from sucursal;";
                MySqlConn objConn2 = new MySqlConn();
                objConn.Consult(consulta);
                int cantidad = 0;
                n = 0;
                if (objConn.rs != null) {
                    try {
                        objConn.rs.last();
                        n = objConn.rs.getRow();
                        objConn.rs.first();
                    } catch (Exception e) {
                    }
                }
                if (n > 0) {
                    out.println("<input name='cantidadSucursales' value='" + n + "' type='hidden'>");
                    out.println("<br>");
                    out.println("<b>&nbsp&nbsp&nbsp&nbsp&nbsp Cantidad a modificar</b>");
                    out.println("<br><br>");
                    for (int i = 0; i < n; i++) {
                        cantidad = 0;
                        consulta = "select * from producto_has_sucursal where sucursal_idSucursal='" + objConn.rs.getString(1) + "';";
                        objConn2.Consult(consulta);
                        int n2 = 0;
                        if (objConn2.rs != null) {
                            try {
                                objConn2.rs.last();
                                n2 = objConn2.rs.getRow();
                                objConn2.rs.first();
                            } catch (Exception e) {
                            }
                        }
                        if (n2 > 0) { // si existe el producto en la sucursal
                            cantidad = Integer.parseInt(objConn2.rs.getString(3));
                        }

            %>


            <input name="suc<%=i%>" value="<%=objConn.rs.getString(1)%>" type="hidden">
            <section class="three_quarter first">
                <input disabled type="text" value="Sucursal <%=objConn.rs.getString(2)%>:" style="border:0px;border-color: rgb(60, 179, 113);text-align:right;"/>
            </section>
            <section class="one_quarter">
                <section class="one_half">
                    <input name="cantidad<%=i%>" id="cantidad" type="text" value="<%=cantidad%>" onchange="soloNumeros(this);" style="border-color: rgb(60, 179, 113);text-align:right;"/>
                </section>
            </section>
            <%
                        objConn.rs.next();
                        objConn2.rs.next();
                    }
                    objConn2.desConnect();
                }%>
            <br><br><br>
            <div class="fl_left" style="margin-right: 20px;">
                <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button> 
            </div>


    </form>
    <div>  
        <button onclick='eliminaProd()' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Eliminar &nbsp&nbsp&nbsp</button>
    </div>
</fieldset>
<%
    }
    objConn.desConnect();
%>