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
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/modificaProductoDB")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class ModificaProductos extends HttpServlet {

    MySqlConn objConn;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        objConn = new MySqlConn();

        // gets values of text fields
        String idProducto, nombre, descCorta, descLarga, precio, categoria;
        idProducto = request.getParameter("idProducto");
        nombre = request.getParameter("nombre");
        descCorta = request.getParameter("descripcion");
        descLarga = request.getParameter("desclarga");
        precio = request.getParameter("precio");
        categoria = request.getParameter("categoria");
        int cantidadSucursales = Integer.parseInt(request.getParameter("cantidadSucursales"));
        System.out.println(idProducto + " " + categoria);
        String consulta = "update producto set nombre='" + nombre
                + "', descripcion='" + descCorta
                + "', descripcion_larga='" + descLarga
                + "', precio_venta='" + precio
                + "', Categoria_idCategoria='" + categoria
                + "' where idProducto='" + idProducto + "';";
        objConn.Update(consulta);
        // obtains the upload file part in this multipart request
        List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName())).collect(Collectors.toList()); // Retrieves <input type="file" name="file" multiple="true">
        try {
            String sql;
            int row = 0;
            PreparedStatement statement;
            // constructs SQL statement
            int size = fileParts.size();
            if (size == 1) {
                if (fileParts.get(0).getSize() == 0) {
                    size = 0;
                }
            }
            if (size != 0) {
                sql = "delete from imagen where Producto_idProducto = '" + idProducto + "';";
                objConn.Update(sql);
                consulta = "insert into imagen(imagen,Producto_idProducto,promocion) values(?,?,?);";
                statement = objConn.prepareStatement(consulta);
                statement.setString(2, idProducto);
                statement.setInt(3, 0);
                for (Part filePart : fileParts) {
                    InputStream fileContent = filePart.getInputStream();
                    statement.setBlob(1, fileContent);
                    row = statement.executeUpdate();
                    if (row > 0) {
                        System.out.println("Insercion imagen correcta");
                    }
                }
            }
            
            for (int i = 0; i < cantidadSucursales; i++) {
                consulta = "select * from producto_has_sucursal where producto_idProducto='" + idProducto + "' and sucursal_idSucursal='" + request.getParameter("suc" + i) + "';";
                objConn.Consult(consulta);
                int n = 0;
                if (objConn.rs != null) {
                    try {
                        objConn.rs.last();
                        n = objConn.rs.getRow();
                        objConn.rs.first();
                    } catch (Exception e) {
                    }
                }
                if(n==0){ // no existe el registro en la tabla producto_has_sucursal
                    consulta = "insert into producto_has_sucursal values('" + idProducto + "','" + request.getParameter("suc" + i)
                            + "','" + request.getParameter("cantidad" + i) + "');";
                    objConn.Update(consulta);
                }
                if (!request.getParameter("cantidad" + i).equals("0")) {
                    consulta = "update producto_has_sucursal set producto_idProducto='" + idProducto + "',sucursal_idSucursal='" + request.getParameter("suc" + i)
                            + "',cantidad='" + request.getParameter("cantidad" + i) + "');";
                    objConn.Update(consulta);
                }else{
                    consulta = "delete from producto_has_sucursal where producto_idProducto ='" + idProducto + "' and"
                            + " sucursal_idSucursal='" + request.getParameter("suc" + i) + "';";
                    objConn.Update(consulta);
                }
            }

            // sends the statement to the database server
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
