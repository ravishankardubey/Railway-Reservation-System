/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;

import java.sql.*;


public class ConnectionPool {

    public static Connection getConnect() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project", "root", "password");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return con;
        }

    }

}
