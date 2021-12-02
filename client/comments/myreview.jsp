<%-- 
    Document   : review
    Created on : 2021-11-21, 15:43:19
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <!--公共头部-->
<head>
    <title>Bookshop</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="/bookshop/index.css">
    <script>
        function check_view() 
        {
            if (document.myreview.bookname.value === "")
            {
                alert("请输入留言书籍!");
                document.myreview.bookname.focus();
                return false;
            }
             if (document.myreview.content.value === "")
            {
                alert("请输入留言内容!");
                document.myreview.content.focus();
                return false;
            }
        }
    </script>
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
    <h1 align="center">留言</h1>
    <form action="check_review.jsp?username=<%=name%>&date=<%=now%>" method="post" name="myreview">
    <table  border="1" align="center" width="95%" heihgt="70%">
            <tr>
                <td align="right" width="10%">留言书籍：</td> 
                <td><input type="text" name="bookname"></td>
            </tr>
            <tr>
                <td align="right">留言内容：</td> 
                <td><textarea style="width:1500px; height:350px;font-size: 22px;font-family:微软雅黑" name="content"></textarea></td>
            </tr>
    </table><br>
    <center>
    <input type="submit" name="submit" value="留言" onclick="return check_view()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" name="reset" value="重置">
    </center>
    </form>
    </body>
</html>
