

<%@page contentType="text/html" pageEncoding="UTF-8" import="p1.*,java.sql.*"%>
<%      
    try
    {
    String st="";
    Connection con=ConnectionClass.getConnection();
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("select sta_code from station_code");
    while(rs.next())
    {
        st+=rs.getString(1)+"#" ;
    }
    out.println(st);
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>
