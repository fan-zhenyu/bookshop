<%-- 
    Document   : add_newroot
    Created on : 2021-11-22, 20:54:48
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <% 
   request.setCharacterEncoding("utf-8");
   String  username=request.getParameter("username");
   String  password=request.getParameter("password");
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();  
   stmt.executeUpdate("insert into root(username,password)Values('"+username+"','"+password+"')");
   response.sendRedirect("show_rootrule.jsp");
   %>
</html>
