<%-- 
    Document   : change
    Created on : 2021-11-21, 22:01:35
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
    String  bookid=request.getParameter("bookid");
    String  price=request.getParameter("price");
    stmt.executeUpdate("update book set price='"+price+"' where bookid='"+bookid+"'");
    response.sendRedirect("/bookshop/server/book/show_bookrule.jsp");
    %>
</html>
