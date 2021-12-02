<%-- 
    Document   : addcart
    Created on : 2021-11-16, 10:38:44
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
    <link rel="stylesheet" type="text/css" href="/bookshop/client/cart/cart.css">
    </head>
<%
    request.setCharacterEncoding("utf8");
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
    <h1 align="center">购物车详情</h1>
    <%
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();
    Statement stmt1=conn.createStatement();
    ResultSet rs,rs1; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From cart where username='"+name+"'");
    %>
    <table border="1" id="nav">
         <%
            if(!rs.next()){
            %>  
            <h2 align="center">您的购物车为空</h2>
        <%
        }
        else{
        rs=stmt.executeQuery("select img,bookid,username,bookname,price,number,SUM(number),price*SUM(number) from cart where username='"+name+"' group by bookname");
        %>
          <tr bgcolor="#690"><b>	
            <td width="10%" align="center">图片</td>
            <td width="10%" align="center">书号</td>
            <td width="10%" align="center">书名</td>
            <td width="10%" align="center">单价</td>
            <td width="10%" align="center">数量</td>
            <td width="10%"></td>
            <td width="10%"></td>
            <td width="20%" align="center">总金额</td>
        </b></tr>
       
        <%
            try{
            while(rs.next()){
        %>
        <tr bgcolor="#ddd">
            <td><img src="<%=rs.getString("img")%>"  width="200px" height="200px"></td>
            <td align="center"><%=rs.getString("bookid")%></td>
            <td align="center"><%=rs.getString("bookname")%></td>
            <td align="center"><%=rs.getString("price")%>元</td>
            <td align="center"><%=rs.getString("SUM(number)")%>本</td>
            <td align="center">
                <font size="20px">
                <a href="/bookshop/client/cart/addcart.jsp?img=<%=rs.getString("img")%>&bookname=<%=rs.getString("bookname")%>&bookid=<%=rs.getString("bookid")%>&price=<%=rs.getString("price")%>" type="button">+</a>
                </font>
            </td>
            <%
            rs1=stmt1.executeQuery("select max(cartid),username,bookname from cart where username='"+name+"'and bookname='"+rs.getString("bookname")+"'");
            String cartid="";
            if(rs1.next())
            cartid=rs1.getString("max(cartid)");
            %>
            <td align="center">
                <font size="22px">
                <a href="/bookshop/client/cart/subcart.jsp?cartid=<%=cartid%>&sum=<%=rs.getString("SUM(number)")%>&bookname=<%=rs.getString("bookname")%>&number=<%=rs.getString("number")%>&price=<%=rs.getString("price")%>" type="button">-</a>
                </font></td>
            <td align="center"><%=rs.getString("price*SUM(number)")%>元</td>
            <%             
//            stmt.executeUpdate("insert into order_shop(img,username,bookname,price,number)Values('"+rs.getString("img")+"','"+name+"','"+rs.getString("bookname")+"','"+rs.getString("price")+"','"+rs.getString("sum")+"')");
            %>
        </tr>
        <%
        }
        }catch(Exception e){
             e.printStackTrace();
            out.print("载入错误");
        }
            
        }
        %>
    </table>
    <h2 align="center"><a href="/bookshop/client/order/myorder.jsp">提交订单</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/bookshop/client/cart/clearcart.jsp">清空购物车</h2>
</body>
</html>