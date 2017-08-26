<%-- 
    Document   : enter_user_details.jsp
    Created on : 02-Jul-2015, 14:54:22
    Author     : AKSHAY SRIVASTAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import='javax.servlet.*,p1.*,java.sql.*'%>
<!DOCTYPE html>
 <script language="javascript" type="text/javascript" src="jquery-1.7.2.min.js"> </script>
<script>
    $(document).ready(function(){
        $('#a1').hide();
    $('#no_of_seats').change(function(){
                    var aa=$('#no_of_seats').val();
                    var ab=$('#fare').val()*aa;
                    $('#total_fare').val(ab);
                        $('#a1').show();
                    
                });
            });
                </script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <link rel="stylesheet" type="text/css" href="mystyle3.css">
    <body>
        <div id="wrap">
        <%          String s2="";
                String s[]=request.getParameterValues("submit");
                   int fare=0;int no;
                    for(String s1:s)
                    {
                        s2+=s1;
                    }
                    String Train_no=s2.substring(s2.lastIndexOf("in")+2,s2.length());
                    Connection con=ConnectionClass.getConnection();
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery("select distance from time_schedule where train_no='"+Train_no+"'");
                    if(rs.next())
                    {
                        fare=2*Integer.parseInt(rs.getString("distance"));
                    }
                session.setAttribute("fare",fare);
            %>
             <header>
        <img src="images/logo4.png" align="left" height="100" width="100"/>
        <img src="images/logo4.png" align="right" height="100" width="100"/>
        <b><i><font size="7"><center><U>Reservation Information</U></center></font></i></b>
</header>
    <center>
<br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <form action="bankselection.jsp" method="get">
         <table border="1" style=" background-color:lightgray;"align="center" >
            <tr><td>Train No</td><td><%=Train_no%></td></tr>
            <tr><td>No.Of Seats</td><td><input type="text" name="no_of_seats" id='no_of_seats'/></td></tr>
            <tr><td>Fare</td><td><input type="text" name="fare" id="fare" value="<%=fare%>" readonly="true"></td></tr>
            
            <tr id='a1'><td>Total Fare</td><td><input type="text" name="total_fare" id="total_fare"/></td></tr>
            <tr><td colspan="2" align="center"><input type='submit' value='Go To Payment'/></td></tr>
            
        </table>
        </form>
    </center>
        </div>
</body>
</html>
