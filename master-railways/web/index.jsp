

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome To Indian Railway Reservation System</title>
    </head>
    <body bgcolor="white">
        <div id="big_wrapper">
            <header id="top_header">
                <img src='images/logo.jpg' title='Indian Railway' align='left' height='90' width='90'>

                <h1><font size="6" color="red">Welcome To Indian Railway Reservation System</font></h1>

            </header>
            <nav id="top_menu">
                <ul>
                    <li>Home</li>
                    <li>PNR Status</li>
                    <li>Train between station</li>
                    <li>Current Status<li>
                    <li>Feedback<li>
                </ul>
            </nav>


            <aside>

            </aside>
            <section id="main_section">
                <center>
                    <%
                                if (request.getParameter("signup") == null) {

                    %>

                    <form method='post' action='validate.jsp'>
                         <img src='images/advt.gif' align='right'/>
                          <img src='images/bholu-light-sm.jpg' align='left'/>
                        <fieldset style="border: 1px solid ridge;width: 300px;background-color:papayawhip;background-position: bottom right;background-repeat: no-repeat;color: black; top:auto">

                            <legend style="background-color:white;color:black;">LOGIN:
                            </legend>

                            <table id="login" align="center">
                                <tr><td>User ID :</td><td><input type="text" name="userid" placeholder="user id" required/></td></tr>
                                <tr><td>Password:</td><td><input type="password" name="pass" placeholder="password" required/></td></tr>
                                 <br/>
                                <tr><td></td><td><input type="submit" name="login" value="Sign in" required/></td></tr>

                            </table>
                    </form>
                    <br/>
                    <a href="ForgetPass">  Forget Password?</a>
                    <br/>
                    <form method="post" action="index.jsp">
                        <br/> <tr><td>New User?</td><td>&nbsp;&nbsp; <input type="submit" name="signup" value="Sign Up" required/></td></tr>
                    </form>                        </fieldset><br/>

                    ${requestScope.msg_login}
                    ${requestScope.msg_create}
                    <%                    }
                    %>
                    <%
                                if (request.getParameter("signup") != null) {
                    %>

                    Create your account here
                    <form method="post" action="validate.jsp">
                        <table>

                            <tr><td>User name  :</td><td><input type='text' name='username' placeholder='username' required ></tr>
                            <tr><td>First Name :</td><td><input type='text' name='f_name' placeholder='First Name' required ></tr>
                            <tr><td>Last Name  :</td><td><input type='text' name='l_name' placeholder='Last Name'></td></tr>
                            <tr><td>Gender     :</td><td><select name='gender' required><option value='Male'>Male</option><option value='Female'>Female</option></select></td></tr>
                            <tr><td>E-Mail ID  :</td><td><input type='email' name='email' placeholder='E-Mail ID' required></td></tr>
                            <tr><td>Mobile No. :</td><td><input type='text' name='mob' placeholder='Mobile No.' required></td></tr>
                            <tr><td>DOB        :</td><td><input type='date' name='dob' required></td></tr>
                            <tr><td>Marital Status     :</td><td><select name='marital' required><option value='Unmarried'>Unmarried</option><option value='Married'>Married</option></select></td></tr>
                            <tr><td>Password   :</td><td><input type='password' name='password' placeholder='Password' required></td></tr>
                            <tr><td></td><td><select name='security_que' required><option>------------Security question------------</option><option value='What is your pets name?'>What is your pets name?</option><option value='What is your fathers middle name?'>What is your fathers middle name?</option><option value='what is your favorite song'>what is your favorite song</option><option value='What was the name of your first school?'>What was the name of your first school?</option>/<option value='What is name of you favourite actor'>What is name of you favourite actor</option>td></tr>
                            <tr><td></td><td><input type="text" name="security_ans" placeholder="security answer" required></td></tr>
                            <tr><td>Address :</td><td><textarea cols="30" rows="6" name="address"></textarea></td></tr>
                            <tr><td>City :</td><td><input type="text" name="city" placeholder="type here" required></td></tr>
                            <tr><td>State :</td><td><input type="text" name="state" placeholder="type here" required></td></tr>
                            <tr><td>Zip Code:</td><td><input type="text" name="zipcode" placeholder="zipcode" required></td></tr>
                            <tr><td></td><td></td></tr>
                            <tr><td colspan='2'><center><input type='submit' name='create' value='Create Account'></center></td></tr>
                        </table>
                        ${requestScope.msg_create}
                        <%                    }
                        %>
                    </form>

                </center>
                <section id="rules">
                    <article>
                        <header>
                            <hgroup>
                                <div id="scroller" style="background-color:lightyellow;height:160px;margin-top:2px; border:1px solid blue;border-radius:10px"><marquee id="myMarquee" direction="up" scrollamount="2" onmouseover="this.stop()" onmouseout="this.start()" height="135px"><strong><font color="red"><br><font color="red"><br><br><a href="" target="blank"><font color="red">Amendments in the certain provision of Refund Rules.</font></a><font color="lightred"><br><br>&nbsp;&nbsp; SMS/USSD based Mobile booking.<br> <a href="" target="blank"> Click here to know more.</a> <br><br>SOFT
                                                        (Scheme for Frequent Traveler) / **Shubh Yatra Programme **has been
                                                        discontinued in terms of Commercial Circular No 11 to 2013 issued by
                                                        Ministry of Railways*.<br><br>User registration service will not be available during 07:00 Hrs to 11:00 Hrs<br><br>The
                                                        existing time limit for advance reservation by train has been reduced
                                                        from 120 days to 60 days( excluding the date of journey ) w.e.f
                                                        01.05.2013<a href="" target="blank"><br>Click here to know more.</a><br><br>Toll free Number only for Railway Catering Complaints: 1800111321<br><br>Customer Care No. for Internet Ticket : 011 39340000<br><br>Train
                                                        No. 16529 CSTM-SBC  Udyan Express is renumbered as  11301 w.e.f
                                                        1-Jul-2013 and train no. 17004 KOP-HYB as 11304 w.e.f  2-Jul-2013.<a href="" target="blank"><br>Click here to know more.</a><br><br>Levying of service tax on service charges for e-tickets booked through IRCTC w.e.f.01 Apr-2013.<br><br><a href="https://www.irctc.co.in/beta_images/A5%20Pumplets%20IRCTC.jpg" style="color: #FF0000; TEXT-DECORATION: NONE" target="blank"> IRCTC opens World class Executive Lounge at New Delhi Railway Station.</a><br><br>Penalties for activities affecting cleanliness at railway premises.<a href="https://www.irctc.co.in/betaDoc/circular%20for%20penalties%20for%20activities.pdf" target="blank"><br>Click here to know more</a><br><br>A
                                                        verification call may be made for the bookings done between 10:00 am to
                                                        10:15 am to verify userid, pnr, passenger mobile number and passenger
                                                        details.<br><br>Any misleading information may lead to cancellation of e-ticket and an appropriate legal action.<br><br>Internet booking is not permitted in the overseas train nos 14001,14002,14889,13108 &amp; 13109.<br><br>Dear
                                                        Customer, to help improve the quality of service, you are requested to
                                                        please sign-out your account before closing the web-page.<br><br>Never
                                                        purchase e-ticket from unauthorised agents or persons, using their
                                                        personal IDs for commercial purposes. Such tickets are liable to be
                                                        forfeited under section(143) of the Indian Railway Act 1989. List of
                                                        authorised agents are available on www.irctc.com &gt;E-Ticket Agent
                                                        Locator<br><br>Tatkal facility is available in all Duronto Express Trains for journeys starting on 01.04.2012(from train originating station)<br><br><br><br>Money debited but ticket not booked?  <a href="https://www.irctc.co.in/beta_htmls/Alerts_mone_debited.html" target="blank"><br>Click here.</a><br><br>IRCTC On Mobile: Now book your rail ticket -ANYWHERE ANYTIME through your Mobile Phones. <br><a href="" target="blank"><br>Click here For Steps.</a><br><br>ID proof is required at the time of booking Tatkal tickets.<br><a href="" target="blank">Click here For More.</a><br><br>Maximum Four passengers can be booked in Tatkal ticket.<br> <a href="" target="blank">Click here For More.</a><br><br>No refund will be granted on cancellation of confirmed Tatkal tickets .<br><a href="" target="blank">Click here For More.</a><br><br>In Case Of train cancellation E-ticket can be cancelled Upto 72 hours from the Departure of Train.<br><a href="">Click here For More.</a><br><br>ERS/VRM
                                                        along with any one of the ten(10) prescribed ID proofs in original and
                                                        the indication of the passenger(s) name(s) in the Reservation Chart will
                                                        authorize the passenger(s) to travel on train.<br><a href="" target="blank">Click here For More.<br><br>Cases of fraudulent claims of refund are liable for legal action.<br><br>Users
                                                            registered on irctc.co.in are requested to update their user profile
                                                            with valid address, email-ID and mobile number. The registrations with
                                                            invalid address, email-IDs and mobile numbers are liable to be
                                                            deactivated.<br><br>Email-id and Mobile Number are now mandatory for IRCTC users and are being verified.<br><br>E-ticket
                                                            confirmed through charting at originating station or at the previous
                                                            remote location cannot be cancelled. The refund of such ticket will be
                                                            processed through TDR.<br><br>Internet Ticket booking is now available from 00:30 Hrs to 23:30 Hrs.<br></a><a href="#" onclick="window.open('/VBV_MSC.html','','width=550,height=450,toolbar=no,scrollbars=no,status=no,resizable=no');" class="topmenu">Click here for more details</a><br><br>Please update your mobile number in IRCTC profile to receive SMS alerts for your ticket booking. <br><br><a href="" target="blank">For details on Banner auction click here</a> <br><br><a href="" target="blank">For Banner view, click here </a><br><br><a href="">For Browser settings click here</a><br><br></font></font></font></strong>
                                        </hgroup>
                                    </marquee></div>
                                <footer>
                                    <p>Thank you!</p>
                                </footer>
                                </article>
                                </section>


                                <footer id="the_footer">
			Copyright Indian Railway 2015
                                </footer>
                                </div>

                                </body>
                                </html>
