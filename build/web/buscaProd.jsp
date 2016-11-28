<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<jsp:useBean id="objConn" class="mysqlpackage.MySqlConn"/>
<%
    String consulta;
    String buscar = request.getParameter("busqueda");
    if (buscar != null && !buscar.isEmpty()) {
        objConn.Connect();
        consulta = "select idProducto, nombre from producto where nombre like '" + buscar + "%';";
        objConn.Consult(consulta);
%>
<%=objConn.rs.getString(1)%>,<%=objConn.rs.getString(2)%>
<%
    }
    objConn.desConnect();
%>
