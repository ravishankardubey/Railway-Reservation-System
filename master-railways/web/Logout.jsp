<%-- 
    Document   : Logout
    Created on : Jul 3, 2015, 2:53:17 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
 session.invalidate();

            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);

%>
    </body>
</html>
