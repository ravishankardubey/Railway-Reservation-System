

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,p1.*,javax.servlet.*"%>
      

<!DOCTYPE html>
<script language="javascript" type="text/javascript" src="jquery-1.7.2.min.js"></script>
<script language="javascript" type="text/javascript" src="actb.js"></script>
<script language="javascript" type="text/javascript" src="common.js"></script>
<script>
    $(document).ready(function () {
    
        var arr = new Array();
        $.ajax({
            type: "post",
            url: "fetch_all_cities.jsp",
            data: "aa",
            success: function (msg)
            {
                $.each(msg.split("#"), function (index, value)
                {
                    arr[index] = value;
                });
            }
        });
        actb(document.getElementById("from"), arr);

        
        var arr = new Array();
        $.ajax({
            type: "post",
            url: "fetch_all_cities.jsp",
            data: "aa1",
            success: function (msg)
            {
                $.each(msg.split("#"), function (index, value)
                {
                    arr[index] = value;
                });
            }
        });
        
        actb(document.getElementById("to"), arr);
    });
</script>
<script>
        
    $(document).ready(function(){
        $('#div1').hide();
        $('#div2').hide();
        $('#div3').hide()
                
        $('.ac').click(function () {
            var a=$('.ac').val();
            $('#div1').show();
            $('#div2').hide();
            $('#div3').hide();

        });
    });
    $(document).ready(function(){
        $('#div1').hide();
        $('#div2').hide();
        $('.sl').click(function(){
            $('#div2').show();
            $('#div1').hide();
            $('#div3').hide();
        });
    });
    $(document).ready(function(){
        $('#div3').hide();
        $('.cc').click(function(){
            $('#div3').show();
            $('#div1').hide();
            $('#div2').hide();
        });
    });

</script>


<html>
    <head>
        <%HttpSession ses = request.getSession(true);%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>header{ text-align:center; padding: 10px; } #aside1{ float:left;background-color:lightgray}</style>
        <title>Reservation Page</title>
    </head>
     <link rel="stylesheet" type="text/css" href="mystyle3.css">
    <body>
         <%
            String sal = "";
            Connection con11=ConnectionPool.getConnect();
            Statement stmt1=con11.createStatement();
            ResultSet rs1 = stmt1.executeQuery("select f_name,l_name,gender from UserDetails where username='" +session.getAttribute("username").toString() + "'");
            rs1.next();
            if (rs1.getString(3).equals("male")) {
                sal = "Mr.";

            }
            if (rs1.getString(3).equals("female")) {
                sal = "Ms.";
            }
            session.setAttribute("sal", sal + " " + rs1.getString(1) + " " + rs1.getString(2));
        %>

  
        <div id="wrap">
    <header>
              <div id='menu' align="right">Welcome <%=sal%> <%=rs1.getString(1)%> <%=rs1.getString(2)%> | <a
href='reservation.jsp'>Home</a> | <a href='ResetPass.jsp'>Change Password</a> | <a href='Logout.jsp'>Logout</a></div>
<br/><br/>
       
       <img src="images/logo4.png" align="left" height="100" width="100"/>
        <img src="images/logo4.png" align="right" height="100" width="100"/>
        <b><i><font size="7"><center><U>Plan your Travel</U></center></font></i></b>
</header>
<br/>
<br/>
<br/>
<br/>
<aside id="aside1">
    <form action="reservation.jsp" method="post">
        <table>
            <tr><td>From</td><td><input type="text" name="from" id="from"/></td></tr>
            <tr><td>To</td><td><input type="text" name="to" id="to"/></td></tr>
            <tr><td>Date</td><td><input type="date" name="date" id="date"/></td></tr>
            <tr><td></td><td><input type="submit" name="submit" value="Check" id="submit"/></td></tr>

        </table>
    </form>
</aside>


<%--
        try {
            Connection con1 = ConnectionClass.getConnection();
            Statement stmt1 = con1.createStatement();
            ResultSet rs1 = stmt1.executeQuery("select train_no,train_name,seat_ac from time_schedule t,train_schedule ts where ts.train_no=t.train_no and source_sta='" + request.getParameter("from") + "'and dest_sta='" + request.getParameter("to") + "'");

out.println("<table border='1'>");
    out.println("<tr><th>train_no</th><th>train_name</th><th>Seats in ac</th></tr>");

 while (rs1.next()) {
            out.println("<tr><td>" + rs1.getString("train_no") + "</td><td>" + rs1.getString("train_name") + "</td><td>" + rs1.getString("seat_ac") + "</td></tr>");
        }
out.println("</table>");
    }
        catch(Exception e)
        {
            out.println(e);
        }

--%>

}

}



<center>
    <%
                if (request.getParameter("submit") != null) {
                    Connection con=ConnectionPool.getConnect();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from time_schedule t,train_schedule ts where ts.train_no=t.train_no and source_sta='" + request.getParameter("from") + "'and dest_sta='" + request.getParameter("to") + "'");

    %>

    <form method="post" action="" id="frm_train">
        <table border="1px" style=" background-color:lightgray;"align="right" >
            <tr><th>Train No</th><th>Train Name</th><th>Src</th><th>Dest</th><th>ETA</th><th>ETD</th><th>Distance</th><th>AC</th><th>SL</th><th>CC</th></tr>
            <% int i = 0;
                                    String s[] = new String[12];
                                    while (rs.next()) {
                                        i++;
                                        s[i] = rs.getString("train_no");
            %>

            <tr><td><%=rs.getString("train_no")%></td><td><%=rs.getString("train_name")%></td><td><%=rs.getString("source_sta")%></td><td><%=rs.getString("dest_sta")%></td><td><%=rs.getString("arvi")%></td><td><%=rs.getString("dept")%></td><td><%=rs.getString("distance")%></td><td><%if (rs.getString("seat_ac") != null) {%><input type="radio" name="rad_seat" class="ac" id="rad_seat_ac" value="<%=rs.getString("train_no")%>"/><%}%></td><td><%if (rs.getString("seat_sl") != null) {%><input type="radio" name="rad_seat" class="sl" id="rad_seat_sl" value="<%=rs.getString("train_no")%>"/><%}%></td><td><%if (rs.getString("seat_cc") != null) {%><input type="radio" class="cc" name="rad_seat" id="rad_seat_cc" value="<%=rs.getString("train_no")%>"/><%}%></td></tr>
                    <%
                                                        }%>
        </table>

    </form>

    <%                    }%>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <div id="div1">
        <form action="enter_user_details.jsp" method="post">
            <table border="1" style=" background-color:lightgray;"align="center" >
                <tr><th>Train_no</th><th>Train_name</th><th>Seat_ac</th></tr>
                <%  try {
                                int i = 0;
                                Connection con1 = ConnectionClass.getConnection();
                                Statement st = con1.createStatement();
                                ResultSet rs = st.executeQuery("select * from time_schedule t,train_schedule ts where ts.train_no=t.train_no and source_sta='" + request.getParameter("from") + "'and dest_sta='" + request.getParameter("to") + "'");
                                while (rs.next()) {
                                    out.println("<tr><td>" + rs.getString("train_no") + "</td><td>" + rs.getString("train_name") + "</td><td>" + rs.getString("seat_ac") + "</td><td><input type='submit' name='submit' value='Book your seat in" + rs.getString("train_no") + "'/></td></tr>");
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                %>
            </table>
        </form>
    </div>
    <div id="div2">
        <form action="enter_user_details.jsp" method="post">
            <table border="1" style=" background-color:lightgray;"align="center" >
                <tr><th>Train_no</th><th>Train_name</th><th>Seat_sleeper</th></tr>
                <%  try {
                                int i = 0;
                                Connection con1 = ConnectionClass.getConnection();
                                Statement st = con1.createStatement();
                                ResultSet rs = st.executeQuery("select * from time_schedule t,train_schedule ts where ts.train_no=t.train_no and source_sta='" + request.getParameter("from") + "'and dest_sta='" + request.getParameter("to") + "'");
                                while (rs.next()) {
                                    out.println("<tr><td>" + rs.getString("train_no") + "</td><td>" + rs.getString("train_name") + "</td><td>" + rs.getString("seat_sl") + "</td><td><input type='submit' name='submit' value='Book your seat in" + rs.getString("train_no") + "'/></td></tr>");
                                }
                            } catch (Exception e) {
                                out.println(e);
                            }
                %>
            </table>
        </form>
    </div>
    <div id="div3">
        <form action="enter_user_details.jsp" method="post">
            <table border="1" style=" background-color:lightgray;"align="center" >
                <tr><th>Train_no</th><th>Train_name</th><th>Seat_Chair Car</th></tr>
                <%  try {
                                int i = 0;
                                Connection con1 = ConnectionClass.getConnection();
                                Statement st = con1.createStatement();
                                ResultSet rs = st.executeQuery("select * from time_schedule t,train_schedule ts where ts.train_no=t.train_no and source_sta='" + request.getParameter("from") + "'and dest_sta='" + request.getParameter("to") + "'");
                                while (rs.next())
                                {
                                    out.println("<tr><td>" + rs.getString("train_no") + "</td><td>" + rs.getString("train_name") + "</td><td>" + rs.getString("seat_cc") + "</td><td><input type='submit' name='submit' value='Book your seat in" + rs.getString("train_no") + "'/></td></tr>");
                                }

                            }
                            catch (Exception e)
                            {
                                out.println(e);
                            }
                %>
            </table>
        </form>
    </div>



</center>
<%--<jsp:forward page="reservation_data.jsp"/>--%>





        </div>

</body>
</html>
