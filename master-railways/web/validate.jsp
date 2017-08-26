

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%session.setAttribute("username",request.getParameter("userid"));%>

        <jsp:useBean id="details" class="p1.Login_Create_Logic"/>
            <jsp:setProperty name="details" property="*"/>
        <%
        if(request.getParameter("login")!=null)
        {
            if(details.login())
            {
        %>
        <jsp:forward page="reservation.jsp"/>

        <%
                }
            else
            {
                request.setAttribute("msg_login","UserID / Password Invalid");
            }
        }
        %>

         <%
        if(request.getParameter("create")!=null)
        {
            if(details.create_account()==true)
            {

        %>
        <jsp:forward page="index.jsp"/>
        <%
            }
            if(details.create_account()==false)
            {
              request.setAttribute("msg_create","prblem in creating account");
            }
        }
        %>
    </body>
</html>
