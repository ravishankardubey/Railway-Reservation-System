<%-- 
    Document   : validate
    Created on : 30-Jun-2015, 11:43:01
    Author     : AKSHAY SRIVASTAVA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           
            <% 
                request.setAttribute("key1",1);
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.forward(request,response);
                %>
    </body>
</html>
