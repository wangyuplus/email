package dao;

import util.conn;

import java.sql.ResultSet;
import java.sql.SQLException;

public  class UserDaoImpl implements UserDao{

    @Override
    public boolean login(String name, String pwd) {
        boolean flag = false;
        try {
            conn.init();
            ResultSet rs = conn.selectSql("SELECT userName, password FROM student");
            while(rs.next()){
                if(rs.getString("userName").equals(name) && rs.getString("password").equals(pwd)){
                    flag = true;
                }
            }
            conn.closeConn();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    public boolean register(String name,String password) {
        boolean flag = false;
        conn.init();
//		int i =DBconn.addUpdDel("insert into user(name,pwd,sex,home,info) " +
//				"values('"+user.getName()+"','"+user.getPwd()+"','"+user.getSex()+"','"+user.getHome()+"','"+user.getInfo()+"')");
        int i =conn.addUpdDel("insert into student(userName,password) " +
                "values('"+name+"','"+password+"')");
        if(i>0){
            flag = true;
        }
        conn.closeConn();
        return flag;
    }



}
