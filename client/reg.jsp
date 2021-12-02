<%-- 
    Document   : reg
    Created on : 2021-11-13, 8:36:23
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>注册</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="reg.css" rel="stylesheet" type="text/css">
    <script language="JavaScript">
        function CheckSubmit() {
            if (document.myregform.username.value == "") {
                alert("请输入昵称!");
                document.myregform.username.focus();
                return false;
            }
            if (document.myregform.password.value == "") {
                alert("请输入密码!");
                document.myregform.password.focus();
                return false;
            }
            if (document.myregform.repassword.value == "") {
                alert("请验证密码!");
                document.myregform.repassword.focus();
                return false;
            }
            if (document.myregform.repassword.value != document.myregform.password.value) {
                alert("密码验证出错!");
                document.myregform.repassword.focus();
                return false;
            }
            if (document.myregform.phone.value == "") {
                alert("请输入手机号");
                document.myregform.phone.focus();
                return false;
            }
            if (document.myregform.name.value == "") {
                alert("请输入真实姓名!");
                document.myregform.name.focus();
                return false;
            }
            if (document.myregform.sex.value == "") {
                alert("请输入性别!");
                document.myregform.sex.focus();
                return false;
            }
            if (document.myregform.address.value == "") {
                alert("请输入住址!");
                document.myregform.address.focus();
                return false;
            }
            if (document.myregform.age.value == "") {
                alert("请输入年龄!");
                document.myregform.age.focus();
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
    <a href="login/login.jsp">返回登录</a>
    <div align="center" id="s1">
        <h1>Bookshop用户注册</h1>
        <form name="myregform" action="registered.jsp" method="post">
            <table>
                <tr align="right">
                    <td width="40%">账号:&nbsp;</td>
                    <td><input type=text name="username" size=22></td>
                </tr>
                <tr align="right">
                    <td>密码:&nbsp;</td>
                    <td><input type=password name="password" size=22></td>
                </tr>
                <tr align="right">
                    <td>验证密码:&nbsp;</td>
                    <td><input type=password name="repassword" size=22></td>
                </tr>
                <tr align="right">
                    <td>手机号:&nbsp;</td>
                    <td><input type=text name="phone" size=22></td>
                </tr>
                <tr align="right">
                    <td>真实姓名:&nbsp;</td>
                    <td><input type=text name="name" size=22></td>
                </tr>
                <tr>
                    <td align="right">性别:&nbsp;</td>
                    <td>
                        <input id="man" type="radio" checked="checked" name="sex" value="男"/>男
                        <input id="woman" type="radio" name="sex" value="女">女
                    </td>
                </tr>
                <tr align="right">
                    <td>住址:&nbsp;</td>
                    <td><input type=text name="address" size=22></td>
                </tr>
                <tr align="right">
                    <td>年龄:&nbsp;</td>
                    <td><input type=text name="age" size=22></td>
                </tr>
            </table>
            <br>
            <a>
                <input type=submit value="注册" name="submit" onclick="return CheckSubmit()">
                <input type=reset value="重新填写">
            </a>
        </form>
    </div>
</body>

</html>