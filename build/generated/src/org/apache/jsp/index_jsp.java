package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Blob;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("\r\n");
      mysqlpackage.MySqlConn objConn = null;
      synchronized (_jspx_page_context) {
        objConn = (mysqlpackage.MySqlConn) _jspx_page_context.getAttribute("objConn", PageContext.PAGE_SCOPE);
        if (objConn == null){
          objConn = new mysqlpackage.MySqlConn();
          _jspx_page_context.setAttribute("objConn", objConn, PageContext.PAGE_SCOPE);
        }
      }
      out.write('\r');
      out.write('\n');

    String nombreLogin="";
    String idLogin="";
    String tipoLogin="";
    if(session.getAttribute("nombre") != null){
        nombreLogin = (String)session.getAttribute("nombre");
        idLogin = (String)session.getAttribute("id");
        tipoLogin = (String)session.getAttribute("tipo");
    }

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<title>Dealers</title>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no\">\r\n");
      out.write("<link href=\"layout/styles/layout.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body id=\"top\">\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<div class=\"wrapper row0\">\r\n");
      out.write("  <div id=\"topbar\" class=\"hoc clear\">\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("    <div class=\"fl_left imglogo\">\r\n");
      out.write("        <a href=\"index.jsp\"> <img src=\"images/logo3.png\"> </a>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"fl_left\">\r\n");
      out.write("       &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp\r\n");
      out.write("    </div>\r\n");
      out.write("    <div id=\"busqueda\" class=\"fl_left\">\r\n");
      out.write("        <form class=\"group\" method=\"post\" action=\"#\">\r\n");
      out.write("          <fieldset>\r\n");
      out.write("            <input type=\"email\" value=\"\" placeholder=\"Busca Aqui&hellip;\">\r\n");
      out.write("            <button class=\"fa fa-search\" type=\"submit\" title=\"Submit\"><em>Submit</em></button>\r\n");
      out.write("          </fieldset>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"fl_right\">\r\n");
      out.write("      <ul>\r\n");
      out.write("          ");
 if(nombreLogin.equals("")){ 
      out.write("\r\n");
      out.write("                <li onclick='show(\"pantalla\", \"pantalla\"); show(\"login\", \"login\")'><a href=\"#\">Iniciar Sesión</a></li>\r\n");
      out.write("                <li><a href=\"registrarse.jsp\">Registrarse</a></li>\r\n");
      out.write("        ");
} else {
      out.write("\r\n");
      out.write("                <li><a href=\"#\"><i class=\"fa fa-shopping-cart\" style=\"font-size:1.8rem;\"></i></a></li>\r\n");
      out.write("                ");

                    if(tipoLogin.equals("NORMAL") || tipoLogin.equals("MAYORITARIO")){
                
      out.write("\r\n");
      out.write("                    <li><a href=\"#\"><i class=\"fa fa-shopping-cart\" style=\"font-size:1.8rem;\"></i></a></li>\r\n");
      out.write("                    <li id=\"username\"> <a href=\"cliente.jsp\"> Bienvenido ");
out.print(nombreLogin);
      out.write("</a></li>\r\n");
      out.write("                ");
}else if(tipoLogin.equals("ADMINISTRADOR")){
      out.write("\r\n");
      out.write("                    <li id=\"username\"> <a href=\"administrador.jsp\"> Bienvenido ");
out.print(nombreLogin);
      out.write("</a></li>\r\n");
      out.write("                ");
}else{
      out.write("\r\n");
      out.write("                    <li><a href=\"#\"><i class=\"fa fa-shopping-cart\" style=\"font-size:1.8rem;\"></i></a></li>\r\n");
      out.write("                    <li id=\"username\"> <a href=\"administrador.jsp\"> Bienvenido ");
out.print(nombreLogin);
      out.write("</a></li>\r\n");
      out.write("                ");
}
      out.write("\r\n");
      out.write("                <li><a href=\"cerrarSesion\"><i class=\"fa fa-sign-out\" style=\"font-size:1.8rem;\"></i></a></li>    \r\n");
      out.write("        ");
 }
      out.write("\r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- Top Background Image Wrapper -->\r\n");
      out.write("<div class=\"bgded overlay\">\r\n");
      out.write("  <!-- ################################################################################################ -->\r\n");
      out.write("\r\n");
      out.write("  <!-- ################################################################################################ -->\r\n");
      out.write("  <!-- ################################################################################################ -->\r\n");
      out.write("  <!-- ################################################################################################ -->\r\n");
      out.write("  <div id=\"pageintro\" class=\"hoc clear\">\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("    <div class=\"flexslider basicslider\">\r\n");
      out.write("      <ul class=\"slides\">\r\n");
      out.write("        ");

            String consulta = "select idImagen from imagen where promocion = 1;";
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
                out.println("<li><article><a href='#'><img src='returnImagen.jsp?idImagen=" + objConn.rs.getString(1) + "' alt=''></a></article></li>");
                objConn.rs.next();
            }
        
      out.write("\r\n");
      out.write("      </ul>\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("  </div>\r\n");
      out.write("  <!-- ################################################################################################ -->\r\n");
      out.write("</div>\r\n");
      out.write("<!-- End Top Background Image Wrapper -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<div class=\"wrapper row3\">\r\n");
      out.write("  <main class=\"hoc container clear\">\r\n");
      out.write("    <!-- main body -->\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("    <div class=\"content\">\r\n");
      out.write("      <!-- ################################################################################################ -->\r\n");
      out.write("      <div id=\"gallery\">\r\n");
      out.write("        <figure>\r\n");
      out.write("          <div class=\"center-div\">\r\n");
      out.write("            <img src=\"images/cate.png\" alt=\"\">\r\n");
      out.write("          </div>\r\n");
      out.write("          <ul class=\"nospace clear\">\r\n");
      out.write("            ");

                consulta = "select idCategoria from categoria;";
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
                int cont = 4;
                for(int i=0;i<n;i++){
                    if(cont == 4){
                        out.println("<li class='one_quarter first'><a href='productos.jsp?idcategoria=" +objConn.rs.getString(1) + "'><img src='returnCategoria.jsp?idCategoria=" + objConn.rs.getString(1) + "' alt=''></a></li>");
                        cont = 0;
                    }
                    else{
                        out.println("<li class='one_quarter'><a href='productos.jsp?idcategoria=" +objConn.rs.getString(1) + "'><img src='returnCategoria.jsp?idCategoria=" + objConn.rs.getString(1) + "' alt=''></a></li>");
                    }
                    objConn.rs.next();
                    cont++;
                }
                objConn.desConnect();
            
      out.write("\r\n");
      out.write("          </ul>\r\n");
      out.write("\r\n");
      out.write("        </figure>\r\n");
      out.write("      </div>\r\n");
      out.write("      <!-- ################################################################################################ -->\r\n");
      out.write("      <!-- ################################################################################################ -->\r\n");
      out.write("\r\n");
      out.write("      <!-- ################################################################################################ -->\r\n");
      out.write("    </div>\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("    <!-- / main body -->\r\n");
      out.write("    <div class=\"clear\"></div>\r\n");
      out.write("  </main>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<div class=\"wrapper row4 bgded overlay\" style=\"background-image:url('images/demo/backgrounds/03.png');\">\r\n");
      out.write("  <footer id=\"footer\" class=\"hoc clear\">\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("    <h3 class=\"heading\">Dealers</h3>\r\n");
      out.write("    <nav>\r\n");
      out.write("      <ul class=\"nospace inline pushright uppercase\">\r\n");
      out.write("        <li></li>\r\n");
      out.write("        <li><a href=\"acercade.jsp\">Acerca de</a></li>\r\n");
      out.write("        <li><a href=\"contacto.jsp\">Contacto</a></li>\r\n");
      out.write("        <li><a href=\"terminos.jsp\">Terminos</a></li>\r\n");
      out.write("      </ul>\r\n");
      out.write("    </nav>\r\n");
      out.write("    <ul class=\"faico clear\">\r\n");
      out.write("      <li><a class=\"faicon-facebook\" href=\"#\"><i class=\"fa fa-facebook\"></i></a></li>\r\n");
      out.write("      <li><a class=\"faicon-twitter\" href=\"#\"><i class=\"fa fa-twitter\"></i></a></li>\r\n");
      out.write("      <li><a class=\"faicon-linkedin\" href=\"#\"><i class=\"fa fa-linkedin\"></i></a></li>\r\n");
      out.write("    </ul>\r\n");
      out.write("    <!-- ################################################################################################ -->\r\n");
      out.write("  </footer>\r\n");
      out.write("</div>\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<div id=\"pantalla\" class=\"hide\" onclick='hide(\"pantalla\"); hide(\"login\");'> </div>\r\n");
      out.write("<div id=\"login\" class=\"hide\">\r\n");
      out.write("    <!--form id=\"newsletter\" name=\"iniciarsesion\"-->\r\n");
      out.write("        <fieldset id=\"newsletter\">\r\n");
      out.write("            <br><b><center><div id=\"datos\">Ingresa tus datos</div></center></b>\r\n");
      out.write("            <i class=\"fa fa-user-o\" style=\"font-size:1.8rem;\"></i>\r\n");
      out.write("            <input id=\"email\" name=\"email\" class=\"btmspace-15\" type=\"text\" value=\"\" placeholder=\"Correo\">\r\n");
      out.write("            <input onkeypress=\"validateEnter(event,email,this)\" id=\"password\" name=\"password\" class=\"btmspace-15\" type=\"password\" value=\"\" placeholder=\"Contraseña\">\r\n");
      out.write("            <p align=\"right\">\r\n");
      out.write("                <button onclick=\"checaLogin(email,password)\">\r\n");
      out.write("                    &nbsp&nbsp&nbsp Ingresar &nbsp&nbsp&nbsp\r\n");
      out.write("                </button>\r\n");
      out.write("            </p>\r\n");
      out.write("        </fieldset>\r\n");
      out.write("    <!--/form-->    \r\n");
      out.write("</div>\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<!-- ################################################################################################ -->\r\n");
      out.write("<a id=\"backtotop\" href=\"#top\"><i class=\"fa fa-chevron-up\"></i></a>\r\n");
      out.write("<!-- JAVASCRIPTS -->\r\n");
      out.write("<script src=\"layout/scripts/jquery.min.js\"></script>\r\n");
      out.write("<script src=\"layout/scripts/jquery.backtotop.js\"></script>\r\n");
      out.write("<script src=\"layout/scripts/jquery.mobilemenu.js\"></script>\r\n");
      out.write("<script src=\"layout/scripts/jquery.flexslider-min.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
