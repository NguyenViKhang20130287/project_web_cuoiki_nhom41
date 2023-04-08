package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.RegisterDAO;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "RegisterControl", value = "/RegisterControl")
public class RegisterControl extends HttpServlet {
    private Pattern usernamePattern = Pattern.compile("^[a-zA-Z0-9_]{8,30}$");
    private Pattern passwordPattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,16}$");
    private Pattern emailPattern = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private boolean validateUsername(String username) {
        Matcher matcher = usernamePattern.matcher(username);
        return matcher.matches();
    }

    private boolean validatePassword(String password) {
        Matcher matcher = passwordPattern.matcher(password);
        return matcher.matches();
    }

    private boolean validateEmail(String email) {
        Matcher matcher = emailPattern.matcher(email);
        return matcher.matches();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String uname = request.getParameter("uname");
        String email = request.getParameter("email_register");
        String pass = request.getParameter("pass_register");

        Account acc = new RegisterDAO().checkAccountUnameAndEmail(uname, email);
        List<String> errors = new ArrayList<String>();
        if (acc == null) {
            if (!validateUsername(uname) || !validatePassword(pass) || !validateEmail(email)) {
                if (uname.equals("")) {
                    errors.add("Hãy nhập tên đăng nhập");
                } else if (uname.length() < 8) {
                    errors.add("Xin lỗi tên đăng nhập phải nằm trong khoảng độ dài ký tự giữa 8 và 30");
                } else if (!validateUsername(uname)) {
                    errors.add("Tên đăng nhập không hợp lệ");
                }
                if (pass.equals("")) {
                    errors.add("Hãy nhập password");
                } else if (pass.length() < 8) {
                    errors.add("Sử dụng 8 ký tự trở lên cho mật khẩu của bạn");
                } else if (!validatePassword(pass)) {
                    errors.add("Password không hợp lệ");
                }

                if (email.equals("")) {
                    errors.add("Hãy nhập email");
                } else if (!validateEmail(email)) {
                    errors.add("Email không hợp lệ");
                }
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đăng kí không thành công');");
                out.println("alert('" + Arrays.deepToString(errors.toArray()) + "');");
                out.println("location='LoginControl';");
                out.println("</script>");
            } else if (validateUsername(uname) && validatePassword(pass) && validateEmail(email)) {
                new RegisterDAO().signUp(uname, email, pass);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đăng kí thành công');");
                out.println("location='LoginControl';");
                out.println("</script>");
            }

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Username hoặc email đã tồn tại !');");
            out.println("location='LoginControl';");
            out.println("</script>");
        }


    }

}
