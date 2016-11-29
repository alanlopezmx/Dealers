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
            String idLogin = (String) session.getAttribute("id");
            String tipo = (String) session.getAttribute("tipo");
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
                    <input id="uploadFile" name="uploadFile" placeholder="Elegir Imágenes" disabled="disabled" />
                </section>
                <section class="one_half">
                    <div class="fileUpload btn btn-primary">
                        <span>Cargar</span>
                        <input multiple accept="image/*" name="file" id="uploadBtn" type="file" class="upload" onchange='cambiaValor(this.value)'/>
                    </div>
                </section>
                <div class="clear"></div>
                <br>
                <%                    consulta = "select * from sucursal;";
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
                    if (n > 0) {
                        out.println("<input name='cantidadSucursales' value='" + n + "' type='hidden'>");
                        out.println("<br>");
                        out.println("<b>&nbsp&nbsp&nbsp&nbsp&nbsp Cantidad a agregar</b>");
                        out.println("<br><br>");
                        for (int i = 0; i < n; i++) {
                %>


                <input name="suc<%=i%>" value="<%=objConn.rs.getString(1)%>" type="hidden">
                <section class="three_quarter first">
                    <input disabled type="text" value="Sucursal <%=objConn.rs.getString(2)%>:" style="border:0px;border-color: rgb(60, 179, 113);text-align:right;"/>
                </section>
                <section class="one_quarter">
                    <section class="one_half">
                        <input name="cantidad<%=i%>" id="cantidad" type="text" value="0" onchange="soloNumeros(this);" style="border-color: rgb(60, 179, 113);"/>
                    </section>
                </section>
                <%
                            objConn.rs.next();
                        }
                    }%>
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) + "</option>");
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) + "</option>");
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
                    <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange="checaPass(password1, this)">
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) + "</option>");
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
        %>  <form id="newsletter" action="uploadImagen" method="post" enctype="multipart/form-data" name="altapromocion">
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
                    <input id="uploadFile" name="uploadFile" placeholder="Elegir Imágenes" disabled="disabled" />
                </section>
                <section class="one_half">
                    <div class="fileUpload btn btn-primary">
                        <span>Cargar</span>
                        <input multiple accept="image/*" name="file" id="uploadBtn" type="file" class="upload" onchange='cambiaValor(this.value)'/>
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

            case 12: // Agregar sucursal
        %>
        <form id="newsletter" method="post" action="altaSucursal" name="altasucursal">
            <fieldset>
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos de la sucursal</b>
                <br><br>
                <input class="btmspace-15" type="text" value="" placeholder="Nombre" name="nombre" onchange="noVacio(this)">
                <section class="one_half first">
                    <input class="btmspace-15" type="text" value="" placeholder="Calle" name="calle" onchange="noVacio(this)">
                </section>
                <section class="one_half">
                    <input class="btmspace-15" type="text" value="" placeholder="Número" name="numero" onchange="soloNumeros(this)">
                </section>
                <section class="one_half first">
                    <input class="btmspace-15" type="text" value="" placeholder="Colonia" name="colonia" onchange="noVacio(this)">
                </section>
                <section class="one_half">
                    <input class="btmspace-15" type="text" value="" placeholder="Ciudad" name="ciudad" onchange="noVacio(this)">
                </section>
                <section class="one_half first">
                    <input class="btmspace-15" type="text" value="" placeholder="Estado" name="estado" onchange="noVacio(this)">
                </section>  
                <section class="one_half">
                    <input class="btmspace-15" type="text" value="" placeholder="Código Postal" name="cp" onchange="soloNumeros(this)">
                </section>
                <input class="btmspace-15" type="text" value="" placeholder="Teléfono" name="telefono" onchange="soloNumeros(this)">
                <p align="right">
                    <button type="submit" value="submit">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                break;

            case 13: //Modificar o Eliminar Sucursal
        %> 
        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Modificar Sucursal</b>
        <br><br>
        <div class="caja">
            <select name="idSucursal" onchange='cargaSucursal(this)'>
                <option value="0" disabled selected> Selecciona la sucursal... </option> 
                <%
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="datosSucursal"></div>
        <%          break;
            case 14: //datos personales
        %>
        <fieldset id="newsletter">
            <%
                consulta = "select nombre, ap_paterno, ap_materno, telefono from usuario where idUsuario=?;";
                String[] datos = {idLogin};
                //Ejecutamos la consulta
                objConn.safeConsult(consulta, datos);
            %>
            <input onchange='soloLetras(this)' id="nombre" name="nombre" class="btmspace-15" type="text" value="<%=objConn.rs.getString(1)%>" placeholder="Nombre" disabled>
            <section class="one_half first">
                <input onchange='soloLetras(this)' id="appat" name="appat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(2)%>" placeholder="Apellido Paterno" disabled>
            </section>
            <section class="one_half">
                <input onchange='soloLetras(this)' id="apmat" name="apmat" class="btmspace-15" type="text" value="<%=objConn.rs.getString(3)%>" placeholder="Apellido Materno" disabled>
            </section>
            <input onchange='soloNumeros(this)' id="telefono" name="telefono" class="btmspace-15" type="text" value="<%=objConn.rs.getString(4)%>" placeholder="Teléfono" disabled>
            <p align="center">
                <button type="button" onclick='habilitar(nombre, appat, apmat, telefono)' style="background-color: #23B8C1"><div id="txtbtn">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</div></button>
            </p>
        </fieldset>
        <%
                break;
            case 15: // modificar contraseña
        %>
        <form id="newsletter" method="post" action="#">
            <fieldset>
                <center><div id='msjPass'></div></center><br>
                <input name="passActual" class="btmspace-15" type="password" value="" placeholder="Contraseña Actual" onchange='checaPassActual(this)'>
                <input name="password1" class="btmspace-15" type="password" value="" placeholder="Nueva Contraseña" onchange='noVacio(this)'>
                <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange='checaPass(password1, this)'>
                <p align="center">
                    <button type="button" onclick='guardaNuevoPass(passActual, password1, password2)' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Guardar &nbsp&nbsp&nbsp</button>
                </p>
            </fieldset>
        </form>
        <%
                break;
            case 16: // historial de ventas
                if (tipo.equals("ADMINISTRADOR")) {
                    consulta = "select venta.*,usuario.correo from venta, usuario where usuario.idUsuario = venta.Usuario_idUsuario and estado_venta=4 order by venta.fecha desc;";
                } else {
                    consulta = "select venta.*,usuario.correo from venta, usuario where usuario.idUsuario =" + idLogin + " and venta.Usuario_idUsuario = usuario.idUsuario and estado_venta=4 order by venta.fecha desc;";
                }
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

                if (n == 0) {
        %> 
        <br>
        <b><center>No se ha concretado ninguna venta aún</center></b>
        <br><br>
        <%
        } else {
        %> <table>
            <tr>
                <th>ID de Venta </th>
                <th>Correo</th>
                <th>Fecha</th>
                <th>Met. de Pago</th>
                <th>Total</th>
                <th>Opciones</th>
            </tr>
            <%
                    for (int i = 0; i < n; i++) {
                        out.print("<tr>");
                        out.print("<td>" + objConn.rs.getString(1) + "</td>"
                                + "<td>" + objConn.rs.getString(8) + "</td>"
                                + "<td>" + objConn.rs.getString(3) + "</td>"
                                + "<td>" + objConn.rs.getString(7) + "</td>"
                                + "<td>$" + objConn.rs.getString(4) + "</td>"
                                + "<td><a href='#' onclick=\"detalleCompra(" + objConn.rs.getString(1) + ",'Venta','" + objConn.rs.getString(5) + "'); show('sombra', 'sombra'); show('carrito', 'carrito wrapper row3')\">Ver detalle</a></td>");
                        objConn.rs.next();
                    }
                }

            %>
        </table>
        <div id="sombra" class="hide" onclick='hide("sombra"); hide("carrito");'></div>
        <div id="carrito" class="wrapper row3 hide" style="top: -10%;"> </div>
        <%                break;
            case 17: // alta vendedor
        %>
        <form id="newsletter" method="post" action="insertUsuario" name="altavendedor">
            <fieldset>
                <br>
                <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del vendedor</b>
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
                    <select name="idSucursal" onchange='cargaSucursal(this)'>
                        <option value="0" disabled selected> Selecciona la sucursal... </option> 
                        <%
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
                                out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                                objConn.rs.next();
                            }
                        %>
                    </select>
                </div>
                <input name="tipo" value="VENDEDOR" type="hidden"/>
                <p align="right">
                    <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                </p>

            </fieldset>
        </form>
        <%
                break;

            case 18: // modificar vendedor
        %>
        <br>
        <b>&nbsp&nbsp&nbsp&nbsp&nbsp Modificar vendedor</b>
        <br><br>
        <div class="caja">
            <select name="idVendedor" onchange='cargaVendedor(this)'>
                <option value="0" disabled selected> Selecciona al vendedor... </option> 
                <%
                    consulta = "select idUsuario, nombre,ap_paterno,ap_materno from usuario where tipo='VENDEDOR';";
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) + "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
        <br>
        <div id="datosVendedor"></div>
        <%
                break;

            case 19: // ver pedidos
                if (tipo.equals("ADMINISTRADOR")) {
                    consulta = "select venta.*,usuario.correo from venta, usuario where usuario.idUsuario = venta.Usuario_idUsuario and estado_venta!=4 order by venta.fecha desc;";
                } else {
                    consulta = "select sucursal.nombre from sucursal, usuario where usuario.idUsuario = '" + idLogin + "' and sucursal.idSucursal = usuario.Sucursal_idSucursal;";
                    objConn.Consult(consulta);
        %>
        <p align="right"><b> Sucursal:</b> <%=objConn.rs.getString(1)%> </p>
        <%
                consulta = "select distinct venta.*,usuario.correo from venta, usuario, producto_has_venta"
                        + " where usuario.idUsuario =" + idLogin
                        + " and producto_has_venta.Sucursal_idSucursal = usuario.Sucursal_idSucursal"
                        + " and usuario.Sucursal_idSucursal = producto_has_venta.Sucursal_idSucursal"
                        + " and usuario.idUsuario = venta.Usuario_idUsuario"
                        + " and estado_venta!=4 order by venta.fecha desc;";
            }
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

            if (n == 0) {
        %> 
        <br>
        <b><center>No hay pedidos pendientes</center></b>
        <br><br>
        <%
        } else {
        %> <table>
            <tr>
                <th>ID de Pedido </th>
                <th>Correo</th>
                <th>Fecha</th>
                <th>Estado</th>
                <th>Total</th>
                <th>Opciones</th>
            </tr>
            <%
                    for (int i = 0; i < n; i++) {
                        out.print("<tr>");
                        out.print("<td>" + objConn.rs.getString(1) + "</td>"
                                + "<td>" + objConn.rs.getString(8) + "</td>"
                                + "<td>" + objConn.rs.getString(3) + "</td>"
                                + "<td>" + objConn.rs.getString(5) + "</td>"
                                + "<td>$" + objConn.rs.getString(4) + "</td>"
                                + "<td><a href='#' onclick=\"detalleCompra(" + objConn.rs.getString(1) + ",'Pedido','" + objConn.rs.getString(5) + "'); show('sombra', 'sombra'); show('carrito', 'carrito wrapper row3')\">Ver detalle</a></td>");
                        objConn.rs.next();
                    }
                }

            %>
        </table>
        <div id="sombra" class="hide" onclick='hide("sombra"); hide("carrito");'></div>
        <div id="carrito" class="wrapper row3 hide" style="top: -10%;"> </div>
        <%                break;
            case 20:
        %>
        <fieldset id="newsletter">
            <div class="caja fl_right">
            <select id="idProveedor" name="idProveedor" onchange='cargaProveedor(this)'>
                <option value="0" disabled selected> Selecciona al proveedor... </option> 
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
                        out.println("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + " " + objConn.rs.getString(3) + " " + objConn.rs.getString(4) + "</option>");
                        objConn.rs.next();
                    }
                %>
            </select>
        </div>
            <br><br>
        <table id="pedidoProv">
            <tr>
                <th>ID Producto </th>
                <th>Nombre Producto</th>
                <th>Cantidad</th>
                <th>Precio Compra</th>
                <th>Total</th>
            </tr>
            <tr>
                <td></td>
                <td><input type="text" onkeyup="buscaProd(event,this)"/></td>
                <td><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57'onchange="sacaTotal(this)"/></td>
                <td><input type="text" onkeypress='return event.charCode >= 48 && event.charCode <= 57' onchange="sacaTotal(this)"/></td>
                <td></td>
            </tr>
        </table>
        <div class="one_quarter first">
            <button onclick="newRow(pedidoProv)" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Añadir &nbsp&nbsp&nbsp</button>
        </div>
        <div class="one_quarter"></div>
        <div class="one_half">    
            <button onclick="realizarPedido(pedidoProv,idProveedor.value)" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Realizar Pedido &nbsp&nbsp&nbsp</button>
        </div>
        </fieldset>
            <%
            break;
            
            case 21: // historial de compras
                consulta = "select * from historialCompras order by fecha desc;";
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

                if (n == 0) {
        %> 
        <br>
        <b><center>No se ha hecho ninguna compra aún.</center></b>
        <br><br>
        <%
        } else {
        %> <table>
            <tr>
                <th>ID de Compra </th>
                <th>Nombre Proveedor</th>
                <th>Fecha</th>
                <th>Total</th>
                <th>Opciones</th>
            </tr>
            <%
                    for (int i = 0; i < n; i++) {
                        out.print("<tr>");
                        out.print("<td>" + objConn.rs.getString(2) + "</td>"
                                + "<td>" + objConn.rs.getString(1) + "</td>"
                                + "<td>" + objConn.rs.getString(4) + "</td>"
                                + "<td>$" + objConn.rs.getString(5) + "</td>"
                                + "<td><a href='#' onclick=\"detalleCompraProv(" + objConn.rs.getString(2) + "); show('sombra', 'sombra'); show('carrito', 'carrito wrapper row3')\">Ver detalle</a></td>");
                        objConn.rs.next();
                    }
                }

            %>
        </table>
        <div id="sombra" class="hide" onclick='hide("sombra"); hide("carrito");'></div>
        <div id="carrito" class="wrapper row3 hide" style="top: -10%;"> </div>
        <%
                break;
            }
            objConn.desConnect();
        %>
    </body>
</html>
