<%-- 
    Document   : search
    Created on : 2021-11-19, 13:15:22
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
    <title>Bookshop</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/bookshop/index.css">
</head>
<%
    java.util.Date d = new java.util.Date();
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String now = df.format(d);
%>
<body>
    <div>
        <table width="100%">
            <tr>
                <td><img src="/bookshop/images/logo.jpg"></td>
                <td align="right">今天是：<%=now %>&nbsp;&nbsp;&nbsp;欢迎您：</td>
                <td>
                    <font color="blue">
                        <%
                    String name=(String)session.getAttribute("username");
                    if(name==null){
                    response.sendRedirect("/bookshop/client/login/login.jsp");
                    }else {
                        
                        %>
                        <a href="/bookshop/mymess.jsp">   
                        <%
                    out.println(name);
                    }
                    %>
                    </a>
                    </font>
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
    <h1 align="center">图书查询</h1><hr>
    <center>
        <form method="post" action="check_search.jsp">
            <table>
            <tr>
                <td align="right">请输入图书名称：</td>
                <td><input type="text" name="bookname" size="20" maxlength="20"></td>
            </tr>
            <tr>
                <td align="right">请输入作者：</td>
                <td><input type="text" name="author" size="20" maxlength="20"></td>
            </tr>
            <tr>
                <td align="right">请输入出版社名称：</td>
                <td><input type="text" name="pub" size="20" maxlength="20"></td>
            </tr>
            <tr>
                <td align="center"></td>
                <td align="center"><input type="submit" value="查询">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置"></td>
            </tr>
            </table>
        </form>
    </center>
    </body>
</html>
