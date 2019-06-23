package dao;

public interface UserDao {
    public boolean login(String name,String pwd);//登录

    public	boolean register(String name,String password);


}
