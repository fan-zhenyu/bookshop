<%-- 
    Document   : delete_mark
    Created on : 2021-11-22, 20:32:12
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <% 
   request.setCharacterEncoding("utf-8");
   String  markid=request.getParameter("markid");
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();  
   stmt.executeUpdate("DELETE FROM remarks WHERE markid="+markid+"");
   response.sendRedirect("show_markrule.jsp");
   %>
</html>

