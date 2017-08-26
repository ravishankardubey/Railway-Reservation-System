

<%@page contentType="text/html" pageEncoding="UTF-8" import="p1.*,java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mystyle3.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="wrap">
    <header>
        <div id='menu' align="right">Welcome <%=session.getAttribute("sal")%> | <a
href='reservation.jsp'>Home</a> | <a href='ResetPass.jsp'>Change Password</a> | <a href='Logout.jsp'>Logout</a></div>
        </header>
<br/><br/>
        <%
if(request.getParameter("reset")!=null)
          {
            int i=0;
            String usr="";
            Connection con=ConnectionPool.getConnect();
            Statement stmt=con.createStatement();

            usr=session.getAttribute("username").toString();
            ResultSet rs=stmt.executeQuery("select password from login where user_name='"+usr+"'");
            rs.next();

            if(rs.getString(1).equals(request.getParameter("o_pass")))
            {

                i=stmt.executeUpdate("update login set password='"+request.getParameter("n_pass")+"' where user_name='"+usr+"'");
                if(i>0)
                 {
                 session.setAttribute("msg_change","password successfully changed");
                 
                 }
                 else
                 {
                 session.setAttribute("msg_change","password didn't changed");
              
                 }
            }
            else
            {
                session.setAttribute("msg_change","old password didnt matched Re-Enter");
             
           }
          }

%>
<center>
<form method='post' action='ResetPass.jsp'>
    <table>
        <tr><td>Old Password :</td><td><input type='password' name='o_pass' required/></td></tr>
        <tr><td>New Password :</td><td><input type='password' name='n_pass' required/></td></tr>
        <tr><td colspan='2'><center><input type='submit' name='reset' value='Reset'></center></td></tr>
        </table>
    </form>
    <font color='green' size='5'>
   <%
if(session.getAttribute("msg_change")!=null)
            {
                out.println(session.getAttribute("msg_change"));
            }
%>
</font>
</center>
</div>
    </body>
</html>
