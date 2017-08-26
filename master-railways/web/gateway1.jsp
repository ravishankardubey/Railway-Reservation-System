
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                             <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mystyle2.css">
        <script>
            $(document).ready(function(){
                $('#conf1').click(function(){
                    var btn1 = $('#conf1').val();
                    if (btn1 == Confirm_Ticket)
                    {
                        $('#frm').attr("action", "gateway2.jsp");
                    }
                });
            });
        </script>
    </head>
    <body>
        <div id="wrapper">
            <header id="top_header">
                <img src='images/images.jpg' title='Indian Railway' align='right' height='95' width='95' hspace="50" padding-right="100px">
                <img src='images/abc.jpg' title='Indian Railway' align='left' height='95' width='100'>
               
                <%
                            String transaction_id = session.getAttribute("transaction_id").toString();
                            String amount=session.getAttribute("fare").toString();
                %>
                <form method="post" id="frm" action="gateway2.jsp">
                    <h1 align="center" size="10" color="black"><font size="7" color="mediumslateblue" font:bold italic Baskerville Old Face>
                            <%= 
                                                    request.getParameter("Bankname")%></font></h1>
                           

            </header>
            <section id="main_section">
                <div align="center"  style="border:1px solid blue;border-radius:20px;margin-top:100px;width:70%;margin:auto ;padding:50px;">


                    <table align="center" style="border:powderblue 2px solid;border-radius: 10px;background-color:beige" cellpadding="2" cellspacing="2" width="50%" margin="auto">

                        <font size="10" align="center"><tr><td colspan="2" style="background-color:grey">Billing Details</td></tr></font>
                        <tr><td>Merchant</td><td>SYRA</td></tr>
                        <tr><td>Website</td><td>http://www.syra.co.in</td></tr>
                        <tr><td >Fare</td><td><%=amount%></td></tr>
                        <tr><td>Transaction_id</td><td><%=transaction_id%></td></tr>

                    </table>
                    <br/><br/><br/><br/>
                    <center><input type="submit" name="conf1" id="conf1" value="Confirm_Ticket"/></center>
                </div>
                        </section>
                </form>
        </div>
    
</body>
</html>
