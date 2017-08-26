<%-- 
    Document   : index
    Created on : 30 Jun, 2015, 11:03:14 PM
    Author     : Dell Pc
--%>

<%@page import="p1.Pid"%>
<%@page import="p1.Words"%>
<%@page import="p1.ConnectionPool"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IRCTC:PNR</title>
    </head>
    <body>
        <center>
            <h1> RAILWAY RESERVATION </h1>
        </center>
    </body>
    <%
                Connection con = ConnectionPool.getConnect();
                Statement stmt = con.createStatement();
               /* float amount = (Float) session.getAttribute("totalamount");
                int p = (int) amount;
                Words w = Words.getInstance(p);
                String amountinw = w.getNumberInWords();
                int amt = p - 12;

                Words w1 = Words.getInstance(amt);
                String amtinw = w1.getNumberInWords();*/


                String pname[] = (String[]) session.getAttribute("pname");
                String age[] = (String[]) session.getAttribute("age");
                String gender[] = (String[]) session.getAttribute("gender");
                //String birth[] = (String[]) session.getAttribute("birth");
                String nops1 = session.getAttribute("i").toString();
                String user_id = session.getAttribute("useridf").toString();
                String account = session.getAttribute("account").toString();

                int nops = Integer.parseInt(nops1);

                String train_no = session.getAttribute("train_no").toString();
                String train_name = session.getAttribute("train_name").toString();
                String from = session.getAttribute("from").toString();
                String to = session.getAttribute("to").toString();
                String clas = session.getAttribute("clas").toString().toUpperCase();
                String date = session.getAttribute("date").toString();
                String transaction_id = session.getAttribute("transaction_id").toString();
                String distance = session.getAttribute("distance").toString();

                String pmobile = session.getAttribute("pmobile").toString();
                String address = session.getAttribute("address").toString();
                ResultSet rs = stmt.executeQuery("select arvi from time_schedule where train_no='" + train_no + "'and source_sta='" + from + "'and dest_sta='" + to + "'");
                rs.next();
                String dept = rs.getString("arvi");
                session.setAttribute("dept", dept);
                long pnr = 0;
                // pnr = RandomGenrator.generate();
                double d = Math.random();
                Object ob = new Double(d);
                String s = ob.toString();
                float j = Float.parseFloat(s);
                float k = j * 1000000000;
                pnr = (long) k;
                session.setAttribute("pnr", pnr);
                ResultSet rs1 = stmt.executeQuery("select coach_no from coach where coach_type='" + clas + "' order by rand() limit 1");
                rs1.next();
                String cl = rs1.getString("coach_no");
                String seat[] = new String[6];
                String seat_type[] = new String[6];
                String birth[] = new String[nops];

                // for (int x = 0; x < nops; x++) {

                ResultSet rs2 = stmt.executeQuery("select seat,seat_type from coach where coach_no='" + cl + "' order by rand() limit 6");


                int g = 0;
                while (rs2.next()) {

                    seat[g] = rs2.getString("seat");
                    seat_type[g] = rs2.getString("seat_type");
                    //seat = rs.getString("seat")+",";

                    g++;

                }
                for (int z = 0; z < nops; z++) {
                    String w2 = "Confirm/" + " /" + cl + " /" + seat[z] + " /" + seat_type[z];
                    birth[z] = w2;

                }
                session.setAttribute("berth", birth);




                String mode = "confirm";


                int pnrt = stmt.executeUpdate("insert into pnr values('" + pnr + "','" + user_id + "','" + transaction_id + "','" + p + "','" + nops + "','" + date + "','" + from + "','" + to + "','" + train_no + "','" + account + "','" + distance + "','" + clas + "','" + pmobile + "','" + address + "','" + dept + "')");
                for (int a = 0; a < nops; a++) {
                    long pid = 0;
                    pid = Pid.pgenerate();

                    int l = stmt.executeUpdate("insert into paseneger_details(pnr,name,age,sex,berth_perferance,user_id,pid,mode)values('" + pnr + "','" + pname[a] + "','" + age[a] + "','" + gender[a] + "','" + birth[a] + "','" + user_id + "','" + pid + "','" + mode + "')");


                }


    %>


    <table width="100%">
        <tr><td align="left">RARRS Ltd,Booked Ticket Printing</td><td align="right">http://www.rarrs.co.in/login/PlanMyTravel/FindTrain/Book/reservationDetails/bankacc</td><tr>
    </table><br/>
    <div align="center" style="border:black 2px solid;width:72%;margin-left:100px" >
        <table align="center" width="80%" style="">

            <tr><td colspan="3"> <UL style="list-style-type:circle">
                        <LI>The ticket will only be valid with an ID proof in original.If found traveling without ID proof passenger will be treated as without ticket and charge as per extant Railway rules.
                        <LI>Valid Id's to be presented during train journey by one of the passenger  booked on an e-ticket :- Voter Identity Card/Passport/PAN Card/Driving licence/Photo ID Card issued by Central/State Govt./Student Identity Card with photograph issued by recognized School or College for their student/Nationalized Bank Passbook with photograph/Credit Cards is issued by banks with laminated photograph
                        <LI>General rule/information for e-ticket passenger have to be studies by customer for cancellation & refund
                    </UL></td></tr>
        </table>
        <table align="center" width="75%" border="1" cellpadding="0" cellspacing="0">

            <tr><td><b>PNR NO:<%=pnr%></b></td><td>Train No. & Train Name:<%=train_no%>,<%=train_name%></td><td>Quota:general</td></tr>
            <tr><td><b>Transaction ID:<%=transaction_id%></b></td><td>Date of Booking:<%=new java.util.Date()%></td><td>Class:<%=clas%></td></tr>
            <tr><td>From:<%=from%></td><td>Date of journey:<%=date%></td><td>To:<%=to%></td></tr>
            <tr><td>Boarding:<%=from%></td><td>Date of Boarding:<%=date%></td><td>Schedule Departure:<%=dept%></td></tr>
            <tr><td>Resv Upto:<%=to%></td><td>Distance:<%=distance%></td><td>Passenger:<%=nops%></td></tr>
            <tr><td>Passenger Mobile Number:<%=pmobile%></td><td colspan="2"></td></tr>
            <tr><td colspan="3"> Passenger Address:-<%=address%></td></tr>
        </table>
        <b>FARE DETAILS:</b>
        <table align="center" width="75%" border="1" cellpadding="0" cellspacing="0">
            <tr><td>1</td><td>Ticket Fare</td><td>Rs.<%=amt%></td><td>Rupees <%=amtinw%> only</td></tr>
            <tr><td>2</td><td>RARRS Service Charge</td><td>Rs.12</td><td>Rupees Twelve only</td></tr>
            <tr><td>3</td><td>Total</td><td>Rs.<%=amount%></td><td>Rupees <%=amountinw%> only</td></tr>
        </table>
        <b>PASSENGER DETAILS:</b>
        <table align="center" width="75%" border="1" cellpadding="0" cellspacing="0">
            <tr><th>S NO.</th><th>Name</th><th>Age</th><th>Sex</th><th>Concession Code</th><th>Booking Status/Current Status/Coach No./Seat No</th></tr>
            <b>PASSENGER DETAILS:</b>
            <table align="center" width="75%" border="1" cellpadding="0" cellspacing="0">
                <tr><th>S NO.</th><th>Name</th><th>Age</th><th>Sex</th><th>Concession Code</th><th>Booking Status/Current Status/Coach No./Seat No</th></tr>
                <%
                            for (int b = 0; b < nops; b++) {

                %>

                <tr><td><%=b + 1%></td>
                    <td><%=pname[b]%></td>
                    <td><%=age[b]%></td>
                    <td><%=gender[b]%></td>
                    <td>Not Applicable</td>
                    <td><%=birth[b]%></td>


                    <%}%>








            </table>

            <b style="margin-left:13;width:75%"><u>This Ticket is booked on a personal user ID cannot be sold by an agent.If bought from an agent by any individual,it is at his/her own risk.</u></b>
        </table>



        <table style="margin-left:12%"><tr><td colspan="3"> <UL style="list-style-type:circle black">
                        <LI>One of the passenger booked on an E-ticket is required to present any of the five identity cards noted below in original during the
                            train journey and same will be accepted as a proof of identity failing which all the passengers will be treated as travelling without ticket
                            and shall be dealt as per extant Railway Rules. Valid Ids:- Voter Identity Card / Passport / PAN Card / Driving License / Photo ID card
                            issued by Central / State Govt. for their employees.
                        <LI>The accommodation booked is not transferable and is valid only if one of the ID card noted above is presented during the journey.
                            The passenger should carry with him the Electronic Reservation Slip print out. In case the passenger does not carry the electronic
                            reservation slip, a charge of Rs.50/- per ticket shall be recovered by the ticket checking staff and an excess fare ticket will be issued in lieu of that.
                        <LI>E-ticket cancellations are permitted through www.irctc.co.in by the user. In case e-ticket is booked through an agent, please contact respective agent for cancellations.
                        <LI> Just dial 139 from your landline, mobile & CDMA phones for railway enquiries.
                            Contact us on:- 24*7 Hrs., MON - SAT(10 AM - 6 PM),Goto Link Chat to Admin on Homepage
                            , or Mail To: rarreservationsystem@gmail.com
                    </UL>  </td></tr><br/>
            <input type="submit" name="printer" value="printer"/><br/>
        </table>
        <img src="images/imprimante_036.jpg"/>

        <a href="pdfServlet">print ticket</a>
</div>
</html>
