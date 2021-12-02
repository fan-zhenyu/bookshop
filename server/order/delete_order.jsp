<%-- 
    Document   : delete_order
    Created on : 2021-11-22, 19:56:44
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <% 
   request.setCharacterEncoding("utf-8");
   String  orderid=request.getParameter("orderid");
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();  
   stmt.executeUpdate("DELETE FROM orders WHERE orderid="+orderid+"");
   response.sendRedirect("show_orderrule.jsp");
   %>
</html>
