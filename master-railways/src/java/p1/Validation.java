/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;
import java.sql.*;
/**
 *
 * @author AKSHAY SRIVASTAVA
 */
public class Validation {
    private String username;
    private String password;
    Boolean b=false;
    public String getusername()
    {
        return username;
    }
    public String getpassword()
    {
        return password;
    }
    public void setusername(String username)
    {
        this.username=username;
    }
     public void setpassword(String password)
    {
        this.password=password;
    }
     public Boolean valid()
     {
         try
         {
         Connection con=ConnectionClass.getConnection();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select confirm_password from login where username='"+getusername()+"'");
         if(rs.next())
         {
             if(getpassword().equals(rs.getString(1)))
             {
                 b=true;
             }
         }
         }
         catch(Exception e)
         {
         }
         return b;
         }
         
     
}
