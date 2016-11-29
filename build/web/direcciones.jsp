<%-- 
    Document   : direcciones
    Created on : 24/11/2016, 03:57:34 PM
    Author     : alan_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
    <%
        String idLogin = request.getParameter("idLogin");
        String idSucursal = request.getParameter("idSucursal");
        String consulta;
        int n;
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
            if (i%3==0){
                out.print("<div class='one_third first direcciones'>");
            } else {
                out.print("<div class='one_third direcciones'>");
            }
            int idDir = Integer.parseInt(objConn.rs.getString(1));
            out.print("<div class='dir'><input class='dir' id='dir-" + idDir + "-"+ idSucursal +"' type='radio' name='dir" + idSucursal + "' onclick='tipoEnvio("+idSucursal+","+objConn.rs.getString(1)+")' /><label class='dir dir-5' for='dir-"+ idDir + "-"+ idSucursal + "' value="+ objConn.rs.getString(1) +"'></label></div>");
            out.print("<b>"+objConn.rs.getString(3)+"</b><br>"
            +objConn.rs.getString(4)+" #"+objConn.rs.getString(5)+" <br>Colonia "
            +objConn.rs.getString(6)+" <br>"
            +objConn.rs.getString(7)+", "
            +objConn.rs.getString(8)+" <br>C.P. "
            +objConn.rs.getString(9)
            +"</div>");
            objConn.rs.next();
        }    
    %>
    
                     
