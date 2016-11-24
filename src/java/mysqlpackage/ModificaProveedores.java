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
@WebServlet("/modificaProveedor")
public class ModificaProveedores extends HttpServlet {

    MySqlConn objConn;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();
        String idProveedor="";
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
        
        if (request.getParameter("idProveedor") != null) {
            idProveedor = new String(request.getParameter("idProveedor").getBytes("ISO-8859-1"), "UTF-8");
            idProveedor = idProveedor.trim();
        }
        if (request.getParameter("nombre") != null) {
            nombre = new String(request.getParameter("nombre").getBytes("ISO-8859-1"), "UTF-8");
            nombre = nombre.trim();
        }
        if (request.getParameter("appat") != null) {
            appat = new String(request.getParameter("appat").getBytes("ISO-8859-1"), "UTF-8");
            appat = appat.trim();
        }
        if (request.getParameter("apmat") != null) {
            apmat = new String(request.getParameter("apmat").getBytes("ISO-8859-1"), "UTF-8");
            apmat = apmat.trim();
        }
        if (request.getParameter("telefono") != null) {
            telefono = new String(request.getParameter("telefono").getBytes("ISO-8859-1"), "UTF-8");
            telefono = telefono.trim();
        }
        if (request.getParameter("rfc") != null) {
            rfc = new String(request.getParameter("rfc").getBytes("ISO-8859-1"), "UTF-8");
            rfc = rfc.trim();
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
        if (request.getParameter("pais") != null) {
            pais = new String(request.getParameter("pais").getBytes("ISO-8859-1"), "UTF-8");
            pais = pais.trim();
        }
        if (request.getParameter("cp") != null) {
            cp = new String(request.getParameter("cp").getBytes("ISO-8859-1"), "UTF-8");
            cp = cp.trim();
        }

        String consulta = "select * from proveedor where rfc=?;";
        String[] datos = {rfc};
        //Ejecutamos la consulta
        objConn.safeConsult(consulta, datos);
        //n indicara cuantos registros cumplen las condiciones
        int n = 0;
        if (objConn.rs != null) {
            try {
                objConn.rs.last();
                n = objConn.rs.getRow();
            } catch (Exception e) {
            }
        }
        if (n > 0) { // ya existe ese usuario
            objConn.desConnect();

        } else {
            consulta = "update proveedor set nombre=?,ap_paterno=?,ap_materno=?,telefono=?,rfc=?,calle=?,numero=?,colonia=?,ciudad=?,estado=?,pais=?,cp=? where idProveedor=?;";
            String[] datos2={nombre,appat,apmat,telefono,rfc,calle,numero,colonia,ciudad,estado,pais,cp,idProveedor};
            objConn.safeUpdate(consulta,datos2);
            objConn.desConnect();
        }
        getServletContext().getRequestDispatcher("/administrador.jsp").forward(request, response);
    }
}
