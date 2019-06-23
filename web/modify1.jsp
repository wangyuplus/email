<%@ page contentType="text/html; charset=utf8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import ="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import ="java.sql.*"%>
<html>
<head>
<title>删除联系人</title>
</head>
<body>
<%

request.setCharacterEncoding("utf8" );
String URL = "jdbc:mysql://localhost:3306/mysql?useUnicode=true&serverTimezone=GMT";
String USER = "root";
String PASSWORD = "111111";
String user=request.getParameter("inuser");

         Class.forName("com.mysql.jdbc.Driver");//1.加载驱动程序
         Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);//2. 获得数据库连接
        Statement stmt = conn.createStatement(); //3.操作数据库，实现增删改查
        stmt.executeUpdate("delete from address  where inuser='"+user+"'");
        
	out.println("<script>window.location.href='address.jsp'</script>");   
 %>

</body>
</html>