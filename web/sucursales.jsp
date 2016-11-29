<%-- 
    Document   : sucursales
    Created on : 24/11/2016, 10:48:39 AM
    Author     : alan_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta = "select * from sucursal;";
    objConn.Consult(consulta);
    int n=0;
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
            out.print("<div class='one_third first direcciones'>");
        } else {
            out.print("<div class='one_third direcciones'>");
        }
        out.print("<div class='suc'><input class='dir' id='suc-"+ i+1 + "' type='radio' name='suc'/><label class='dir' for='suc-"+ i+1 + "' value="+ objConn.rs.getString(1) +"'></label></div>");
        %>      <h2> <%out.print(objConn.rs.getString(2));%> </h2>
                <b>Domicilio</b>
                <br>
        <%
                out.print(
                objConn.rs.getString(3) + "  #" +
                objConn.rs.getString(4) + "<br> Colonia " +
                objConn.rs.getString(5) + "<br> C.P. " +
                objConn.rs.getString(8) + " <br> " +
                objConn.rs.getString(6) + ", " +
                objConn.rs.getString(7) + "<br>" +
                "<b>Telefono</b><br>" +
                objConn.rs.getString(9) + "<br>" +
                "</div>"); 
        %>
            </div>
        </div>
        <%
        objConn.rs.next();
    }
%>
