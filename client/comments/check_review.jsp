<%-- 
    Document   : check_review
    Created on : 2021-11-21, 15:56:58
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<%
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();
   request.setCharacterEncoding("utf-8");
   
   String  username=request.getParameter("username");
   String  bookname=request.getParameter("bookname");
   String  content=request.getParameter("content");
   String  date=request.getParameter("date");
  
   stmt.executeUpdate("insert into remarks(username,bookname,content,date)Values('"+username+"','"+bookname+"','"+content+"','"+date+"')");  
   response.sendRedirect("/bookshop/client/comments/show_review.jsp");
%>
</html>
