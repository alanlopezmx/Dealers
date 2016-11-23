<%-- 
    Document   : modificaProd
    Created on : 23-nov-2016, 14:28:17
    Author     : monic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
 <jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
    <%
        String consulta;
        int n;
        String idCategoria = request.getParameter("idCategoria");
        int op = Integer.parseInt(request.getParameter("op"));
        if (op == 1){
            consulta = "select idProducto, nombre from producto where Categoria_idCategoria="+idCategoria+";";
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
            %>
            <div class="caja">
                <select name="idProducto" onchange='cargaProductos(this)'>
                    <option disabled selected> Selecciona el Producto... </option>
            <%
            for(int i=0;i<n;i++){
                out.print("<option value='" + objConn.rs.getString(1) + "'>" + objConn.rs.getString(2) + "</option>");
                objConn.rs.next();
            }
            %>
                </select>
            </div>
            <%
        } else {
            %>  <fieldset id="newsletter">
                    <input onchange='soloLetras(this)' class="btmspace-15" type="text" value="" placeholder="Nombre">
                    <input class="btmspace-15" type="textarea" value="" placeholder="Descripción">
                    <textarea class="btmspace-15" name="comment" cols="60" rows="5" placeholder="Descripción larga" style="padding: 8px"></textarea>
                    <input class="btmspace-15" type="text" value="" placeholder="Precio de venta">
                    <div class="caja">
                        <select>
                              <option disabled selected> Categoría... </option> 
                              <option>Normal</option>
                              <option>Mayoritario</option>
                        </select>
                      </div>
                    <br>
                    <section class="one_half first">
                          <input id="uploadFile" placeholder="Elegir Imágenes" disabled="disabled" />
                        </section>
                        <section class="one_half">
                          <div class="fileUpload btn btn-primary">
                            <span>Cargar</span>
                            <input multiple accept="image/*" name="file" id="uploadBtn" type="file" class="upload" onchange='document.getElementById(&apos;uploadFile&apos;).value = this.value;'/>
                        </div>
                        </section>
                      <br><br><br>
                    <div class="fl_left" style="margin-right: 20px;">
                      <button style="background-color: #23B8C1">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</button> 
                    </div>
                    <div>  
                      <button style="background-color: #23B8C1">&nbsp&nbsp&nbsp Eliminar &nbsp&nbsp&nbsp</button>
                    </div>
                </fieldset>
            <%
        }
    %>