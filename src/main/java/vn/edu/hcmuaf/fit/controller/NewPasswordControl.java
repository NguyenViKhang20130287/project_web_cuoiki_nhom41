package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ForgotPasswordDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "NewPasswordControl", value = "/NewPasswordControl")
public class NewPasswordControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String newPass = request.getParameter("newPass");
        HttpSession session = request.getSession();
        int idUser = (int) session.getAttribute("idUser");
        ForgotPasswordDAO fpd = new ForgotPasswordDAO();
        PrintWriter out = response.getWriter();
        try {
                fpd.changePassword(idUser, newPass);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đổi mật khẩu thành công');");
                out.println("location='LoginControl';");
                out.println("</script>");
        } catch (Exception e) {

        }

    }
}
