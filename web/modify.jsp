<%@ page contentType="text/html; charset=utf8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import ="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import ="java.sql.*"%>
<html>
<body>
<%
String name=(String)session.getAttribute("NAME");
String URL = "jdbc:mysql://localhost:3306/mysql?useUnicode=true&characterEncoding=utf8";
String USER = "root";
String PASSWORD = "111111";
String user="";
String pass="";
        Class.forName("com.mysql.jdbc.Driver");//1.加载驱动程序
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);//2. 获得数据库连接
        Statement stmt = conn.createStatement(); //3.操作数据库，实现增删改查
        ResultSet rs = stmt.executeQuery("SELECT inuser FROM address where userName='"+name+"'");
        while(rs.next()){//如果有数据，rs.next()返回true 
            out.println(rs.getString("inuser"));
             out.println("<br>");
             		 }
       
%>
<form  action="modify1.jsp" method="post"> 
<input type="text"  name="inuser"   size=10 maxlength=500><br>
<input type="submit" value="确定删除">

</form>
</body>

</html>