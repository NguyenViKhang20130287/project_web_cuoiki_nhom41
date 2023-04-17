package vn.edu.hcmuaf.fit.controller;

import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.dao.AccountDAO;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "UpdatePasswordControl", value = "/UpdatePasswordControl")
public class UpdatePasswordControl extends HttpServlet {
    private Pattern passwordPattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,16}$");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String username = session.getAttribute("username").toString();
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        if (old_password == null || new_password == null || old_password.isEmpty() || new_password.isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ mật khẩu cũ và mật khẩu mới");
            request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
            return;
        }
        if (!validatePassword(old_password) || !validatePassword(new_password)) {
            request.setAttribute("error", "Mật khẩu không đúng với định dạng yêu cầu");
            request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
            return;
        }
        try{
            LoginDAO loginDAO = new LoginDAO();
            Account account = loginDAO.getAccount(username);
            if(account==null){
                request.setAttribute("error", "Không tìm thấy người dùng");
                request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
                return;
            }
            if(!BCrypt.checkpw(old_password, account.getPassword())){
                request.setAttribute("error", "Mật khẩu cũ không đúng");
                request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
                return;
            }
            String hashedPassword = BCrypt.hashpw(new_password, BCrypt.gensalt());
            AccountDAO accountDAO = new AccountDAO();
            accountDAO.updatePassword(hashedPassword, username);
            request.setAttribute("success", "Đổi mật khẩu thành công");
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Đổi mật khẩu thành công');");
            out.println("location='LogoutControl';");
            out.println("</script>");

        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi trong quá trình đổi mật khẩu");
            request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
        }
    }

    private boolean validatePassword(String password) {
        Matcher matcher = passwordPattern.matcher(password);
        return matcher.matches();
    }
}