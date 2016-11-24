<%-- 
    Document   : actualizaContAjax
    Created on : 20-nov-2016, 20:54:23
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
            String consulta;
            int n;
            switch(opcion){
                case 1:
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
                          <button type="button" onclick='habilitar(nombre,appat,apmat,telefono)' style="background-color: #23B8C1"><div id="txtbtn">&nbsp&nbsp&nbsp Modificar &nbsp&nbsp&nbsp</div></button>
                      </p>
                    </fieldset>
        <%
                break;
            
                case 2:
        %>
                    <form id="newsletter" method="post" action="#">
                        <fieldset>
                            <center><div id='msjPass'></div></center><br>
                          <input name="passActual" class="btmspace-15" type="password" value="" placeholder="Contraseña Actual" onchange='checaPassActual(this)'>
                          <input name="password1" class="btmspace-15" type="password" value="" placeholder="Nueva Contraseña" onchange='noVacio(this)'>
                          <input name="password2" class="btmspace-15" type="password" value="" placeholder="Confirmar Contraseña" onchange='checaPass(password1,this)'>
                          <p align="center">
                            <button type="button" onclick='guardaNuevoPass(passActual,password1,password2)' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Guardar &nbsp&nbsp&nbsp</button>
                          </p>
                        </fieldset>
                    </form>
        <%
                break;
                
                case 3:
                %>  <fieldset id="newsletter">
                    <%
                        consulta = "select * from domicilio where Usuario_idUsuario=" + idLogin + ";";
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
                            if (i%2==0){
                                out.print("<div class='one_half first direcciones'>");
                            } else {
                                out.print("<div class='one_half direcciones'>");
                            }
                            out.print("<div class='tachita'>X</div>");
                            out.print("<b>"+objConn.rs.getString(3)+"</b><br>"
                            +objConn.rs.getString(4)+" "+objConn.rs.getString(5)+" <br>"
                            +objConn.rs.getString(6)+" <br>"
                            +objConn.rs.getString(7)+" <br>"
                            +objConn.rs.getString(8)+" <br>"
                            +objConn.rs.getString(9)
                            +"<p align='right'> <a onclick=\"alert('Hola'); show('nuevadir','nuevadir'); show('sombra','sombra');\"> Editar </a> </p>"
                            +"</div>");
                            objConn.rs.next();
                        }    
                    %>
                       
                        <div class="clear"></div>
                        <br>
                        <p align="center">
                            <button onclick='show("nuevadir","nuevadir"); show("sombra","sombra");' style="background-color: #23B8C1">&nbsp&nbsp&nbsp Agregar Dirección &nbsp&nbsp&nbsp</button>
                        </p>
                    </fieldset>
                     <div id="sombra" class="hide" onclick='hide("sombra"); hide("nuevadir");'> </div>
                    <div id="nuevadir" class="hide">
                        <form id="newsletter" method="post" action="insertDireccion.jsp" name="altadireccion">
                            <fieldset>
                                <br>
                                <b><center>Agregar nueva dirección</center></b>
                                <br><br>
                                <input type="hidden" name="idCliente" value="<%=idLogin%>">
                                <input onchange="noVacio(this)" name="dirname" class="btmspace-15" type="text" value="" placeholder="Nombre de dirección">
                                <section class="one_half first">
                                    <input onchange="noVacio(this)" name="calle" class="btmspace-15" type="text" value="" placeholder="Calle">
                                </section>  
                                <section class="one_half">
                                    <input onchange="soloNumeros(this)" name="numero" class="btmspace-15" type="text" value="" placeholder="Número">
                                </section>
                                <input onchange="noVacio(this)" name="colonia" class="btmspace-15" type="text" value="" placeholder="Colonia">
                                <section class="one_half first">
                                <input onchange="soloLetras(this)" name="ciudad" class="btmspace-15" type="text" value="" placeholder="Ciudad">
                                </section>
                                <section class="one_half">
                                    <input onchange="soloNumeros(this)" name="cp" class="btmspace-15" type="text" value="" placeholder="Código Postal">
                                </section>
                                <input onchange="soloLetras(this)" name="estado" class="btmspace-15" type="text" value="" placeholder="Estado">
                                <p align="right">
                                    <button type="submit" value="submit">&nbsp&nbsp&nbsp Agregar &nbsp&nbsp&nbsp</button>
                                </p>
                            </fieldset>
                        </form>
                    </div>
        <%
                break;
                
                case 4:
        %>
                    Holaaa
        <%
                break;
                
                case 5:
        %>
                    Holaaa
        <%
                break;
            }
        %>      
        
    </body>
</html>
