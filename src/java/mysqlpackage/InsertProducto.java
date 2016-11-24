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
import java.util.List;
import java.util.stream.Collectors;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@WebServlet("/insertProducto")
@MultipartConfig(maxFileSize = 16177215)
public class InsertProducto extends HttpServlet {
     
    MySqlConn objConn;
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String descripcion_larga = request.getParameter("descripcion_larga");
        float precio_venta = Float.parseFloat(request.getParameter("precio_venta"));
        int Categoria_idCategoria = Integer.parseInt(request.getParameter("categoria"));
        int lastId = 0;
        List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
        String consulta = "insert into producto(nombre,descripcion,descripcion_larga,precio_venta,Categoria_idCategoria)"
                + " values(?,?,?,?,?);";
        
        try {
            PreparedStatement preparedStatement = objConn.prepareStatement(consulta);
            preparedStatement.setString(1, nombre);
            preparedStatement.setString(2, descripcion);
            preparedStatement.setString(3, descripcion_larga);
            preparedStatement.setFloat(4, precio_venta);
            preparedStatement.setInt(5, Categoria_idCategoria);
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                System.out.println("Insercion correcta");
            }
            consulta = "select max(idProducto) from producto;";
            objConn.Consult(consulta);
            if(objConn.rs!=null){
                lastId = Integer.parseInt(objConn.rs.getString(1));
            }
            consulta = "insert into imagen(imagen,Producto_idProducto,promocion) values(?,?,?);";
            preparedStatement = objConn.prepareStatement(consulta);
            preparedStatement.setInt(2, lastId);
            preparedStatement.setInt(3, 0);
            for (Part filePart : fileParts) {
                InputStream fileContent = filePart.getInputStream();
                preparedStatement.setBlob(1, fileContent);
                row = preparedStatement.executeUpdate();
                if (row > 0) {
                    System.out.println("Insercion imagen correcta");
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