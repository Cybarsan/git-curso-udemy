/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilidades;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author asa
 */
public class Conecta {

    private static final String driver = "org.postgresql.Driver";
    private static final String url = "jdbc:postgresql://localhost:5434/academic";
    private static final String user = "postgres";
    private static final String pass = "12345";

    public Conecta() {

    }

    public static Connection conectar() {
        Connection con = null;
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Ocurrió el siguiente error: \n" + e.toString());
        }
        return con;
    }

}
