<%-- 
    Document   : addto_cart
    Created on : 2021-11-17, 16:57:39
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
        Statement stmt=conn.createStatement();
        String username=request.getParameter("username");
        String bookid=request.getParameter("bookid");
        String bookname=request.getParameter("bookname");
        String img=request.getParameter("img");     
//        String sum=request.getParameter("sum");
//        int key=Integer.parseInt(sum)+1;
        String number=request.getParameter("number");     
        String price=request.getParameter("price");
        ResultSet rs; //建立ResultSet(结果集)对象
        //未实现对购物车二次添加数量的变化
        //已经解决，利用sql语句分组求和
//        rs=stmt.executeQuery("Select From cart where username='"+username+"'and bookname='"+bookname+"'");
//        if(rs.next())
//        {
//           stmt.executeUpdate("update cart set sum="+key+" where username='"+username+"' and bookname='"+bookname+"'");
//        }else{
        stmt.executeUpdate("insert into cart(username,bookid,bookname,img,price,number,total)Values('"+username+"','"+bookid+"','"+bookname+"','"+img+"','"+price+"','"+number+"','"+price+"')");
        response.sendRedirect("/bookshop/client/cart/showcart.jsp");
//        }
//        %>
        <%=number%>
    </body>
</html>
