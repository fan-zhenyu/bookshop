<%-- 
    Document   : show_userrule
    Created on : 2021-11-21, 22:25:50
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
            .imgdx{
                width: 200px;
                height: 200px;
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
    <h1 align="center">欢迎来到用户管理</h1>
    
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From message");
    %>
    <table border="1" bgcolor="C0D9D9" align="center">
        <tr bgcolor="yellow"><b>	
            <td width="10%" align="center">用户名</td>
            <td width="15%" align="center">密码</td>
            <td width="20%" align="center">手机号</td>
            <td width="10%" align="center">真实姓名</td>
            <td width="10%" align="center">性别</td>
            <td width="20%" align="center">住址</td>
            <td width="10%" align="center">年龄</td>
            <td width="20%" align="center">功能</td>
        </b></tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%=rs.getString("username")%></td>
            <td align="center"><%=rs.getString("password")%></td>
            <td align="center"><%=rs.getString("phone")%></td>
            <td align="center"><%=rs.getString("name")%></td>
            <td align="center"><%=rs.getString("sex")%></td>
            <td align="center"><%=rs.getString("address")%></td>
            <td align="center"><%=rs.getString("age")%></td>
            <td align="center">
            <a href="delete_user.jsp?username=<%=rs.getString("username")%>">删除</a><br><br>
            <a href="change_user.jsp?username=<%=rs.getString("username")%>">更改</a></td>
        </tr>
        <%
           }
        %>
    </table>
    </body>
</html>

