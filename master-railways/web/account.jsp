

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,p1.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = ConnectionPool.getConnect();
            Statement stmt = con.createStatement();
            int amount = (Integer) session.getAttribute("fare");
            String account_no = request.getParameter("account_no");
            int check = 0;
            String card_no = request.getParameter("card_no");
            String pin = request.getParameter("pin");
            String expiry_date = request.getParameter("exdate");
            String holder_name = request.getParameter("hname");

            ResultSet rs = stmt.executeQuery("select * from account where account_no='" + account_no + "'");
            if (rs.next()) {
                if (account_no.equals(rs.getString("account_no")) && card_no.equals(rs.getString("card_no"))  && holder_name.equals(rs.getString("holder_name")) && pin.equals(rs.getString("pin"))) {
                    check = 1;
                    float balance1 = Float.parseFloat(rs.getString("balance"));
                    if (amount < balance1) {
                        int balance = Integer.parseInt(rs.getString("balance")) - amount;
                        int i = stmt.executeUpdate("update account set balance='" + balance + "' where account_no='" + account_no + "'");
                        session.setAttribute("account", account_no);
                        response.sendRedirect("last_page.jsp");
                    } else {
                        session.setAttribute("wrong", "you do not have enough balance to book your ticket");
                        response.sendRedirect("index.jsp");
                    }
                }
            }
            if (check == 0) {
                session.setAttribute("wrong", "plese fill your account detail correctly otherwise your account will be deactivated");
                response.sendRedirect("bankselection.jsp");
            }
        %>
    </body>
</html>
