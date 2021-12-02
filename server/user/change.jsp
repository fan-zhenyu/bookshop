<%-- 
    Document   : change
    Created on : 2021-11-21, 22:46:47
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%
    request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();  
    String  username=request.getParameter("username");
    String  password=request.getParameter("password");
    stmt.executeUpdate("update message set password='"+password+"' where username='"+username+"'");
    response.sendRedirect("/bookshop/server/user/show_userrule.jsp");
    %>
</html>

