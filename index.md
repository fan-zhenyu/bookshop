<h1>response.sendRedirect() 传中文参数的问题</h1>
String temp = "中文参数"
temp= java.net.URLEncoder.encode(temp.toString(),"utf8");
response.sendRedirect("jieshou.jsp?temp="+temp);