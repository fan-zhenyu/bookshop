<%-- 
    Document   : add_newbook_tosql
    Created on : 2021-11-21, 20:31:24
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
   <% 
   request.setCharacterEncoding("utf-8");
   String  bookname=request.getParameter("bookname");
   String  author=request.getParameter("author");
   String  pub=request.getParameter("pub");
   String  price=request.getParameter("price");
   String  number=request.getParameter("number");
   String  Introduction=request.getParameter("Introduction");
   String  img=request.getParameter("img");
   img="/bookshop/book_images/"+img;
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();  
   stmt.executeUpdate("insert into book(bookname,author,pub,price,number,Introduction,img)Values('"+bookname+"','"+author+"','"+pub+"',"+price+","+1+",'"+Introduction+"','"+img+"')");
   response.sendRedirect("show_bookrule.jsp");
   %>
</html>