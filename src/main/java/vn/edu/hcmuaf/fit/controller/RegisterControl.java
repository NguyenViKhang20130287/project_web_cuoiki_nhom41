package vn.edu.hcmuaf.fit.controller;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.RegisterDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.UserSignUp;
import vn.edu.hcmuaf.fit.service.AccountService;
import vn.edu.hcmuaf.fit.service.MailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.*;

@WebServlet(name = "RegisterControl", value = "/RegisterControl")
public class RegisterControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        AccountService accountService = AccountService.getInstance();
        String uname = request.getParameter("uname");
        String email = request.getParameter("email_register");
        String pass = request.getParameter("pass_register");
        MailService ms = new MailService();
        String code = ms.getRandom();
        List<String> errors = new ArrayList<String>();
        if (uname.equals("") || email.equals("") || pass.equals("")) {
            errors.add("Vui lòng điền đầy đủ thông tin");
        }
        Account acc = new RegisterDAO().checkAccountUnameAndEmail(uname, email);
        if (acc == null) {
            if (accountService.validateUsername(uname) && accountService.validatePassword(pass) && accountService.validateEmail(email)) {
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                Date expireTime = new Date(timestamp.getTime());
                UserSignUp userSignUp = new UserSignUp(uname, email, accountService.hashPassword(pass), code, expireTime);
                boolean test = ms.sendEmail(userSignUp);
                if (test) {
                    HttpSession session = request.getSession();
                    session.setAttribute("authcode", userSignUp);
                    response.sendRedirect("verifyRegister.jsp");
                } else {
                    System.out.println("Gửi không thành công");
                }
            } else {
                if (uname.equals("")) {
                    errors.add("Vui lòng nhập tên đăng nhập");
                } else if (uname.length() < 8 || uname.length() > 30) {
                    errors.add("Xin lỗi tên đăng nhập phải nằm trong khoảng độ dài ký tự giữa 8 và 30");
                } else if (!accountService.validateUsername(uname)) {
                    errors.add("Tên đăng nhập không hợp lệ");
                }
                if (pass.equals("")) {
                    errors.add("Hãy nhập password");
                } else if (pass.length() < 8 || pass.length() > 16) {
                    errors.add("Sử dụng 8 - 16 ký tự cho mật khẩu của bạn");
                } else if (!accountService.validatePassword(pass)) {
                    errors.add("Password không hợp lệ");
                }

                if (email.equals("")) {
                    errors.add("Hãy nhập email");
                } else if (!accountService.validateEmail(email)) {
                    errors.add("Email không hợp lệ");
                }
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đăng kí không thành công');");
                out.println("alert('" + Arrays.deepToString(errors.toArray()) + "');");
                out.println("location='LoginControl';");
                out.println("</script>");
            }

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Tên đăng nhập hoặc email đã tồn tại!');");
            out.println("location='LoginControl';");
            out.println("</script>");
        }


    }

}
