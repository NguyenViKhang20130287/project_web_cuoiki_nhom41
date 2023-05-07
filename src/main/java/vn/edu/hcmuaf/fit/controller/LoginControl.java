package vn.edu.hcmuaf.fit.controller;

import eu.bitwalker.useragentutils.UserAgent;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.CartDao;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.CartItem;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.entity.Product;
import vn.edu.hcmuaf.fit.service.AccountService;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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
            String clientIP = request.getRemoteAddr();
            String browserInfo = request.getHeader("User-Agent");
            UserAgent userAgent = UserAgent.parseUserAgentString(browserInfo);
            String browserName = userAgent.getBrowser().getName();
            Account account = new LoginDAO().getAccount(uname);
            AccountService accountService = AccountService.getInstance();
            LogService logService = LogService.getInstance();
            if (uname.equals("") && pass.equals("")) {
                request.setAttribute("error", "Vui lòng nhập tên đăng nhập và mật khẩu");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (uname.equals("")) {
                request.setAttribute("errorUsername", "Vui lòng nhập tên đăng nhập");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            } else if (!accountService.validateUsername(uname)) {
                request.setAttribute("errorUsername", "Tên đăng nhập không đúng định dạng");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (pass.equals("")) {
                request.setAttribute("errorPass", "Vui lòng nhập mật khẩu");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            } else if (!accountService.validatePassword(pass)) {
                request.setAttribute("errorPass", "Mật khẩu không đúng định dạng");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (account != null) {
                String hashedPassword = account.getPassword();
                if (!BCrypt.checkpw(pass, hashedPassword)) {
                    logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getSimpleName(), "Đăng nhập thất bại", 0, clientIP, browserName));
                    int countFails = logService.countLoginFail(account.getId());
                    if (countFails < 5) {
                        request.setAttribute("error", "Mật khẩu không chính xác. Đăng nhập thất bại. Tài khoản còn " + (5 - countFails) + " lần đăng nhập lại");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        accountService.lockUser(account.getId());
                        request.setAttribute("error", "Tài khoản của bạn đã bị khóa");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    if (account.getLocked() == 1) {
                        request.setAttribute("error", "Tài khoản của bạn đã bị khóa");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        HttpSession session = request.getSession();
                        session.setAttribute("Account", account);
                        session.setAttribute("username", uname);
                        session.setAttribute("email", account.getEmail());
                        session.setAttribute("phoneNumber", account.getPhone());
                        String role = String.valueOf(account.getRole());
                        session.setAttribute("role", role);
                        session.setAttribute("fullName", account.getFullName());
                        List<CartItem> cartItems = new CartDao().getListCartItem(account.getId());
                        HashMap<Integer, CartItem> cart = new HashMap<>();
                        for (CartItem item : cartItems) {
                            cart.put(item.getProduct().getId(), item);
                        }
                        session.setAttribute("cart", cart);
                        session.setMaxInactiveInterval(60 * 60 * 12 * 24);
                        logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getSimpleName(), "Đăng nhập thành công", 0, clientIP, browserName));

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
            } else {
                request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu sai");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
