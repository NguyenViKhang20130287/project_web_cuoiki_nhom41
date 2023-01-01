package vn.edu.hcmuaf.fit.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "enterOTPControl", value = "/enterOTPControl")
public class enterOTPControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int valueOTP = Integer.parseInt(request.getParameter("otp"));
        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        if (valueOTP == otp) {
//            request.setAttribute("email", request.getParameter("email"));
//            request.setAttribute("status", "success");

            request.getRequestDispatcher("newPassword.jsp").forward(request, response);
        } else {
            request.setAttribute("errorOTP", "Mã xác thực nhập sai ! Vui lòng nhập lại");
            request.getRequestDispatcher("enterOTP.jsp").forward(request, response);
        }
    }
}
