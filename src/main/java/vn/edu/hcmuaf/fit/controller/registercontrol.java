package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.database.dbConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "registercontrol", value = "/registercontrol")
public class registercontrol extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String uname = request.getParameter("uname");
        String email = request.getParameter("email_register");
        String pass = request.getParameter("pass_register");

        dbConnect dbConnect_register = new dbConnect();
        Account acc = dbConnect_register.checkAccountUnameAndEmail(uname, email);

        if (acc == null) {
            dbConnect_register.signUp(uname, email, pass);
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("message_regis", "Email hoặc mật khẩu đã tồn tại !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }


    }

}

