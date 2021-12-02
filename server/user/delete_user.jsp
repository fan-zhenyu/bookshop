<%-- 
    Document   : delete_user
    Created on : 2021-11-21, 22:35:38
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <% 
   request.setCharacterEncoding("utf-8");
   String  username=request.getParameter("username");
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();  
   stmt.executeUpdate("DELETE FROM message WHERE username='"+username+"'");
   response.sendRedirect("/bookshop/server/user/show_userrule.jsp");
   %>
</html>
