package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.dao.AccountDAO;
import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.entity.User;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserAdminControl", value = "/admin/doc/UserAdminControl")
public class UserAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LogService logService = LogService.getInstance();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        String user_id = request.getParameter("user_id");
        if (user_id != null) {
            int userId = Integer.parseInt(user_id);
            new AccountDAO().unLockAccount(userId);
            logService.insertNewLog(new Log(Log.INFO, userId, this.getClass().getName(), "Đã mở khóa tài khoản mã " + userId + "", 0, logService.getIpClient(request), logService.getBrowserName(request)));
        }
        List<Account> lockedAccountList = new AccountDAO().lockedAccountList();
        request.setAttribute("lockedAccountList", lockedAccountList);
        List<User> list = new AdminDAO().getListUser();
        request.setAttribute("listUser", list);
        request.getRequestDispatcher("table-data-user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
