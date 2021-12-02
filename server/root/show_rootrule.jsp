<%-- 
    Document   : show_rootrule
    Created on : 2021-11-22, 20:46:17
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
    <h1 align="center">欢迎来到root管理</h1>
    <h2 align="center"><a href="/bookshop/server/root/add_root.jsp">添加管理员</a></h2>
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From root");
    %>
    <table border="1" bgcolor="C0D9D9" align="center">
        <tr bgcolor="yellow"><b>	
            <td width="40%" align="center">用户名</td>
            <td width="40%" align="center">密码</td>
            <td align="center">功能</td>
        </b></tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%=rs.getString("username")%></td>
            <td align="center"><%=rs.getString("password")%></td>
            <td align="center">
            <a href="delete_root.jsp?username=<%=rs.getString("username")%>">删除</a><br><br>
            <a href="change_root.jsp?username=<%=rs.getString("username")%>">更改</a></td>
        </tr>
        <%
           }
        %>
    </table>
    </body>
</html>

