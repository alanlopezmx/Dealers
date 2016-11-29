package mysqlpackage;

public class producto implements Comparable<producto>{
    public int idProducto;
    public int idSucursal;
    public int cantidad;
    public int tipoEnvio;
    public int tipoPago;
    public int precio;

    public producto(int idProducto, int idSucursal, int cantidad) {
        this.idProducto = idProducto;
        this.idSucursal = idSucursal;
        this.cantidad = cantidad;
        this.tipoEnvio = 0;
        this.tipoPago = 0;
        this.precio = 0;
    }

    @Override
    public int compareTo(producto o) {
        return this.idSucursal - o.idSucursal;
    }

    @Override
    public String toString() {
        String ret = idProducto + " " + idSucursal + " " + cantidad;
        return ret; //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
