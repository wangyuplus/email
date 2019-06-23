package service;

import dao.UserDao;
import dao.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

@WebServlet(name = "zhuce")
public class zhuce extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uName=request.getParameter("userName");
        String password=request.getParameter("password");
        response.setCharacterEncoding("utf-8");
        PrintWriter out =response.getWriter();
        response.setContentType("text/html;charset=utf-8");

        UserDao com = new UserDaoImpl();
        String regex="^[1][3,4,5,7,8][0-9]{9}$";
        Pattern pattern=Pattern.compile(regex);
        java.util.regex.Matcher matcher=pattern.matcher(uName);
        boolean rs =matcher.matches();
        //out.println(rs);
        int flag = 0;
        if(!rs) {

            out.println("<script>alert('账号必须为手机号');window.location.href='register.jsp'</script>");
            flag=1;
        }

       /* else if(password==""){

            out.println("<script>alert('密码不能为空');window.location.href='register.jsp'</script>");
            flag=1;
        }*/
        else if(flag!=1) {
         try {

                if(com.register( uName, password)) {

                    out.println("<script>alert('注册成功，跳转登录页面');window.location.href='index.jsp'</script>");
                }
                else
                {
                    response.sendRedirect("register.jsp");
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
