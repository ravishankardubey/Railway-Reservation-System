<%-- 
    Document   : train_details
    Created on : 01-Jul-2015, 23:47:20
    Author     : AKSHAY SRIVASTAVA
--%>

<%@page import="p1.ConnectionClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import='java.sql.*,p1.*'%>

        <%  
            try
            {    
            Connection con=ConnectionClass.getConnection();
            Statement st=con.createStatement();
            String s1="";
            ResultSet rs=st.executeQuery("select * from train_schedule where train_no='"+request.getParameter("aa1")+"'");
            while(rs.next())
            {
            s1+=rs.getString(1);
}out.println(s1);
            }
            
            catch(Exception e)
            {
                out.println(e);
            }
            %>

