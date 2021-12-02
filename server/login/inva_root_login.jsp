<%-- 
    Document   : inva_root_login
    Created on : 2021-11-21, 19:19:35
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
         response.sendRedirect("/bookshop/server/root_login.html");
         //session.removeAttribute("uname");//部分失效
     %>
</html>

