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
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/uploadCat")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class FileUploadDBServlet extends HttpServlet {
     
    MySqlConn objConn;
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();
        // gets values of text fields
        String nombre = request.getParameter("nombre");
         
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

            // constructs SQL statement
            String sql = "insert into categoria (nombre, imagen) values (?, ?)";
            PreparedStatement statement = objConn.prepareStatement(sql);
            statement.setString(1, nombre);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                System.out.println("File uploaded and saved into database");
            }
        } catch (SQLException ex) {
            System.out.println("ERROR: " + ex.getMessage());
            ex.printStackTrace();
        } finally {
            if (objConn != null) {
                objConn.desConnect();
            }
        }
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }
}