<%-- 
    Document   : show_order
    Created on : 2021-11-18, 21:59:48
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
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From orders where username='"+name+"'");
    %>
    <h1 align="center">您的历史订单</h1>
    <%
    if(!rs.next()){
    %>
        <h1 align="center">历史订单为空</h1>
    <%
    }else{
        rs=stmt.executeQuery("Select * From orders where username='"+name+"'");
    %>
    <table border="1" bgcolor="#ddd">
        <tr bgcolor=#590><b>	
            <td width="8%" align="center">购买人</td>
            <td width="8%" align="center">书籍</td>
            <td width="10%" align="center">总数</td>
            <td width="10%" align="center">金额</td>
            <td width="10%" align="center">收货人</td>
            <td width="10%" align="center">电话号</td>
            <td width="10%" align="center">邮编</td>
            <td width="10%" align="center">住址</td>
            <td width="10%" align="center">日期</td>
            <td width="20%" align="center">订单状态</td>
        </b></tr>
        <%
            while(rs.next()){
        %>
            <tr bgcolor="#ddd">
            <td align="center"><%=rs.getString("username")%></td>
            <td align="center">
            <%=rs.getString("bookname")%>
<!--//                for(int i=0;i<bo.length();i++)-->
<!--//                {-->
<!--//                    if(bo=="》")-->
<!--//                    {bo = bo + "<br>";}-->
<!--//                }-->
<!--//                out.print(bo);-->
            </td>
            <td align="center"><%=rs.getString("number")%>本</td>
            <td align="center"><%=rs.getString("total")%>元</td>
            <td align="center"><%=rs.getString("name")%></td>
            <td align="center"><%=rs.getString("phone")%></td>
            <td align="center"><%=rs.getString("Postcodes")%></td>
            <td align="center"><%=rs.getString("address")%></td>
            <td align="center"><%=rs.getString("date")%></td>
            <td align="center">
            <%
            if(Integer.valueOf(rs.getString("state"))==0){out.print("未发货");}
            else if(Integer.valueOf(rs.getString("state"))==1){out.print("已发货");}
            else if(Integer.valueOf(rs.getString("state"))==2){out.print("已送达");}
            %>
            </td>
            </tr>
        <%
        }
        }
        %>
    </body>
</html>
