<%-- 
    Document   : verificaPass
    Created on : 23-nov-2016, 8:56:37
    Author     : monic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
 <jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    String pass = request.getParameter("pass");
    String idLogin = request.getParameter("idLogin");
    int op = Integer.parseInt(request.getParameter("op"));
    if (op == 1){
        consulta = "select * from usuario where idUsuario=? and password=sha2(?,512);";
        String []datos = {idLogin,pass};
        objConn.safeConsult(consulta, datos);  
        int n=0;
        if(objConn.rs != null){
            try{
                objConn.rs.last();
                n = objConn.rs.getRow();
                objConn.rs.first();
            }catch(Exception e){
            }
        }
        if (n==0){
            %>Incorrecto<%
        } else {
            %>Correcto<%
        }
    } else {
        consulta = "update usuario set password=sha2(?,512) where idUsuario=?;";
        String []datos = {pass,idLogin};
        objConn.safeUpdate(consulta, datos);
    }
%>