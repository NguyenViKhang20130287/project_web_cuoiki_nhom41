package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.database.dbConnect;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "logincontrol", value = "/logincontrol")
public class logincontrol extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        response.getWriter().println("ook");

        response.setContentType("text/html;charset=UTF-8");
        try {
            String email_uname = request.getParameter("email");
            String pass = request.getParameter("password");
//        response.getWriter().println(email);
//        response.getWriter().println(pass);
            dbConnect dbConnect_acc = new dbConnect();
            Account acc = dbConnect_acc.checkAccount(email_uname, pass);
            Account accUname = dbConnect_acc.checkAccountWithUname(email_uname, pass);

            if (acc == null && accUname == null) {
//                response.sendRedirect("login.jsp");
                request.setAttribute("Error", "Email hoặc mật khẩu không hợp lệ !");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {

        }
    }

}

