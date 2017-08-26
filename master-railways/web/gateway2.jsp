
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="stylesheet" type="text/css" href="mystyle2.css">
        <script language="javascript" type="text/javascript" src="jquery-1.4.4.min.js">
        </script>
        <script>
            $(document).ready(function(){
                $('#submit').click(function(){
                    var btn1 = $('#submit').val();
                <%-- }
                $('#reset').click(function(){
                {
                    var btn2 = $('#reset').val();
                }--%>
                if (btn1 == "Submit")
                {
                    $('#frm1').attr("action", "account.jsp");
                }
           <%--  else if (btn2 == "reset")
                {
                    $('#frm1').attr("action", "gateway2.jsp");
}--%>
            });
        });
        </script>
    </head>

    <body>
        <div id="wrapper">
            <header id="top_header">
                 <img src='images/opt.jpg' title='Indian Railway' align='left' height='95' width='125'>
                  <img src='images/debit card.png' title='Indian Railway' align='right' height='95' width='100'>
                <h1 align="left"><center><font size='20' color="mediumslateblue">Payment Details</font></center></h1>
            </header>
            <section id="main_section">
            <div align='center' style="border:blue 1px solid;border-radius:20px;<%--margin-top:100px;width:60%;margin-left: 250px">--%>">
              <form method="post" action="account.jsp">
           
                
              <table align='center' style="border:powderblue 1px solid;margin-top:100px;background-color:beige;width:60%; border:powderblue 2px solid;border-radius:20px;">
                
                        <tr><td>Card Type:</td><td><select name="choosecard" id="cc">
                                    <option value="">Choose card</option>
                                    <option value="Credit_Card">Credit_Card</option>
                                    <option value="Debit_Card">Debit_Card</option>
                                    <option value="VISA">VISA</option>
                                    <option value="MAESTRO">MAESTRO</option>
                                </select></td></tr>
                        <tr><td>Account No:</td><td><input type="text"  placeholder="Account no." name="account_no"/></td></tr>
                        <tr><td>Card No:</td><td><input type="text"  placeholder="card no." name="card_no"/></td></tr>
                        <tr><td>CVV:</td><td><input type="password"  placeholder="CVV" name="CVV"/></td></tr>
                        <tr><td>Validity/Expiry-Date:</td><td><input type="date" placeholder="month/year" name="exdate"/></td></tr>
                        <tr><td>PIN:</td><td><input type="password"  placeholder="PIN" name="pin"/></td></tr>
                        <tr><td>Cardholder's Name:</td><td><input type="text"  placeholder="card holder name" name="hname"/></td></tr>
                
                    </table><br/><br/><br/>
                    <center><input type="submit" value="Submit" name="submit" style="background:lightblue"/></center>

 </form>
    </div>
 </section>
      
           </div>
</body>
</html>
