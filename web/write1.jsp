<%@ page contentType="text/html; charset=utf8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import ="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import ="java.sql.*"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<html>
<body>
<%
SimpleDateFormat df=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
String s=df.format(new Date());
Object name=session.getAttribute("NAME");
request.setCharacterEncoding("utf8" );
String URL = "jdbc:mysql://localhost:3306/mysql?serverTimezone=GMT";
String USER = "root";
String PASSWORD = "111111";
String str1 = request.getParameter("inuser");
String str2 = request.getParameter("xin");
String str3 = request.getParameter("zhu");

        Class.forName("com.mysql.jdbc.Driver");//1.������������
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);//2. ������ݿ�����
        Statement stmt = conn.createStatement(); //3.�������ݿ⣬ʵ����ɾ�Ĳ�
         stmt.executeUpdate("insert into address (inuser,xin,userName,zhu,sj) values ('"+str1+"','"+str2+"','"+name+"','"+str3+"','"+s+"');");
       out.println("<script>window.location.href='write.jsp'</script>"); 
%>
</html>
</body>