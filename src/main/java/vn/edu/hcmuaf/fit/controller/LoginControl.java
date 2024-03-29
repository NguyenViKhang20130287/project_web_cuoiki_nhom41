package vn.edu.hcmuaf.fit.controller;

import eu.bitwalker.useragentutils.UserAgent;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.CartDao;
import vn.edu.hcmuaf.fit.dao.LogDAO;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.*;
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
            Account account = new LoginDAO().getAccount(uname);
            AccountService accountService = AccountService.getInstance();
            LogService logService = LogService.getInstance();
            if (uname.equals("") && pass.equals("")) {
                request.setAttribute("error", "Vui lòng nhập tên đăng nhập và mật khẩu.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (uname.equals("")) {
                request.setAttribute("errorUsername", "Vui lòng nhập tên đăng nhập.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (pass.equals("")) {
                request.setAttribute("errorPass", "Vui lòng nhập mật khẩu.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if (account != null) {
                String hashedPassword = account.getPassword();
                if (!BCrypt.checkpw(pass, hashedPassword)) {
                    logService.insertNewLog(new Log(Log.WARNING, account.getId(), this.getClass().getName(), "Đăng nhập thất bại", 0, logService.getIpClient(request), logService.getBrowserName(request)));
                    int countFails = logService.countLoginFail(account.getId());
                    if (countFails < 5) {
                        request.setAttribute("error", "Mật khẩu không chính xác. Người dùng lưu ý: Tài khoản sẽ bị khóa nếu nhập sai mật khẩu 5 lần trở lên.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    } else {
                        accountService.lockUser(account.getId());
                        logService.insertNewLog(new Log(Log.DANGER, account.getId(), this.getClass().getName(), "Tài khoản có tên đăng nhập: "+account.getUsername()+" đã bị khóa sau nhiều lần đăng nhập thất bại", 0, logService.getIpClient(request), logService.getBrowserName(request)));
                        request.setAttribute("error", "Tài khoản của bạn đã bị khóa.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    if (account.getLocked() == 1) {
                        request.setAttribute("error", "Tài khoản của bạn đã bị khóa.");
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
                        String isSocial = String.valueOf(account.getIsSocial());
                        session.setAttribute("isSocial", isSocial);
                        new LogDAO().updateStatus(account.getId());
                        List<CartItem> cartItems = new CartDao().getListCartItem(account.getId());
                        HashMap<Integer, CartItem> cart = new HashMap<>();
                        for (CartItem item : cartItems) {
                            cart.put(item.getProduct().getId(), item);
                        }
                        List<Favorite> favoriteList = new ProductDAO().getListFavoriteItem(account.getId());
                        session.setAttribute("cart", cart);
                        session.setAttribute("favorite", favoriteList);
                        session.setMaxInactiveInterval(60 * 60 * 12 * 24);
                        logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), "Đăng nhập thành công", 0, logService.getIpClient(request), logService.getBrowserName(request)));

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
                request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu sai.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
