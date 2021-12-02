<%-- 
    Document   : change_content
    Created on : 2021-11-22, 20:35:39
    Author     : SUS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%
    request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.jdbc.Driver");  
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
    Statement stmt=conn.createStatement();  
    String  markid=request.getParameter("markid");
    String  oldcontent=request.getParameter("oldcontent");
    String  newcontent=request.getParameter("newcontent");
    String  content=oldcontent+"    管理员留言："+newcontent;
    stmt.executeUpdate("update remarks set content='"+content+"' where markid="+markid+"");
    response.sendRedirect("/bookshop/server/mark/show_markrule.jsp");
    %>
</html>
