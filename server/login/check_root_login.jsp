<%-- 
    Document   : check_root_login
    Created on : 2021-11-21, 18:02:43
    Author     : SUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <%
        request.setCharacterEncoding("utf-8");
        String  name=request.getParameter("username");
        String  pass=request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
        Statement stmt=conn.createStatement(); 
        ResultSet rs; //建立ResultSet(结果集)对象
        rs=stmt.executeQuery("Select * From root where username = '"+name+"' and password = '"+pass+"'");
        //校验是否登录成功
        if(rs.next()){
               //如果登录成功，建立session
               session.setAttribute("username",name);//建立session
               session.setAttribute("password",pass);
               //获得sessionID，并将session在控制台输出
               System.out.println("sessionID"+session.getId());
               request.getRequestDispatcher("hello.jsp").forward(request,response);
           }else{
               response.sendRedirect("/bookshop/server/root_login.html");
           }
       %>
</html>
