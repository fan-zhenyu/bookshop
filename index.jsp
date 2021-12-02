<%-- 
    Document   : index
    Created on : 2021-11-12, 16:44:36
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
    rs=stmt.executeQuery("Select * From book");
    %>
    <h1 align="center">图书展示</h1>
    <table border="1" bgcolor="#ddd">
        <tr bgcolor=#590><b>	
            <td width="8%" align="center">图片</td>
            <td width="10%" align="center">书号</td>
            <td width="10%" align="center">书名</td>
            <td width="10%" align="center">作者</td>
            <td width="10%" align="center">出版社</td>
            <td width="10%" align="center">单价</td>
            <td width="30%" align="center">简介</td>
            <td></td>
        </b></tr>
        <%
            while(rs.next()){
        %>
        <tr>
            <td><img src="<%=rs.getString("img")%>" class="sizeof"></td>
            <td align="center"><%=rs.getString("bookid")%></td>
            <td align="center"><%=rs.getString("bookname")%></td>
            <td align="center"><%=rs.getString("author")%></td>
            <td align="center"><%=rs.getString("pub")%></td>
            <td align="center"><%=rs.getString("price")%>元</td>
            <td><%=rs.getString("Introduction")%></td>
            <td align="center"><a href="/bookshop/client/cart/addto_cart.jsp?username=<%=name%>&bookid=<%=rs.getString("bookid")%>&bookname=<%=rs.getString("bookname")%>&img=<%=rs.getString("img")%>&price=<%=rs.getString("price")%>&number=<%=rs.getString("number")%>" type=button>加入购物车</a></td>
        </tr>
        <%
           }
        %>
    </table>
</body>

</html>
