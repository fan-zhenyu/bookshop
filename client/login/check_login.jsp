<%-- 
    Document   : check_login
    Created on : 2021-11-14, 15:48:42
    Author     : SUS
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*" %>
<html>
<head>   
 <title>校验页面</title>
</head>
<body>
     <%
        request.setCharacterEncoding("utf-8");
        String  name=request.getParameter("username");
        String  pass=request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
        Statement stmt=conn.createStatement(); 
        ResultSet rs; //建立ResultSet(结果集)对象
        rs=stmt.executeQuery("Select * From message where username = '"+name+"' and password = '"+pass+"'");
        //校验是否登录成功
        if(rs.next()){
               //如果登录成功，建立session
               session.setAttribute("username",name);//建立session
               session.setAttribute("password",pass);
               //获得sessionID，并将session在控制台输出
               System.out.println("sessionID"+session.getId());
               request.getRequestDispatcher("../../index.jsp").forward(request,response);
           }else{
               response.sendRedirect("login.jsp");
           }
       %>
</body>
</html>
