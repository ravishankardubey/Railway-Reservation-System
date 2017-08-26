

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
                
              /*  $('#reset').click(function(){
                {
                    var btn2 = $('#reset').val();
                }*/
                if (btn1 == "Submit")
                {
                    $('#frm1').attr("action", "gateway1.jsp");
                }
                /*else if (btn2 == "Reset")
                {
                    $('#frm1').attr("action", "bankselection.jsp");
                }*/
            });
        });
        </script>

    </head >
    <body>
        <div id="wrapper">
            <header id="top_header">
                <img src='images/download.png' title='Indian Railway' align='left' height='90' width='90'>
                <img src='images/download.png' title='Indian Railway' align='right' height='90' width='90'>
                <h1><font size='7' color='mediumslateblue'  font='Courier New'>Select Your Bank</font></h1>
            </header>
            <section id="main_section">
                <div id="new_div">
                    <form method="post" id="frm1" action="gateway1.jsp" >

                        <table align="center" style="border:blue 1px solid;border-radius:20px;width:80%;margin-left: 230px;padding: 30px;">
                            <tr><td><input type="radio" name="Bankname" value="State Bank Of India" required/>State Bank Of India</td>
                                <td><input type="radio" name="Bankname" value="Bank Of Baroda" required/>Bank Of Baroda</td></tr>
                            <tr><td><input type="radio" name="Bankname" value="Indian Overseas Bank" required/>Indian Overseas Bank</td>
                                <td><input type="radio" name="Bankname" value="Punjab National Bank" required/>Punjab National Bank</td></tr>
                            <tr><td><input type="radio" name="Bankname" value="Axis Bank" required/>Axis Bank</td>
                                <td><input type="radio" name="Bankname" value="HDFC Bank" required/>HDFC Bank</td></tr>
                        </table>
                        </section>
                        <section>
                            <br/><br/>
                            <center><input type="submit" value="Submit" name="submit" id="submit" style="background:skyblue;" margin:100px /></center>


                    </form>
                    <br/><br/><br/><br/></div>


                <% double d = Math.random();
                            Object ob = new Double(d);
                            String s = ob.toString();
                            float j = Float.parseFloat(s);
                            float k = j * 100000;
                            int tid = (int) k;
                            session.setAttribute("transaction_id", tid);
                %>
            </section>
        </div>

    </body>

</html>
