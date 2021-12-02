<%-- 
    Document   : delete_root
    Created on : 2021-11-22, 20:49:49
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
   stmt.executeUpdate("DELETE FROM root WHERE username='"+username+"'");
   response.sendRedirect("/bookshop/server/root/show_rootrule.jsp");
   %>
</html>
