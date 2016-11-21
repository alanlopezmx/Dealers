<%-- 
    Document   : returnImage
    Created on : 21-nov-2016, 1:14:00
    Author     : Héctor Alan López Díaz <alanlopez1995@hotmail.com>
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    int img_id = Integer.parseInt(request.getParameter("idCategoria"));
    PreparedStatement pstmt = null;
    OutputStream oImage;
    try {
    pstmt = objConn.prepareStatement("select imagen from categoria where idCategoria=?;");
    pstmt.setInt(1, img_id);
    objConn.rs = pstmt.executeQuery();
    if(objConn.rs.next()) {
        Blob image = objConn.rs.getBlob(1);
        byte barray[] =  image.getBytes(1,(int)image.length());
        response.setContentType("image/png");
        oImage=response.getOutputStream();
        oImage.write(barray);
        oImage.flush();
        oImage.close();
    }
    }
    catch(Exception ex){
        //ex.printStackTrace();
    }finally {
        try{
        if(objConn!=null)
           objConn.desConnect();
        }catch(Exception ex){
           // ex.printStackTrace();
        }
    }
%>