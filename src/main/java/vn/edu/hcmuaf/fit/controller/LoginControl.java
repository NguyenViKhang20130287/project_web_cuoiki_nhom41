package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginControl", value = "/LoginControl")
public class LoginControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().println("a");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String uname = request.getParameter("uname");
            String pass = request.getParameter("password");

            Account acc = new LoginDAO().login(uname, pass);

            if (acc == null) {
                request.setAttribute("Error", "Username hoặc mật khẩu không hợp lệ !");
                request.getRequestDispatcher("login.jsp").forward(request, response);

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("Account", acc);
                session.setAttribute("username", uname);
                String role = String.valueOf(acc.getRole());
                session.setAttribute("role", role);
                session.setMaxInactiveInterval(180);
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {

        }
    }
}
