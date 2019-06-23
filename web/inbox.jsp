<%@ page contentType="text/html; charset=utf8" language="java" errorPage="" %>
<!DOCTYPE HTML PUBLIC "_//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" import ="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import ="java.sql.*"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
 
<html>
<script>
function f3()
{
window.location="./a.jsp"
}
</script>
<title>收件箱</title>
<body>

<%
Object name=session.getAttribute("NAME");

String URL = "jdbc:mysql://localhost:3306/mysql?useUnicode=true&serverTimezone=GMT";
String USER = "root";
String PASSWORD = "111111";
String user="";
String pass="";
         Class.forName("com.mysql.jdbc.Driver");//1.加载驱动程序
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);//2. 获得数据库连接
        Statement stmt = conn.createStatement(); //3.操作数据库，实现增删改查
        ResultSet rs = stmt.executeQuery("select * from address where inuser='"+name+"'");
      
       while(rs.next())
          {out.println("主题: "+rs.getString("zhu"));
            out.println("<br>");    
            out.println("写信人 : "+rs.getString("userName"));
            out.println("<br>");            
            out.println("内容 :  "+rs.getString("xin"));
            out.println("<br>");
       out.println("时间 :  "+rs.getString("sj"));
            out.println("<br>");
            out.println("<br>");




            
           }
        
             		 
       
%>


</body>

</html>