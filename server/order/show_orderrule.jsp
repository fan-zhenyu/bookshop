<%-- 
    Document   : show_orderrule
    Created on : 2021-11-22, 19:38:41
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!--公共头开始-->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            html{
                background: url(/bookshop/server/image/yellow_blue.jpg);
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
        <title>Bookshop 管理端</title>
    </head>
    <body>
    <%
    String name=(String)session.getAttribute("username");
    if(name==null){response.sendRedirect("/bookshop/server/root_login.html");}
    %>
    <a href="/bookshop/server/login/hello.jsp">返回</a>
    <h1 align="center">欢迎来到订单管理</h1>
    <!--<h2>欢迎您：</h2>-->
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From orders");
    %>
    <table border="1" bgcolor="C0D9D9" align="center">
        <tr bgcolor="yellow"><b>	
            <td align="center">订单号</td>
            <td align="center">用户名</td>
            <td align="center">购买书籍</td>
            <td align="center">数量</td>
            <td align="center">总金额</td>
            <td align="center">收货人</td>
            <td align="center">收货人手机号</td>
            <td align="center">邮编</td>
            <td align="center">收货人住址</td>
            <td align="center">购买日期</td>
            <td align="center">状态</td>
            <td align="center">功能</td>
        </b></tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%=rs.getString("orderid")%></td>
            <td align="center"><%=rs.getString("username")%></td>
            <td align="center"><%=rs.getString("bookname")%></td>
            <td align="center"><%=rs.getString("number")%></td>
            <td align="center"><%=rs.getString("total")%></td>
            <td align="center"><%=rs.getString("name")%></td>
            <td align="center"><%=rs.getString("phone")%></td>
            <td align="center"><%=rs.getString("Postcodes")%></td>
            <td align="center"><%=rs.getString("address")%></td>
            <td align="center"><%=rs.getString("date")%></td>
            <td align="center"><%=rs.getString("state")%></td>
            <td align="center">
            <a href="/bookshop/server/order/delete_order.jsp?orderid=<%=rs.getString("orderid")%>">删除</a><br><br>
            <a href="/bookshop/server/order/change_order_state.jsp?orderid=<%=rs.getString("orderid")%>&state=<%=rs.getString("state")%>">更改</a></td>
        </tr>
        <%
           }
        %>
    </table>
    </body>
</html>

