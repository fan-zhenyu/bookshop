<%-- 
    Document   : change_order_state
    Created on : 2021-11-22, 20:01:35
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <a href="/bookshop/server/order/show_orderrule.jsp">返回</a>
    <h1 align="center">欢迎来到订单管理</h1>
    <h2 align="center">根据orderid更改配送状态</h2>
    <%
    request.setCharacterEncoding("utf-8");
    String  orderid=request.getParameter("orderid");
    %>
    <form method="post" action="change_state.jsp">
    <table align="center">
        <tr>
            <td align="right">订单号：</td>
            <td><input type="text" name="orderid" value="<%=orderid%>"></td>
        </tr>
        <tr>
            <td align="right">状态：</td>
            <td><input type="text" name="state"></td>
        </tr>
        
        <tr>
            <td colspan="2" align="right">
            <input type="submit" value="更改">&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="重置">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
    </form>
    </body>
</html>

