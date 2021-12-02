<%-- 
    Document   : show_bookrule
    Created on : 2021-11-21, 19:24:10
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
    <h1 align="center">欢迎来到书籍管理</h1>
    <h2>欢迎您：<%=name%></h2>
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From book");
    %>
    <h2 align="center">目前拥有书籍</h2>
    <h3 align="center"><a href="add_newbook.jsp">添加新书籍</a></h3>
    <table border="1" bgcolor="C0D9D9">
        <tr bgcolor="yellow"><b>	
            <td width="8%" align="center">图片</td>
            <td width="10%" align="center">书号</td>
            <td width="10%" align="center">书名</td>
            <td width="10%" align="center">作者</td>
            <td width="10%" align="center">出版社</td>
            <td width="10%" align="center">单价</td>
            <td width="30%" align="center">简介</td>
            <td align="center">功能</td>
        </b></tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td><img src="<%=rs.getString("img")%>" class="imgdx"></td>
            <td align="center"><%=rs.getString("bookid")%></td>
            <td align="center"><%=rs.getString("bookname")%></td>
            <td align="center"><%=rs.getString("author")%></td>
            <td align="center"><%=rs.getString("pub")%></td>
            <td align="center"><%=rs.getString("price")%>元</td>
            <td><%=rs.getString("Introduction")%></td>
            <td align="center">
            <a href="delete_book.jsp?bookid=<%=rs.getString("bookid")%>">删除</a><br><br>
            <a href="change_book_price.jsp?bookid=<%=rs.getString("bookid")%>">更改</a></td>
        </tr>
        <%
           }
        %>
    </table>
    </body>
</html>
