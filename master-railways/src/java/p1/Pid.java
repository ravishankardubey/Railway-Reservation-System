/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;
import java.sql.*;

public class Pid {

    public static long pgenerate() {
        double d = Math.random();
        Object ob = new Double(d);
        String s = ob.toString();
        float j = Float.parseFloat(s);
        float k = j * 100000;
        long pid = (long) k;
        try{
            Connection con=ConnectionPool.getConnect();
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select pid from paseneger_details where pid='"+pid+"'");
            if(rs.next())
            {
                pgenerate();
            }
            else
            {
                return pid;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return pid;

    }
}
