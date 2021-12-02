<%-- 
    Document   : login
    Created on : 2021-11-12, 15:44:57
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Bookshop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="Fit_login.css" />
        <script language="JavaScript">
        function cheaklogin()
        {
            if( document.mylogin.username.value == "" )
            { alert("请输入账号!"); document.mylogin.username.focus(); return false; }
            if( document.mylogin.password.value == "" )
            { alert("请输入密码!"); document.mylogin.password.focus(); return false; }
        }
        </script>
    </head>
    <body>
        <form action="check_login.jsp" method="post" name="mylogin">
        <div id="s1">
            <table align="center">
                <tr >
                    <td rowspan="3"><a href="/bookshop/server/root_login.html"><img src="../../images/logo.jpg"></a>&nbsp;&nbsp;&nbsp;</td>
                    <td colspan="2">账号:&nbsp;<input type="text" placeholder="Enter your account number" name="username"></td>
                </tr>
                <tr>
                    <td colspan="2">密码:&nbsp;<input type="password" placeholder="Enter your password" name="password"></td>
              
                </tr>
                <tr>
                    <td id="a1"><a href="../reg.jsp"><input type="button" value="注册"></td>
                    <td id="a2"><input type=submit value="登录" name="submit" onclick="return cheaklogin()"></td>              
                </tr>
            </table>
        </div>
        </form>
    </body>
</html>

