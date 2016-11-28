/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysqlpackage;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/uploadImagen")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class UploadImagen extends HttpServlet {
     
    MySqlConn objConn;
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();
        
        // gets values of text fields
        int idProducto = Integer.parseInt(request.getParameter("idProducto"));
        int promocion = Integer.parseInt(request.getParameter("promocion"));
        String consulta = "select count(*) from imagen where Producto_idProducto='" + idProducto + "' and promocion='" + promocion + "';";
        objConn.Consult(consulta);
        int count = 0;
        if(objConn.rs != null){
            try {
                count = objConn.rs.getInt(1);
            } catch (SQLException ex) {
                Logger.getLogger(UploadImagen.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("file");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
         
        try {
            String sql;
            PreparedStatement statement;
            // constructs SQL statement
            if(count == 0 || promocion == 0){
                sql = "insert into imagen (imagen, Producto_idProducto,promocion) values (?, ?, ?)";
                statement = objConn.prepareStatement(sql);
                statement.setInt(2, idProducto);
                statement.setInt(3, promocion);
                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(1, inputStream);
                }

                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    System.out.println("File uploaded and saved into database");
                }
            }
            else{
               sql = "update imagen set imagen= ? where Producto_idProducto=? and promocion=?";
                statement = objConn.prepareStatement(sql);
                statement.setInt(2, idProducto);
                statement.setInt(3, promocion);
                if (inputStream != null) {
                    // fetches input stream of the upload file for the blob column
                    statement.setBlob(1, inputStream);
                }

                // sends the statement to the database server
                int row = statement.executeUpdate();
                if (row > 0) {
                    System.out.println("File uploaded and saved into database");
                } 
            }
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            if (objConn != null) {
                objConn.desConnect();
            }
        }
        
        getServletContext().getRequestDispatcher("/administrador.jsp").forward(request, response);
        
    }
}