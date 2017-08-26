/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;
import java.sql.*;


public class ConnectionClass {
    
    public static Connection getConnection()
            {   Connection con=null;
                try
                {
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","password");
                }
                catch(Exception e)
                {
                    System.out.println(e);
                }
                return con;
            }
    
}
