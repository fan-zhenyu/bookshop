<%-- 
    Document   : clearcart
    Created on : 2021-11-17, 21:02:58
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name=(String)session.getAttribute("username");
            Class.forName("com.mysql.jdbc.Driver");           
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
            Statement stmt=conn.createStatement();
            ResultSet rs; //建立ResultSet(结果集)对象
            stmt.executeUpdate("delete from cart where username='"+name+"'");
            response.sendRedirect("/bookshop/client/cart/showcart.jsp");
        %>
    </body>
</html>
