

<%@page contentType="text/html" pageEncoding="UTF-8" import="p1.*,java.sql.*"%>
<script language="javascript" type="text/javascript" src="actb.js"> </script>
<script language="javascript" type="text/javascript" src="common.js"> </script>
<script language="javascript" type="text/javascript" src="jquery-1.7.2.min.js"> </script>
<script>

    $(document).ready(function(){

        var arr=new Array();
        $.ajax({
            type:"post",
            url:"fetch_stn_code.jsp",
            data:"aa",
            success:function(msg)
            {
                $.each(msg.split("#"),function(index,value){
                    arr[index]=value;

                });

            }
        });
        actb(document.getElementById("from"), arr);
        actb(document.getElementById("to"), arr);
    });
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body bgcolor="white">
        <div id="big_wrapper">
            <header id="top_header">
                <img src='images/logo.jpg' title='Indian Railway' align='left' height='90' width='90'>
                <h1><font size="6" color="red">Plan Your Journey</font></h1>

            </header>
            <hr noshade width="50%" size="10px">
            <nav>

                <div style="float:left;border-right-color: black; border-color:blue;border:1px; border-radius:10px;">
                    <form method="post" action="home.jsp">
                        <table style="table-layout: fixed;">
                            <tr><td><input type="text" name="from" id="from" placeholder="From" required></td></tr>
                            <tr><td><input type="text" name="to" id="to" placeholder="To" required></td></tr>
                            <tr><td><input type="date" name="doj" id="doj" required></td></tr>
                            <tr><td align="right"><input type="submit" name="btn" id="btn"></td></tr>
                        </table>
                    </form>
                </div>

            </nav>
            <center>
                <%
                            if (request.getParameter("btn") != null) {
                                Connection con = ConnectionPool.getConnect();
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("select train_no,arvi,dept,distance from time_schedule where source_sta='" + request.getParameter("from") + "' && dept_sta=");

                %>

                <form method="post" action="">
                    <table>
                        <tr><td></td><td></td><td></td></tr>
                    </table>

                </form>

                <%                    }
                %>


            </center>
        </div>
    </body>
</html>
