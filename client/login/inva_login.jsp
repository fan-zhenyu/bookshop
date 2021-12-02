<%-- 
    Document   : inva_login
    Created on : 2021-11-14, 16:24:03
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <%
         session.invalidate();//session失效
         response.sendRedirect("login.jsp");
         //session.removeAttribute("uname");//部分失效
     %>
</html>
