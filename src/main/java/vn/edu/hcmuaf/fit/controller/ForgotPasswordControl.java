package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ForgotPasswordDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.ForgotPassword;
import vn.edu.hcmuaf.fit.service.MailService;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ForgotPasswordControl", value = "/ForgotPasswordControl")
public class ForgotPasswordControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        MailService ms = new MailService();
        String otp = ms.getRandom();
        if (!email.isEmpty()) {
            if (new ForgotPasswordDAO().checkEmailExists(email) != null) {
                Account account = new ForgotPasswordDAO().checkEmailExists(email);
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                Date expireTime = new Date(timestamp.getTime());
                ForgotPassword forgotPassword = new ForgotPassword(email, otp, expireTime);
                boolean test = ms.sendEmailForgotPassword(forgotPassword);
                if (test) {
                    HttpSession session = request.getSession();
                    session.setAttribute("forgot", forgotPassword);
                    session.setAttribute("userId", account.getId());
                    request.getRequestDispatcher("enterOTP.jsp").forward(request, response);
                } else {
                    System.out.println("Gửi không thành công");
                }
            } else {
                request.setAttribute("error", "Email chưa đăng ký tài khoản");
                request.getRequestDispatcher("lostpassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Vui lòng nhập địa chỉ email");
            request.getRequestDispatcher("lostpassword.jsp").forward(request, response);

        }
    }

}
