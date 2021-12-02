<%-- 
    Document   : myorder
    Created on : 2021-11-17, 20:40:11
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
    <script>
//        function check_into_order() 
//        {
//            if(check_order()===true){alert("下单成功!");}
//           
//        }
        function check_order() 
        {
            if (document.myorder.name.value === "")
            {
                alert("请输入收货人!");
                document.myorder.name.focus();
                return false;
            }
             if (document.myorder.phone.value === "")
            {
                alert("请输入电话号!");
                document.myorder.phone.focus();
                return false;
            }
            if (document.myorder.Postcodes.value === "")
            {
                alert("请输入邮编!");
                document.myorder.Postcodes.focus();
                return false;
            }
            if (document.myorder.address.value === "")
            {
                alert("请输入住址!");
                document.myorder.address.focus();
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
                    String username=(String)session.getAttribute("username");
                    if(username==null){
                    response.sendRedirect("/bookshop/client/login/login.jsp");
                    }else {
                    %>
                    <a href="/bookshop/mymess.jsp">   
                    <%
                    out.println(username);
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
        <h1 align="center">我的订单</h1>
        <%
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
        Statement stmt=conn.createStatement();
        ResultSet rs; //建立ResultSet(结果集)对象
        rs=stmt.executeQuery("select img,bookname,price,SUM(number),price*SUM(number) from cart where username='"+username+"' group by bookname");
        %>
        <table border='1' align="center" bgcolor="#ddd">
            <tr>
                <td width="100px" align="center">图片</td>
                <td width="100px" align="center">书名</td>
                <td width="100px" align="center">单价</td>
                <td width="100px" align="center">数量</td>
                <td width="100px" align="center">金额</td>
            </tr>
            <%
            String order_bookname="";
            Integer order_number=0;
            double order_total=0;
            while(rs.next()){
            %>
            <tr>
                <td width="100px" align="center"><img src="<%=rs.getString("img")%>"  width="100px" height="100px"></td>
                <td width="100px" align="center"><%=rs.getString("bookname")%></td>
                <%
                    order_bookname+="《"+rs.getString("bookname")+"》";
                %>
                <td width="100px" align="center"><%=rs.getString("price")%>元</td>
                
                <td width="100px" align="center"><%=rs.getString("SUM(number)")%>本</td>
                <%
                    order_number+=Integer.valueOf(rs.getString("SUM(number)"));
                %>
                <td width="100px" align="center"><%=rs.getString("price*SUM(number)")%>元</td>
                <%
                    order_total+=Double.valueOf(rs.getString("price*SUM(number)"));
                %>
            </tr>
            <%
            }
            %>
        </table>
        <form name="myorder" action="check_order.jsp?username=<%=username%>&bookname=<%=order_bookname%>&number=<%=order_number%>&total=<%=order_total%>&date=<%=now%>" method="post">
        <table align="right">
            <tr><td align="right"><input type=submit value="结账" name="submit" onclick="return check_order()"></td></tr>
            <tr><td><input type=reset value="重填"></td></tr>
        </table>
        <table  border="1" align="right">
            <tr>
                <td colspan="2" align="right">收货人：</td> 
                <td colspan="2"><input type="text" name="name"></td>
            </tr>
            <tr>
                <td colspan="2" align="right">电话号：</td> 
                <td colspan="2"><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td colspan="2" align="right">邮编：</td> 
                <td colspan="2"><input type="text" name="Postcodes"></td>
            </tr>
            <tr>
                <td colspan="2" align="right">地址：</td> 
                <td colspan="2"><input type="text" name="address"></td>
            </tr>
        </table>
        <table align="right">
            <tr>
                <td>共计：</td>
                <td><%=String.format("%.2f",order_total)%>元&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>
        </form>
    </body>
</html>
