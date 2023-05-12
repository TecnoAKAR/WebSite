package org.akar.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String port = "3306";
    private static final String user = "root";
    private static final String password = "n0m3l0";
    private static final String url = "jdbc:mysql://localhost:"+port+"/AKAR";

    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException ex) {
            System.out.println("Error al cargar el controlador JDBC");
            ex.printStackTrace();
        } catch (SQLException ex) {
            System.out.println("Error al establecer la conexión a la base de datos");
            ex.printStackTrace();
        }
        return connection;
    }

    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException ex) {
                System.out.println("Error al cerrar la conexión a la base de datos");
                ex.printStackTrace();
            }
        }
    }
}

