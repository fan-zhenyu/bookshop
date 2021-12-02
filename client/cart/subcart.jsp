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
            request.setCharacterEncoding("UTF-8");
            String name=(String)session.getAttribute("username");
            String bookname=request.getParameter("bookname");
            String cartid=request.getParameter("cartid");
            Integer sum=Integer.valueOf(request.getParameter("sum"));
            Class.forName("com.mysql.jdbc.Driver");           
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
            Statement stmt=conn.createStatement();
            stmt.executeUpdate("delete from cart where cartid="+cartid+"");
            if(sum!=0){
            response.sendRedirect("/bookshop/client/cart/showcart.jsp");}
            if(sum==0){
                response.sendRedirect("/bookshop/client/cart/delectcart.jsp?bookname="+java.net.URLEncoder.encode(bookname.toString(),"utf8"));}
        %>
        <%=cartid%>
    </body>
</html>
