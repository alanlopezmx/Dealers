<%-- 
    Document   : adminAjax
    Created on : 21-nov-2016, 2:09:48
    Author     : monic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <script src="layout/scripts/validaFormularios.js"></script>
    </head>
    <body>
        <%
            int opcion = Integer.parseInt(request.getParameter("op"));
            String idLogin = request.getParameter("idLogin");
            int n;
            String consulta;
            switch (opcion) {
                case 1: // Alta Producto
        %>
        <form id="newsletter" method="post" action="insertProducto" name="altaproducto" enctype="multipart/form-data">
            <fieldset>
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del producto</b>
                <br><br>
                <input name="nombre" onchange='noVacio(this)' class="btmspace-15" type="text" value="" placeholder="Nombre">
                <input name="descripcion" onchange='noVacio(this)' class="btmspace-15" type="textarea" value="" placeholder="Descripción">
                <textarea name="descripcion_larga" onchange='noVacio(this)' class="btmspace-15" name="comment" cols="60" rows="5" placeholder="Descripción larga" style="padding: 8px"></textarea>
                <input name="precio_venta" onchange='soloNumeros(this)' class="btmspace-15" type="text" value="" placeholder="Precio de venta">
                <div class="caja">
                    <select name="categoria">
                        <option value="0" disabled selected> Categoría... </option> 
                        <%
                            consulta = "select idCategoria,nombre from categoria;";
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
                                out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                                objConn.rs.next();
                            }

                        %>
                    </select>
                </div>
                <br>
                <section class="one_half first">
                    <input id="uploadFile" placeholder="Elegir Imágenes" disabled="disabled" />
                </section>
                <section class="one_half">
                    <div class="fileUpload btn btn-primary">
                        <span>Cargar</span>
                        <input multiple accept="image/*" name="file" id="uploadBtn" type="file" class="upload" onchange='cambiaValor(this.value)'/>
                    </div>
                </section>
                <br><br><br>
                <p align="left">
                    <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%                break;

            case 2: // Modificar producto
        %>
        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Modificar Productos</b>
        <br><br>
        <div class="caja">
            <select name="idCategoria" onchange='cargaListaProd(this)'>
                <option disabled selected> Selecciona Categoría... </option> 
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="seleccionaProd"></div>
        <br>
        <div id="datosProd"></div>
        <%
                break;

            case 3: // Alta categoria
        %>
        <form id="newsletter" method="post" action="uploadCat" name="altacategoria" enctype="multipart/form-data">
            <fieldset>
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos de la categoría</b>
                <br><br>
                <input name="nombre" class="btmspace-15" type="text" value="" placeholder="Nombre" onchange="soloLetras(this)">
                <section class="one_half first">
                    <input id="uploadFile" placeholder="Elegir Archivo" disabled="disabled"/>
                </section>
                <section class="one_half">
                    <div class="fileUpload btn btn-primary">
                        <span>Cargar</span>
                        <input name="file" id="uploadBtn"type="file" class="upload" onchange='cambiaValor(this.value)'/>  
                    </div>
                </section>
                <br><br><br>
                <p align="left">
                    <button type="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                break;

            case 4: // modificar categoria
        %>
        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Modificar Categorias</b>
        <br><br>
        <div class="caja">
            <select name="idCategoria" onchange='cargaCat(this)'>
                <option disabled selected> Selecciona Categoría... </option> 
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="datosCat"></div>
        <%
                break;
            case 5: // alta cliente
        %>
        <form id="newsletter" method="post" action="insertUsuario" name="altacliente">
            <fieldset>
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del cliente</b>
                <br><br>
                <input name="nombre" class="btmspace-15" type="text" value="" placeholder="Nombre" onchange="soloLetras(this)">
                <section class="one_half first">
                    <input name="appat" class="btmspace-15" type="text" value="" placeholder="Apellido Paterno" onchange="soloLetras(this)">
                </section>
                <section class="one_half">
                    <input name="apmat" class="btmspace-15" type="text" value="" placeholder="Apellido Materno" onchange="soloLetrasyNull(this)">
                </section>
                <input name="telefono" class="btmspace-15" type="text" value="" placeholder="Teléfono" onchange="soloNumeros(this)">
                <input name="email" class="btmspace-15" type="text" value="" placeholder="Correo" onchange="noVacio(this)">
                <section class="one_half first">
                    <input name="password1" class="btmspace-15" type="password" value="" placeholder="Contraseña" onchange="noVacio(this)">
                </section>  
                <section class="one_half">
                    <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange="checaPass(password1, this)">
                </section>
                <div class="caja">
                    <select name="tipo">
                        <option disabled selected> Tipo de Cliente... </option> 
                        <option value="NORMAL">Normal</option>
                        <option value="MAYORITARIO">Mayoritario</option>
                    </select>
                </div>
                <p align="right">
                    <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                break;

            case 6: // modificar cliente
        %>
         <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Modificar Clientes</b>
        <br><br>
        <div class="caja">
            <select name="idCliente" onchange='cargaUsuario(this)'>
                <option disabled selected> Selecciona al cliente... </option> 
                <%
                    consulta = "select idUsuario, nombre,ap_paterno,ap_materno from usuario where tipo in(1,2);";
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) +  "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="datosClient"></div>
        <%
                break;

            case 7: // alta proveedor
        %>  <form id="newsletter" method="post" action="insertProveedor" name="altaproveedor">
            <fieldset>
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del proveedor</b>
                <br><br>
                <input name="nombre" class="btmspace-15" type="text" value="" placeholder="Nombre" onchange="soloLetras(this)">
                <section class="one_half first">
                    <input name="appat" class="btmspace-15" type="text" value="" placeholder="Apellido Paterno" onchange="soloLetras(this)">
                </section>
                <section class="one_half">
                    <input name="apmat" class="btmspace-15" type="text" value="" placeholder="Apellido Materno" onchange="soloLetrasyNull(this)">
                </section>
                <input name="telefono" class="btmspace-15" type="text" value="" placeholder="Teléfono" onchange="soloNumeros(this)">
                <input name="rfc" class="btmspace-15" type="text" value="" placeholder="RFC" onchange="noVacio(this)">
                <section class="one_half first">
                    <input name="calle" class="btmspace-15" type="text" value="" placeholder="Calle" onchange="noVacio(this)">
                </section>  
                <section class="one_half">
                    <input name="numero" class="btmspace-15" type="text" value="" placeholder="Número" onchange="soloNumeros(this)">
                </section>
                <input name="colonia" class="btmspace-15" type="text" value="" placeholder="Colonia" onchange="noVacio(this)">
                <input name="ciudad" class="btmspace-15" type="text" value="" placeholder="Ciudad" onchange="noVacio(this)">
                <input name="estado" class="btmspace-15" type="text" value="" placeholder="Estado" onchange="noVacio(this)">
                <section class="one_half first">
                    <input name="pais" class="btmspace-15" type="text" value="" placeholder="País" onchange="noVacio(this)">
                </section>
                <section class="one_half">
                    <input name="cp" class="btmspace-15" type="text" value="" placeholder="Código Postal" onchange="soloNumeros(this)">
                </section>
                <p align="right">
                    <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                break;

            case 8: //modificar proveedor
        %>
        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Modificar Proveedores</b>
        <br><br>
        <div class="caja">
            <select name="idProveedor" onchange='cargaProveedor(this)'>
                <option disabled selected> Selecciona al proveedor... </option> 
                <%
                    consulta = "select idProveedor, nombre,ap_paterno,ap_materno from proveedor;";
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) +  "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="datosProveedor"></div>
        <%
                break;

            case 9: // alta administrador
        %>
        <form id="newsletter" method="post" action="insertCliente" name="altaadministrador">
            <fieldset>
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del administrador</b>
                <br><br>
                <input name="tipo" value="ADMINISTRADOR" type="hidden"/>
                <input name="nombre" class="btmspace-15" type="text" value="" placeholder="Nombre" onchange="soloLetras(this)">
                <section class="one_half first">
                    <input name="appat" class="btmspace-15" type="text" value="" placeholder="Apellido Paterno" onchange="soloLetras(this)">
                </section>
                <section class="one_half">
                    <input name="apmat" class="btmspace-15" type="text" value="" placeholder="Apellido Materno" onchange="soloLetrasyNull(this)">
                </section>
                <input name="email" class="btmspace-15" type="text" value="" placeholder="Correo" onchange="validaCorreo(this)">
                <section class="one_half first">
                    <input name="password1" class="btmspace-15" type="password" value="" placeholder="Contraseña" onchange="noVacio(this)">
                </section>  
                <section class="one_half">
                    <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange="checaPass(password1,this)">
                </section>
                <p align="right">
                    <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                break;

            case 10: //modificar administrador
        %>
        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Modificar Administradores</b>
        <br><br>
        <div class="caja">
            <select name="idAdministrador" onchange='cargaAdministrador(this)'>
                <option disabled selected> Selecciona al administrador... </option> 
                <%
                    consulta = "select idUsuario, nombre,ap_paterno,ap_materno from usuario where tipo='ADMINISTRADOR';";
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) +  "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="datosAdministrador"></div>
        <%
                break;

            case 11: // Agregar promocion
        %>  <form id="newsletter" action="uploadImagen" method="post" enctype="multipart/form-data">
            <fieldset>
                <input name="promocion" value="1" type="hidden">
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa la imagen para la nueva promoción</b>
                <br><br>
                <div class="caja">
                    <select name="idProducto" >
                        <option value="0" disabled selected> Selecciona el Producto... </option>
                        <%
                            consulta = "select idProducto,nombre from producto;";
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

                                out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                                objConn.rs.next();
                            }
                        %>
                    </select>
                </div>
                <br>
                <section class="one_half first">
                    <input id="uploadFile" placeholder="Elegir Archivo" disabled="disabled" />
                </section>
                <section class="one_half">
                    <div class="fileUpload btn btn-primary">
                        <span>Cargar</span>
                        <input name="file" id="uploadBtn" type="file" class="upload" onchange='document.getElementById( & apos; uploadFile & apos; ).value = this.value;'/>
                    </div>
                </section>
                <br><br><br>
                <p align="left">
                    <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                    break;
            }
        %>
    </body>
</html>
