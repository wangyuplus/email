<%@ page contentType="text/html; charset=utf8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import ="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import ="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>添加联系人</title>

</head>

<body>

<%
Object name=session.getAttribute("NAME");
String URL = "jdbc:mysql://localhost:3306/mysql?serverTimezone=GMT";
String USER = "root";
String PASSWORD = "111111";

request.setCharacterEncoding("utf8" );
String inuser=request.getParameter("user");

 Class.forName("com.mysql.jdbc.Driver");//1.加载驱动程序
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);//2. 获得数据库连接
        Statement stmt = conn.createStatement(); //3.操作数据库，实现增删改查
         stmt.executeUpdate("insert into address (inuser,userName) values ('"+inuser+"','"+name+"');");
       out.println("<script>window.location.href='txl.jsp'</script>");
        
	   
 %>

</body>
</html>