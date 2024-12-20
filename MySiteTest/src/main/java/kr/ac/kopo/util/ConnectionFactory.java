package kr.ac.kopo.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionFactory {

    public static Connection getConnection() throws Exception {
        System.out.println("Attempting to connect to database...");
        Class.forName("oracle.jdbc.driver.OracleDriver");

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "hr";
        String password = "hr";
        Connection conn = DriverManager.getConnection(url, user, password);

        if (conn != null) {
            System.out.println("Database connection established.");
        } else {
            System.out.println("Failed to establish database connection.");
        }

        return conn;
    }
}
