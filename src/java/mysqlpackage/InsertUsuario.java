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
@WebServlet("/insertUsuario")
public class InsertUsuario extends HttpServlet {

    MySqlConn objConn;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();
        String nombre = "";
        String appat = "";
        String apmat = "";
        String password = "";
        String email = "";
        String telefono = "";
        String tipo = "";
        String idSucursal ="";
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
            telefono = request.getParameter("telefono");
            telefono = telefono.trim();
        }
        if (request.getParameter("email") != null) {
            email = request.getParameter("email");
            email = email.trim();
        }
        if (request.getParameter("password1") != null) {
            password = request.getParameter("password1");
            password = password.trim();
        }
        if (request.getParameter("tipo") != null) {
            tipo = request.getParameter("tipo");
            tipo = tipo.trim();
        }
        if (request.getParameter("idSucursal") != null) {
            idSucursal = request.getParameter("idSucursal");
            idSucursal = idSucursal.trim();
        }

        String consulta = "select * from usuario where correo=?;";
        String[] datos = {email};
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
            consulta = "insert into usuario (nombre,ap_paterno,ap_materno,telefono,correo,password,tipo,sucursal_idSucursal) values("
                    + "'" + nombre + "','" + appat + "','" + apmat + "','" + telefono + "','" + email + "',sha2('"
                    + password + "',512),'" + tipo + "','" + idSucursal + "');";
            objConn.Update(consulta);
            objConn.desConnect();
        }
        getServletContext().getRequestDispatcher("/administrador.jsp").forward(request, response);
    }
}
