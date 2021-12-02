<%-- 
    Document   : addcart
    Created on : 2021-11-16, 10:43:40
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
            String bookname=request.getParameter("bookname");
            String bookid=request.getParameter("bookid");
            String img=request.getParameter("img");
            String price=request.getParameter("price");
            Class.forName("com.mysql.jdbc.Driver");           
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
            Statement stmt=conn.createStatement();
            ResultSet rs; //建立ResultSet(结果集)对象
            stmt.executeUpdate("insert into cart(username,bookid,bookname,img,price,number,total)Values('"+name+"','"+bookid+"','"+bookname+"','"+img+"','"+price+"','"+1+"','"+price+"')");
            response.sendRedirect("/bookshop/client/cart/showcart.jsp");
        %>
        <%=name%>
        <%=bookname%>
    </body>
</html>
