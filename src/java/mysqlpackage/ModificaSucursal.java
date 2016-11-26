/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysqlpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Héctor Alan López Díaz <alanlopez1995@hotmail.com>
 */
@WebServlet("/modificaSucursal")
public class ModificaSucursal extends HttpServlet {

    MySqlConn objConn;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();
        String idSucursal = "";
        String nombre = "";
        String appat = "";
        String apmat = "";
        String telefono = "";
        String rfc = "";
        String calle = "";
        String numero = "";
        String colonia = "";
        String ciudad = "";
        String estado = "";
        String pais = "";
        String cp = "";

        if (request.getParameter("idSucursal") != null) {
            idSucursal = new String(request.getParameter("idSucursal").getBytes("ISO-8859-1"), "UTF-8");
            idSucursal = idSucursal.trim();
        }
        if (request.getParameter("nombre") != null) {
            nombre = request.getParameter("nombre");
            nombre = nombre.trim();
        }
        if (request.getParameter("telefono") != null) {
            telefono = new String(request.getParameter("telefono").getBytes("ISO-8859-1"), "UTF-8");
            telefono = telefono.trim();
        }
        if (request.getParameter("calle") != null) {
            calle = request.getParameter("calle");
            calle = calle.trim();
        }
        if (request.getParameter("numero") != null) {
            numero = new String(request.getParameter("numero").getBytes("ISO-8859-1"), "UTF-8");
            numero = numero.trim();
        }
        if (request.getParameter("colonia") != null) {
            colonia = request.getParameter("colonia");
            colonia = colonia.trim();
        }
        if (request.getParameter("ciudad") != null) {
            ciudad = request.getParameter("ciudad");
            ciudad = ciudad.trim();
        }
        if (request.getParameter("estado") != null) {
            estado = request.getParameter("estado");
            estado = estado.trim();
        }
        if (request.getParameter("cp") != null) {
            cp = new String(request.getParameter("cp").getBytes("ISO-8859-1"), "UTF-8");
            cp = cp.trim();
        }
        String consulta = "update sucursal set nombre=?,calle=?,numero=?,colonia=?,ciudad=?,estado=?,cp=?,telefono=? where idSucursal=?;";
        String[] datos = {nombre, calle, numero, colonia, ciudad, estado, cp,telefono, idSucursal};
        objConn.safeUpdate(consulta, datos);
        objConn.desConnect();
        getServletContext().getRequestDispatcher("/administrador.jsp").forward(request, response);
    }
}
