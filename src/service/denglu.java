package service;

import dao.UserDao;
import dao.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


public class denglu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String uName=request.getParameter("userName");
        String password=request.getParameter("password");
        response.setCharacterEncoding("utf-8");
        PrintWriter out =response.getWriter();
        response.setContentType("text/html;charset=utf-8");

        UserDao com = new UserDaoImpl();
        try {
            if(com.login(uName, password)) {
                HttpSession session=request.getSession();
                session.setAttribute("NAME",uName);
               // request.setAttribute("name", uName);
                request.getRequestDispatcher("a.jsp").forward(request, response);



            }
            else
            { out.print("<script>alert('账号密码不匹配');window.location.href='index.jsp'</script>");
                //response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
