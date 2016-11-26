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
@WebServlet("/altaSucursal")
public class InsertSucursal extends HttpServlet {

    MySqlConn objConn;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();
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

        String tipo = "";
        if (request.getParameter("nombre") != null) {
            nombre = new String(request.getParameter("nombre").getBytes("ISO-8859-1"), "UTF-8");
            nombre = nombre.trim();
        }
        if (request.getParameter("telefono") != null) {
            telefono = new String(request.getParameter("telefono").getBytes("ISO-8859-1"), "UTF-8");
            telefono = telefono.trim();
        }
        if (request.getParameter("calle") != null) {
            calle = new String(request.getParameter("calle").getBytes("ISO-8859-1"), "UTF-8");
            calle = calle.trim();
        }
        if (request.getParameter("numero") != null) {
            numero = new String(request.getParameter("numero").getBytes("ISO-8859-1"), "UTF-8");
            numero = numero.trim();
        }
        if (request.getParameter("colonia") != null) {
            colonia = new String(request.getParameter("colonia").getBytes("ISO-8859-1"), "UTF-8");
            colonia = colonia.trim();
        }
        if (request.getParameter("ciudad") != null) {
            ciudad = new String(request.getParameter("ciudad").getBytes("ISO-8859-1"), "UTF-8");
            ciudad = ciudad.trim();
        }
        if (request.getParameter("estado") != null) {
            estado = new String(request.getParameter("estado").getBytes("ISO-8859-1"), "UTF-8");
            estado = estado.trim();
        }
        if (request.getParameter("cp") != null) {
            cp = new String(request.getParameter("cp").getBytes("ISO-8859-1"), "UTF-8");
            cp = cp.trim();
        }

        String consulta = "insert into sucursal(nombre,calle,numero,colonia,ciudad,estado,cp,telefono) values(?,?,?,?,?,?,?,?);";
        String[] datos = {nombre,calle,numero,colonia,ciudad,estado,cp,telefono};
        objConn.safeUpdate(consulta, datos);
        objConn.desConnect();
        getServletContext().getRequestDispatcher("/administrador.jsp").forward(request, response);
    }
}
