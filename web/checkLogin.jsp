<%-- 
    Document   : checkLogin
    Created on : 20-nov-2016, 20:25:47
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
        <jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
        <%
            String email = "";
            String password = "";
            if(request.getParameter("email")!=null){
                email =new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
            }
            if(request.getParameter("password")!=null){
                password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8");
            }
            //base de datos
            String consulta = "select idCliente,nombre,ap_paterno,ap_materno,tipo from usuario where correo=? and password=sha2(?,512);";
            String[] datos = {email,password};
            //Ejecutamos la consulta
            objConn.safeConsult(consulta, datos);
            //n indicara cuantos registros cumplen las condiciones
            int n=0;
            if(objConn.rs != null){
                try{
                    objConn.rs.last();
                    n = objConn.rs.getRow();
                }catch(Exception e){
                }
            }
            
            //si existe almenos un registro
            if(n > 0){
                String nombre = objConn.rs.getString(2);
                session.setAttribute("email", email);
                session.setAttribute("nombre", nombre);
                session.setAttribute("id",objConn.rs.getString(1));
                session.setAttribute("tipo", objConn.rs.getString(5));
                objConn.desConnect();
   
            } else{
                %>
                Email o Contraseña incorrectos<br>Vuelve a intentarlo  
            <%
            }
            %>
