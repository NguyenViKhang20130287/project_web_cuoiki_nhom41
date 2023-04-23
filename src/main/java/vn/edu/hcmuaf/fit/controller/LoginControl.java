package vn.edu.hcmuaf.fit.controller;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
            Account account = new LoginDAO().getAccount(uname);
            AccountService accountService = AccountService.getInstance();
            if (uname.equals("") && pass.equals("")) {
                request.setAttribute("Error", "Vui lòng nhập tên đăng nhập và mật khẩu");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (uname.equals("")) {
                request.setAttribute("ErrorUsername", "Vui lòng nhập tên đăng nhập");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (!accountService.validateUsername(uname)) {
                request.setAttribute("ErrorUsername", "Tên đăng nhập không đúng định dạng");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (account == null) {
                request.setAttribute("ErrorUsername", "Tên đăng nhập không tồn tại");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            if (pass.equals("")) {
                request.setAttribute("ErrorPass", "Vui lòng nhập mật khẩu");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if (!accountService.validatePassword(pass)) {
                request.setAttribute("ErrorPass", "Mật khẩu không đúng định dạng");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                String hashedPassword = new LoginDAO().getAccount(uname).getPassword();
                if (!BCrypt.checkpw(pass, hashedPassword)) {
                    request.setAttribute("Error", "Mật khẩu không chính xác");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    Account acc = new LoginDAO().getAccount(uname);
                    HttpSession session = request.getSession();
                    session.setAttribute("Account", acc);
                    session.setAttribute("username", uname);
                    session.setAttribute("email", acc.getEmail());
                    session.setAttribute("phoneNumber", acc.getPhone());
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
            }
        } catch (Exception e) {

        }
    }
}
