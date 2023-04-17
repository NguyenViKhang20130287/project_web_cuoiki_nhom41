package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.RegisterDAO;
import vn.edu.hcmuaf.fit.entity.UserSignUp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "VerifyRegister", value = "/VerifyRegister")
public class VerifyRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter();) {
            HttpSession session = request.getSession();
            UserSignUp userSignUp = (UserSignUp) session.getAttribute("authcode");
            System.out.println(userSignUp);
            String code = request.getParameter("authcode");
            if (code.equals("")) {
                request.setAttribute("errorVerify", "Vui lòng nhập mã xác thực");
                request.getRequestDispatcher("verifyRegister.jsp").forward(request, response);
            } else {
                if (code.equals(userSignUp.getCode())) {
                    new RegisterDAO().signUp(userSignUp.getUsername(), userSignUp.getEmail(), userSignUp.getPassword());
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Đăng kí tài khoản thành công');");
                    out.println("location='LoginControl';");
                    out.println("</script>");
                } else {
                    request.setAttribute("error", "Mã xác thực không đúng");
                    request.getRequestDispatcher("verifyRegister.jsp").forward(request, response);
                }
            }
        }
    }
}