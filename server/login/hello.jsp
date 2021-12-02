<%-- 
    Document   : hello
    Created on : 2021-11-21, 18:08:20
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!--公共头开始-->
<html>
    <%
    String name=(String)session.getAttribute("username");
    if(name==null){response.sendRedirect("/bookshop/server/root_login.html");}
    java.util.Date d = new java.util.Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String now = df.format(d);
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="/bookshop/server/login/hello.css">
        <title>Bookshop 管理端</title>
    </head>
    <body>
        <h2 align="center">Welcome 后台管理</h2>
        <h3 align="right">今天是：<%=now%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/bookshop/server/login/inva_root_login.jsp">注销</a>&nbsp;&nbsp;&nbsp;&nbsp;</h3>
        <h3>欢迎您：<%=name%></h3><br>
        <div>
        <ul>
            <li><a href="../book/show_bookrule.jsp">书籍管理</a></li>
            <li><a href="../user/show_userrule.jsp">用户管理</a></li>
            <li><a href="../order/show_orderrule.jsp">订单管理</a></li>
            <li><a href="../mark/show_markrule.jsp">留言管理</a></li>
            <li><a href="../root/show_rootrule.jsp">管理员管理</a></li>
        </ul>
        </div>
<!--公共头结束-->
</body>
</html>
