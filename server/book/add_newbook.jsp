<%-- 
    Document   : add_newbook
    Created on : 2021-11-21, 20:04:08
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
        <script language="JavaScript">
        function Check_book() {
            if (document.mybook.bookname.value == "") {
                alert("请输入书名!");
                document.mybook.bookname.focus();
                return false;
            }
            if (document.mybook.author.value == "") {
                alert("请输入作者!");
                document.mybook.author.focus();
                return false;
            }
            if (document.mybook.pub.value == "") {
                alert("请输入出版社！");
                document.mybook.pub.focus();
                return false;
            }
            if (document.mybook.price.value == "") {
                alert("请输入单价!");
                document.mybook.price.focus();
                return false;
            }
            if (document.mybook.number.value == "") {
                alert("请输入数量!");
                document.mybook.number.focus();
                return false;
            }
            if (document.mybook.Introduction.value == "") {
                alert("请输入简介!");
                document.mybook.Introduction.focus();
                return false;
            }
           
        }
    </script>
        <title>Bookshop 管理端</title>
    </head>
    <body>
    <%
    String name=(String)session.getAttribute("username");
    if(name==null){response.sendRedirect("/bookshop/server/root_login.html");}
    %>
    <a href="show_bookrule.jsp">返回</a>
    <h1 align="center">添加新书籍</h1><br>
    <form method="post" action="add_newbook_tosql.jsp" name="mybook">
    <table align="center" border="1">
        <tr>
            <td align="right">书名：</td>
            <td><input type="text" name="bookname" style="width:250px"></td>
        </tr>
        <tr>
            <td align="right">作者：</td>
            <td><input type="text" name="author" style="width:250px"></td>
        </tr>
        <tr>
            <td align="right">出版社：</td>
            <td><input type="text" name="pub" style="width:250px"></td>
        </tr>
        <tr>
            <td align="right">单价：</td>
            <td><input type="text" name="price" style="width:250px"></td>
        </tr>
        <tr>
            <td align="right">数量：</td>
            <td><input type="text" name="number" style="width:250px"></td>
        </tr>
        <tr>
            <td align="right">简介：</td>
            <td><textarea name="Introduction" style="width:250px; height:200px;font-size: 14px;font-family:微软雅黑"></textarea></td>
        </tr>
        <tr>
            <td align="right">图片：</td>
            <td><input type="file" name="img"></td>
        </tr><br>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="添加新书" onclick="return Check_book()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="重置"></td>
        </tr>
    </table>
    </form>
    </body>
</html>
