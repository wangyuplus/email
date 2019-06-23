package service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;


@WebServlet(name = "Servlet")
public class Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String USER = "root";
        final String PASS = "111111";
        final String DB_URL = "jdbc:mysql://localhost:3306/mysql?serverTimezone=GMT";
        Connection conn = null;
        Statement stmt = null;
        JSONObject jsonObj = new JSONObject();
        JSONArray array = new JSONArray();

        // 注册 JDBC 驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        // 打开链接
        System.out.println("连接数据库1...");


        try {
            conn = DriverManager.getConnection(DB_URL,USER,PASS);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 执行查询
        System.out.println(" 实例化Statement对象...");
        try {
            stmt = conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        HttpSession session=request.getSession();
        Object name=session.getAttribute("NAME");
       /* HttpSession session=request.getSession();
        session.setAttribute();*/
        String sql = "select * from address where inuser='"+name+"'";

        ResultSet rs = null;
        try {
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //获取列表
        ResultSetMetaData metaData = null;
        try {
            metaData = rs.getMetaData();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int columnCount= 0;

        try {
            columnCount = metaData.getColumnCount();

        } catch (SQLException e) {

            e.printStackTrace();
        }

        //Map<String,Object> sss= new HashMap<>();
        // 展开结果集数据库

        while(true){

            try {
                if (!rs.next()) break;
            } catch (SQLException e) {
                e.printStackTrace();
            }

            // 通过字段检索
            //遍历ResultSetMetaData数据每一列
            for(int i = 1; i <= columnCount;i++) {
                String columnName = null;

                try {
                    columnName = metaData.getColumnLabel(i);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                String value = null;
                try {
                    value = rs.getString(columnName);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                jsonObj.put(columnName,value);
            }
            array.add(jsonObj);
        }
        JSONObject sss = new JSONObject();
        sss.put("code", 0);
        sss.put("msg", "");
        sss.put("count", columnCount);
        sss.put("data", array);

        /*System.out.println(array);
        System.out.println(sss);*/
        response.getWriter().write(String.valueOf(sss));


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         // response.getWriter().append("{\"code\":0,\"msg\":\"\",\"count\":2,\"data\":[{\"userName\":\"15291379509\",\"password\":\"666\"},{\"userName\":\"15891438495\",\"password\":\"666\"},{\"userName\":\"666\",\"password\":\"666\"},{\"userName\":\"aaa\",\"password\":\"aaa\"},{\"userName\":\"bbb\",\"password\":\"ccc\"}]}");

    doPost(request,response);
    }
}
