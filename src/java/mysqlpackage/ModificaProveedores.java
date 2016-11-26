/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysqlpackage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            nombre = request.getParameter("nombre");
            nombre = nombre.trim();
        }
        if (request.getParameter("appat") != null) {
            appat = request.getParameter("appat");
            appat = appat.trim();
        }
        if (request.getParameter("apmat") != null) {
            apmat = request.getParameter("apmat");
            apmat = apmat.trim();
        }
        if (request.getParameter("telefono") != null) {
            telefono = new String(request.getParameter("telefono").getBytes("ISO-8859-1"), "UTF-8");
            telefono = telefono.trim();
        }
        if (request.getParameter("rfc") != null) {
            rfc = request.getParameter("rfc");
            rfc = rfc.trim();
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
        if (request.getParameter("pais") != null) {
            pais = request.getParameter("pais");
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
        try {
            if (n > 0 && !objConn.rs.getString(1).equals(idProveedor)) { // ya existe ese usuario
                objConn.desConnect();
                
            } else {
                consulta = "update proveedor set nombre=?,ap_paterno=?,ap_materno=?,telefono=?,rfc=?,calle=?,numero=?,colonia=?,ciudad=?,estado=?,pais=?,cp=? where idProveedor=?;";
                String[] datos2={nombre,appat,apmat,telefono,rfc,calle,numero,colonia,ciudad,estado,pais,cp,idProveedor};
                objConn.safeUpdate(consulta,datos2);
                objConn.desConnect();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ModificaProveedores.class.getName()).log(Level.SEVERE, null, ex);
        }
        getServletContext().getRequestDispatcher("/administrador.jsp").forward(request, response);
    }
}
