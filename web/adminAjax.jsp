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
        <script type="text/javascript">
            document.getElementById("uploadBtn").onchange = function () {
            document.getElementById("uploadFile").value = this.value;
            };
        </script>
    </head>
    <body>
        <%
            int opcion = Integer.parseInt(request.getParameter("op"));
            int n;
            String consulta;
            switch(opcion){
                case 1: // Alta Producto
        %>
                    <form id="newsletter" method="post" action="#" name="altaproducto">
                        <fieldset>
                          <br>
                          <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del producto</b>
                          <br><br>
                          <input class="btmspace-15" type="text" value="" placeholder="Nombre">
                          <input class="btmspace-15" type="textarea" value="" placeholder="Descripción">
                          <textarea class="btmspace-15" name="comment" cols="60" rows="5" placeholder="Descripción larga" style="padding: 8px"></textarea>
                          <input class="btmspace-15" type="text" value="" placeholder="Precio de venta">
                          <p align="right">
                            <button type="submit" value="submit" style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                          </p>
                          </fieldset>
                      </form>
        <%
                break;
                
                case 2: // Modificar producto
        %>
                    Holaaa
        <%
                break;
                
                case 3: // Alta categoria
        %>
                   <form id="newsletter" method="post" action="#" name="altacategoria">
                    <fieldset>
                      <br>
                      <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos de la categoría</b>
                      <br><br>
                      <input class="btmspace-15" type="text" value="" placeholder="Nombre">
                      <section class="one_half first">
                        <input id="uploadFile" placeholder="Elegir Archivo" disabled="disabled" />
                      </section>
                      <section class="one_half">
                        <div class="fileUpload btn btn-primary">
                          <span>Cargar</span>
                          <input id="uploadBtn" type="file" class="upload"/>
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
                
                case 4: // modificar categoria
        %>
                    Holaaa
        <%
                break;
                case 5: // alta cliente
        %>
                        <form id="newsletter" method="post" action="#" name="altacliente">
                          <fieldset>
                            <br>
                            <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del cliente</b>
                            <br><br>
                            <input class="btmspace-15" type="text" value="" placeholder="Nombre">
                            <section class="one_half first">
                              <input class="btmspace-15" type="text" value="" placeholder="Apellido Paterno">
                            </section>
                            <section class="one_half">
                              <input class="btmspace-15" type="text" value="" placeholder="Apellido Materno">
                            </section>
                            <input class="btmspace-15" type="text" value="" placeholder="Teléfono">
                            <input class="btmspace-15" type="text" value="" placeholder="Correo">
                            <section class="one_half first">
                              <input class="btmspace-15" type="text" value="" placeholder="Contraseña">
                            </section>  
                            <section class="one_half">
                              <input class="btmspace-15" type="text" value="" placeholder="Confirmar Contraseña">
                            </section>
                            <div class="caja">
                              <select>
                                    <option disabled selected> Tipo de Cliente... </option> 
                                    <option>Normal</option>
                                    <option>Mayoritario</option>
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
                    Holaaa
        <%
                break;
                
                case 7: // alta proveedor
                %>  <form id="newsletter" method="post" action="#" name="altaproveedor">
                        <fieldset>
                          <br>
                          <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del proveedor</b>
                          <br><br>
                          <input class="btmspace-15" type="text" value="" placeholder="Nombre">
                          <section class="one_half first">
                            <input class="btmspace-15" type="text" value="" placeholder="Apellido Paterno">
                          </section>
                          <section class="one_half">
                            <input class="btmspace-15" type="text" value="" placeholder="Apellido Materno">
                          </section>
                          <input class="btmspace-15" type="text" value="" placeholder="Teléfono">
                          <input class="btmspace-15" type="text" value="" placeholder="RFC">
                          <section class="one_half first">
                            <input class="btmspace-15" type="text" value="" placeholder="Calle">
                          </section>  
                          <section class="one_half">
                            <input class="btmspace-15" type="text" value="" placeholder="Número">
                          </section>
                          <input class="btmspace-15" type="text" value="" placeholder="Colonia">
                          <input class="btmspace-15" type="text" value="" placeholder="Ciudad">
                          <input class="btmspace-15" type="text" value="" placeholder="Estado">
                          <section class="one_half first">
                            <input class="btmspace-15" type="text" value="" placeholder="País">
                          </section>
                          <section class="one_half">
                            <input class="btmspace-15" type="text" value="" placeholder="Código Postal">
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
                    Holaaa
        <%
                break;
                
                case 9: // alta administrador
        %>
                    <form id="newsletter" method="post" action="#" name="altaadministrador">
                    <fieldset>
                      <br>
                      <b>&nbsp&nbsp&nbsp&nbsp&nbsp Ingresa los datos del administrador</b>
                      <br><br>
                      <input class="btmspace-15" type="text" value="" placeholder="Nombre">
                      <section class="one_half first">
                        <input class="btmspace-15" type="text" value="" placeholder="Apellido Paterno">
                      </section>
                      <section class="one_half">
                        <input class="btmspace-15" type="text" value="" placeholder="Apellido Materno">
                      </section>
                      <input class="btmspace-15" type="text" value="" placeholder="Correo">
                      <section class="one_half first">
                        <input class="btmspace-15" type="text" value="" placeholder="Contraseña">
                      </section>  
                      <section class="one_half">
                        <input class="btmspace-15" type="text" value="" placeholder="Confirmar Contraseña">
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
                    Holaaa
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
                                <select name="idProducto">
                                    <option disabled selected> Selecciona el Producto... </option>
                                    <%
                                        consulta = "select idProducto,nombre from producto;";
                                        objConn.Consult(consulta);
                                        n=0;
                                        if(objConn.rs != null){
                                            try{
                                                objConn.rs.last();
                                                n = objConn.rs.getRow();
                                                objConn.rs.first();
                                            }catch(Exception e){
                                            }
                                        }
                                        for(int i=0;i<n;i++){
                                            
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
                                  <input name="file" id="uploadBtn"type="file" class="upload"/>
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
