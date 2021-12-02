<%-- 
    Document   : change_state
    Created on : 2021-11-22, 20:03:43
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
    String  orderid=request.getParameter("orderid");
    String  state=request.getParameter("state");
    stmt.executeUpdate("update orders set state="+state+" where orderid="+orderid+"");
    response.sendRedirect("/bookshop/server/order/show_orderrule.jsp");
    %>
</html>
