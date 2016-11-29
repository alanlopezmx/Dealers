<%-- 
    Document   : agregarCarrito
    Created on : 27/11/2016, 12:46:21 AM
    Author     : alan_
--%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
        <%
            ArrayList<producto> a = (ArrayList<producto>) session.getAttribute("carrito");
            int idProducto = Integer.parseInt(request.getParameter("idproducto"));
            int idSucursal, cantidad = 0;
            String cant;
            String consulta = "select cantidad, idSucursal from existencias where idProducto = "+ idProducto +";";                objConn.Consult(consulta);
                int nSuc = 0;
                if (objConn.rs != null) {
                    try {
                        objConn.rs.last();
                        nSuc = objConn.rs.getRow();
                        objConn.rs.first();
                    } catch (Exception e) {
                    }
                }
                for (int i = 0; i < nSuc; i++) {
                    idSucursal = Integer.parseInt(objConn.rs.getString(2));
                    if(request.getParameter("cant"+idSucursal)!=null){
                        cant = new String(request.getParameter("cant"+idSucursal).getBytes("ISO-8859-1"),"UTF-8");
                        cant=cant.trim();
                        cantidad = Integer.parseInt(cant);
                    }
                    if(cantidad != 0)
                        if(a.isEmpty()){
                            a.add(new producto(idProducto, idSucursal, cantidad));
                        }else{
                            boolean existe = false;
                            for(producto prod: a){
                                if(prod.idProducto == idProducto && prod.idSucursal == idSucursal){
                                    prod.cantidad = cantidad;
                                    existe = true;
                                }
                            }
                            if (!existe)
                                a.add(new producto(idProducto, idSucursal, cantidad));

                        }
                    objConn.rs.next();
                }
            objConn.desConnect();
        %>
        <jsp:forward page="producto.jsp">
            <jsp:param name="mensaje" value="<br>Agregado al carrito.<br>"/>
            <jsp:param name="idproducto" value="<%=idProducto%>"/>
        </jsp:forward>