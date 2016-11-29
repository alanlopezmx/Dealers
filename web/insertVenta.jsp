<%-- 
    Document   : insertVenta
    Created on : 28/11/2016, 05:00:57 AM
    Author     : alan_
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="mysqlpackage.producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<jsp:useBean id="objConn2" class="mysqlpackage.MySqlConn"/>
<jsp:useBean id="objConn3" class="mysqlpackage.MySqlConn"/>
<%
    ArrayList<producto> a = (ArrayList<producto>) session.getAttribute("carrito");
    int idLogin = Integer.parseInt(request.getParameter("idLogin"));
    String consulta,consulta2, consulta3,estado_venta="",metodo_pago="";
    int idSucursal=0, total=0, venta;
    idSucursal = a.get(0).idSucursal;
    for(producto prod : a){
        if(prod.idSucursal == idSucursal){
            if(prod.tipoEnvio==0)
                estado_venta = "Pendiente";
            else
                estado_venta = "Pagado";
            if(prod.tipoPago == 0 )
                metodo_pago = "Efectivo";
            else
                metodo_pago = "Tarjeta";
            total += prod.precio * prod.cantidad;
        }else{
            if(metodo_pago.equals("Tarjeta"))
                total+=99;
            consulta = "insert into venta (Usuario_idUsuario, fecha, total, estado_venta,guia_rastreo,metodo_pago) values('"
                    + idLogin + "',"
                    + "current_timestamp()" + ",'"
                    + total + "','"
                    + estado_venta + "','"
                    + "" + "','"
                    + metodo_pago + "');";
            objConn.Update(consulta);
            consulta = "select idVenta from venta;";
            objConn.Consult(consulta);
            objConn.rs.last();
            venta = Integer.parseInt(objConn.rs.getString(1));
            for(producto aux: a){
                if(aux.idSucursal == idSucursal){
                    consulta2 = "insert into producto_has_venta values('"
                    + aux.idProducto + "','"
                    + venta + "','"
                    + idSucursal + "','"
                    + aux.cantidad + "','"
                    + aux.precio + "');";
                    objConn2.Update(consulta2);
                }
            }
            total = prod.precio * prod.cantidad;
            idSucursal = prod.idSucursal;
            if(prod.tipoEnvio==0)
                estado_venta = "Pendiente";
            else
                estado_venta = "Pagado";
            if(prod.tipoPago == 0 )
                metodo_pago = "Efectivo";
            else
                metodo_pago = "Tarjeta";
        }
    }
    consulta = "insert into venta (Usuario_idUsuario, fecha, total, estado_venta,guia_rastreo,metodo_pago) values('"
                    + idLogin + "',"
                    + "current_timestamp()" + ",'"
                    + total + "','"
                    + estado_venta + "','"
                    + "" + "','"
                    + metodo_pago + "');";
    objConn.Update(consulta);
    consulta = "select idVenta from venta;";
            objConn.Consult(consulta);
            objConn.rs.last();
            venta = Integer.parseInt(objConn.rs.getString(1));
            for(producto aux: a){
                if(aux.idSucursal == idSucursal){
                    consulta2 = "insert into producto_has_venta values('"
                    + aux.idProducto + "','"
                    + venta + "','"
                    + idSucursal + "','"
                    + aux.cantidad + "','"
                    + aux.precio + "');";
                    objConn2.Update(consulta2);
                }
            }
            for(producto baja: a){
                consulta3 = "update producto_has_sucursal set cantidad =(cantidad-"+baja.cantidad+") where Producto_idProducto = "+baja.idProducto+" and Sucursal_idSucursal = "+baja.idSucursal+";";
                    objConn3.Update(consulta3);
            }
    idSucursal= idSucursal + 0;
    a.clear();
    
%>