package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.RegisterDAO;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterControl", value = "/RegisterControl")
public class RegisterControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String uname = request.getParameter("uname");
        String email = request.getParameter("email_register");
        String pass = request.getParameter("pass_register");

        Account acc = new RegisterDAO().checkAccountUnameAndEmail(uname, email);

        if (acc == null) {
            new RegisterDAO().signUp(uname, email, pass);
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("message_regis", "Email hoặc mật khẩu đã tồn tại !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }


    }

}

