<%-- 
    Document   : change_mark_content
    Created on : 2021-11-22, 20:33:48
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
    <a href="/bookshop/server/mark/show_markrule.jsp">返回</a>
    <h1 align="center">欢迎来到留言管理</h1>
    <h2 align="center">根据markid添加管理员留言</h2>
    <%
    request.setCharacterEncoding("utf-8");
    String  markid=request.getParameter("markid");
    String  oldcontent=request.getParameter("content");
    %>
    <form method="post" action="change_content.jsp?oldcontent=<%=oldcontent%>">
    <table align="center">
        <tr>
            <td align="right">留言id：</td>
            <td><input type="text" name="markid" value="<%=markid%>"></td>
        </tr>
        <tr>
            <td align="right">添加管理员留言：</td>
            <td><input type="text" name="newcontent"></td>
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


