<%-- 
    Document   : show_review
    Created on : 2021-11-21, 16:02:57
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
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
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From remarks");
    %>
    <h1 align="center">历史留言</h1>
    <table border="1" bgcolor="#ddd" align="center">
        <tr bgcolor=#590><b>	
            <td width="15%" align="center">留言记录</td>
            <td width="15%" align="center">留言人</td>
            <td width="15%" align="center">留言书籍</td>
            <td width="35%" align="center">留言内容</td>
            <td width="10%" align="center">留言日期</td>
        </b></tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td align="center"><%=rs.getString("markid")%></td>
            <td align="center"><%=rs.getString("username")%></td>
            <td align="center"><%=rs.getString("bookname")%></td>
            <td align="center"><%=rs.getString("content")%></td>
            <td align="center"><%=rs.getString("date")%></td>
        </tr>
        <%
           }
        %>
</table><br>
<center><a href="/bookshop/client/comments/myreview.jsp">添加新留言</a></center>
</html>
