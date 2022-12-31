package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginControl", value = "/LoginControl")
public class LoginControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals("c_uname")) {
                    request.setAttribute("usernameCookie", c.getValue());
                }
                if (c.getName().equals("c_pass")) {
                    request.setAttribute("passwordCookie", c.getValue());
                }
            }
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            String uname = request.getParameter("uname");
            String pass = request.getParameter("password");
            String remember = request.getParameter("remember");

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
                session.setAttribute("fullName", acc.getFullName());
                session.setMaxInactiveInterval(60 * 60 * 12 * 24);

                // cookie
                Cookie cookie_username = new Cookie("c_uname", uname);
                Cookie cookie_pass = new Cookie("c_pass", pass);
                cookie_username.setMaxAge(60);
                if (remember != null) {
                    cookie_pass.setMaxAge(60);
                } else {
                    cookie_pass.setMaxAge(0);
                }
                response.addCookie(cookie_username);
                response.addCookie(cookie_pass);

                //
                response.sendRedirect("home");
            }
        } catch (Exception e) {

        }
    }
}
