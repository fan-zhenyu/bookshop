<%-- 
    Document   : mymess
    Created on : 2021-11-14, 20:03:08
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/bookshop/index.css">
        <title>Bookshop</title>
    </head>
<body>
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();  
    String sname=(String)session.getAttribute("username");
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From message where username = '"+sname+"'");
    %>
    <div>
        <table width="100%">
            <tr>
                <td><img src="/bookshop/images/logo.jpg"></td>
                <td align="right">欢迎您：</td>
                <td>
                    <font color="blue"><a href="mymess.jsp">
                    <%
                    String name=(String)session.getAttribute("username");
                    if(name==null){
                    response.sendRedirect("/bookshop/client/login/login.jsp");
                    }else {
                        
                        %>
                        <a href="mymess.jsp">   
                        <%
                    out.println(name);
                    }
                    %></a></font>
                </td>
                <td><a href="/bookshop/client/login/inva_login.jsp">注销</a></td>
            </tr>
        </table>
    </div>
    <ul id="nav">
        <li><a href="/bookshop/index.jsp">首页</a></li>
        <li><a href="/bookshop/client/find/search.jsp">查找</a></li>
        <li><a href="/bookshop/client/order/show_order.jsp">订单</a></li>
        <li><a href="/bookshop/client/cart/showcart.jsp">购物车</a></li>
        <li><a href="/bookshop/client/comments/show_review.jsp">留言</a></li>
    </ul>
    <!--公共头部 结束-->
    <div>
        <h1 align="center" color="black">个人信息</h1>
        <table align="center" border="1">
            <%
                if(rs.next()){
            %>
            <tr>
                <td>用户名：</td>
                <td><%= rs.getString("username")%></td>
            </tr>
            <tr>
                <td>手机号：</td>
                <td><%= rs.getString("phone")%></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><%= rs.getString("name")%></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td><%= rs.getString("sex")%></td>
            </tr>
            <tr>
                <td>住址：</td>
                <td><%= rs.getString("address")%></td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><%= rs.getString("age")%></td>
            </tr>
            <%
            }
            %>
        </table>
    </div>
</body>
</html>
