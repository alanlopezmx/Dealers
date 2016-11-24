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
        if (request.getParameter("email") != null) {
            email = new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8");
            email = email.trim();
        }
        if (request.getParameter("password1") != null) {
            password = new String(request.getParameter("password1").getBytes("ISO-8859-1"), "UTF-8");
            password = password.trim();
        }
        if (request.getParameter("tipo") != null) {
            tipo = new String(request.getParameter("tipo").getBytes("ISO-8859-1"), "UTF-8");
            tipo = tipo.trim();
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
            consulta = "insert into usuario (nombre,ap_paterno,ap_materno,telefono,correo,password,tipo) values("
                    + "'" + nombre + "','" + appat + "','" + apmat + "','" + telefono + "','" + email + "',sha2('"
                    + password + "',512),'" + tipo + "');";
            objConn.Update(consulta);
            objConn.desConnect();
        }
        getServletContext().getRequestDispatcher("/administrador.jsp").forward(request, response);
    }
}