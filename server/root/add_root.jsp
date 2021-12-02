<%-- 
    Document   : add_root
    Created on : 2021-11-22, 20:50:19
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
        </style>
        <script language="JavaScript">
        function Check_root() {
            if (document.myroot.username.value == "") {
                alert("请输入 Root 用户名!");
                document.myroot.username.focus();
                return false;
            }
            if (document.myroot.password.value == "") {
                alert("请输入密码!");
                document.myroot.password.focus();
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
    <a href="show_rootrule.jsp">返回</a>
    <h1 align="center">添加管理员</h1><br>
    <form method="post" action="add_newroot.jsp" name="myroot">
    <table align="center" border="1">
        <tr>
            <td align="right">root 用户名：</td>
            <td><input type="text" name="username" style="width:250px"></td>
        </tr>
        <tr>
            <td align="right">密码：</td>
            <td><input type="text" name="password" style="width:250px"></td>
        </tr>
            <td colspan="2" align="center">
                <input type="submit" value="添加管理员" onclick="return Check_root()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="reset" value="重置"></td>
        </tr>
    </table>
    </form>
    </body>
</html>
