package vn.edu.hcmuaf.fit.controller;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.ForgotPasswordDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.ForgotPassword;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.service.AccountService;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "NewPasswordControl", value = "/NewPasswordControl")
public class NewPasswordControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            LogService logService = LogService.getInstance();
            String newPassword = request.getParameter("newPass");
            int userId = (int) session.getAttribute("userId");
            AccountService accountService = AccountService.getInstance();
            if (newPassword.equals("")) {
                request.setAttribute("oldPassMess", "Vui lòng nhập mật khẩu mới");
                request.getRequestDispatcher("newPassword.jsp").forward(request, response);
            } else {
                if (accountService.validatePassword(newPassword)) {
                    new ForgotPasswordDAO().changePassword(userId, accountService.hashPassword(newPassword));
                    logService.insertNewLog(new Log(Log.INFO, userId, this.getClass().getName(), "Đổi mật khẩu mới thành công", 0, logService.getIpClient(request), logService.getBrowserName(request)));
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Đổi mật khẩu thành công');");
                    out.println("location='LoginControl';");
                    out.println("</script>");
                } else {
                    request.setAttribute("oldPassMess", "Mật khẩu không đúng định dạng");
                    request.getRequestDispatcher("newPassword.jsp").forward(request, response);
                }
            }
        }

    }
}
