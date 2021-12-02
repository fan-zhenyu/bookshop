<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<html>
<% 
   request.setCharacterEncoding("utf-8");
   String  username=request.getParameter("username");
   String  password=request.getParameter("password");
   String  phone=request.getParameter("phone");
   String  name=request.getParameter("name");
   String  sex=request.getParameter("sex");
   String  address=request.getParameter("address");
   String  age=request.getParameter("age");
   
   Class.forName("com.mysql.jdbc.Driver");  
   Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/bookshop","root","123456");  
   Statement stmt=conn.createStatement();  
   ResultSet rs1; //建立ResultSet(结果集)对象
   rs1=stmt.executeQuery("Select * From message where username = '"+name+"'");
   try{
   if(!rs1.next())
    {stmt.executeUpdate("insert into message(username,password,phone,name,sex,address,age)Values('"+username+"','"+password+"','"+phone+"','"+name+"','"+sex+"','"+address+"','"+age+"')");}   
   }
   catch(Exception e){
       e.printStackTrace();
   }
%>
<head>
    <title>注冊模块</title>
    <meta charset="UTF-8">
</head>
    <body>
    <%
    ResultSet rs; //建立ResultSet(结果集)对象
    rs=stmt.executeQuery("Select * From message where username = '"+username+"' and password = '"+password+"'and phone = '"+phone+"'and name = '"+name+"'");
    if(rs.next()){
    %>
        <h1>注册成功</h1>
    <%
    }else{
    %>
        <h1>注册失败</h1>
    <%
    }
    response.setHeader("Refresh","3;URL=../index.jsp");
    %>
    </body>
</html>
