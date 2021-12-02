<%-- 
    Document   : check_order.jsp
    Created on : 2021-11-18, 20:35:11
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<% 
   request.setCharacterEncoding("utf-8");
   String  username=request.getParameter("username");
   String  bookname=request.getParameter("bookname");
   String  number=request.getParameter("number");
   String  total=request.getParameter("total");
   String  name=request.getParameter("name");
   String  phone=request.getParameter("phone");
   String  Postcodes=request.getParameter("Postcodes");
   String  address=request.getParameter("address");
   String  date=request.getParameter("date");
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();
//   ResultSet rs; //建立ResultSet(结果集)对象
   stmt.executeUpdate("insert into orders(username,bookname,number,total,name,phone,Postcodes,address,date,state)Values('"+username+"','"+bookname+"','"+number+"','"+total+"','"+name+"','"+phone+"','"+Postcodes+"','"+address+"','"+date+"',"+0+")");  
   response.sendRedirect("/bookshop/client/order/show_order.jsp");
%>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
