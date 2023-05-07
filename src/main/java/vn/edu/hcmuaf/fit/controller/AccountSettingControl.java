package vn.edu.hcmuaf.fit.controller;

import eu.bitwalker.useragentutils.UserAgent;
import vn.edu.hcmuaf.fit.dao.AccountDAO;
import vn.edu.hcmuaf.fit.dao.LoginDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AccountSettingControl", value = "/AccountSettingControl")
public class AccountSettingControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email_update");
        String phone_number = request.getParameter("phone_number");
        HttpSession session = request.getSession();
        String username = session.getAttribute("username").toString();
        Account account = (Account) session.getAttribute("Account");
        LogService logService = LogService.getInstance();
        if (full_name.equals(account.getFullName()) && email.equals(account.getEmail()) && phone_number.equals(account.getPhone())) {
            request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
        } else if (full_name.equals("") && email.equals("") && phone_number.equals("")) {
            request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
        } else if (full_name.equals("") || email.equals("") || phone_number.equals("")) {
            request.getRequestDispatcher("accountSettings.jsp").forward(request, response);
        } else {
            new AccountDAO().updateAccount(full_name, email, phone_number, username);
            session.setAttribute("full_name", full_name);
            session.setAttribute("email_update", email);
            session.setAttribute("phone_number", phone_number);
            logService.insertNewLog(new Log(Log.INFO, account.getId(),this.getClass().getName(),"Cập nhật thông tin thành công", 0, logService.getIpClient(request), logService.getBrowserName(request)));
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cập nhật thông tin thành công');");
            out.println("location='/web_nhom41_war/accountSettings.jsp';");
            out.println("</script>");
        }

    }
}
