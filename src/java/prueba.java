
import mysqlpackage.producto;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author alan_
 */
public class prueba {
    ArrayList<producto> a = new ArrayList<>();
    public static void main(String[] args) {
        prueba x = new prueba();
        x.a.add(new producto(1,2,3));
        x.a.add(new producto(1,2,3));
        System.out.println(x.a.toString());
    }
}
