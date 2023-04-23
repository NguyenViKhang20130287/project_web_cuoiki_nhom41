package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.entity.ForgotPassword;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

@WebServlet(name = "enterOTPControl", value = "/enterOTPControl")
public class enterOTPControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter();) {
            HttpSession session = request.getSession();
            ForgotPassword forgotPassword = (ForgotPassword) session.getAttribute("forgot");
            String code = request.getParameter("otp");
            if (code.equals("")) {
                request.setAttribute("errorOTP", "Vui lòng nhập mã xác thực");
                request.getRequestDispatcher("enterOTP.jsp").forward(request, response);
                return;
            } else {
                if (code.equals(forgotPassword.getOtp())) {
                    Timestamp sentTime = new Timestamp(forgotPassword.getExpireTime().getTime());
                    Timestamp now = new Timestamp(System.currentTimeMillis());
                    long duration = now.getTime() - sentTime.getTime();
                    long expireTime = 5 * 60 * 1000;
                    if (duration > expireTime) {
                        request.setAttribute("errorOTP", "Mã xác thực đã hết thời gian hiệu lực");
                        request.getRequestDispatcher("enterOTP.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("newPassword.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorOTP", "Mã xác thực không đúng");
                    request.getRequestDispatcher("enterOTP.jsp").forward(request, response);
                }
            }

        }
    }
}
