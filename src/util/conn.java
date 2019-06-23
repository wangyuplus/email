package util;

import java.sql.*;

public class conn {

    public static final String URL = "jdbc:mysql://localhost:3306/mysql?serverTimezone=GMT";//mysql数据库名
    public static final String USER = "root";
    public static final String PASSWORD = "111111";

    static Connection  conn = null;
    static ResultSet rs = null;
    static PreparedStatement ps =null;
    public static void init(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            System.out.println("init [SQL驱动程序初始化失败！]");
            e.printStackTrace();
        }
    }
    public static ResultSet selectSql(String sql){
        try {
            ps =  conn.prepareStatement(sql);
            rs =  ps.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("sql数据库查询异常");
            e.printStackTrace();
        }
        return rs;
    }
    public static int addUpdDel(String sql){
        int i = 0;
        try {
            PreparedStatement ps =  conn.prepareStatement(sql);
            i =  ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("sql数据库增删改异常");
            e.printStackTrace();
        }

        return i;
    }
    public static void closeConn() {
        // TODO Auto-generated method stub

    }





}
