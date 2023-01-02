package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.RegisterDAO;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterControl", value = "/RegisterControl")
public class RegisterControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String uname = request.getParameter("uname");
        String email = request.getParameter("email_register");
        String pass = request.getParameter("pass_register");

        Account acc = new RegisterDAO().checkAccountUnameAndEmail(uname, email);

        if (acc == null) {
            new RegisterDAO().signUp(uname, email, pass);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Đăng kí thành công');");
            out.println("location='LoginControl';");
            out.println("</script>");

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username hoặc email đã tồn tại !');");
            out.println("location='LoginControl';");
            out.println("</script>");
        }


    }

}

