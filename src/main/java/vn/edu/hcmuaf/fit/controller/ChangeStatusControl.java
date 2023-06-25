package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ChangeStatusDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ChangeStatusControl", value = "/admin/doc/ChangeStatusControl")
public class ChangeStatusControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String productId = request.getParameter("productId");
        String status = request.getParameter("status");
        int statusInt = Integer.parseInt(status);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        LogService logService = LogService.getInstance();
        ChangeStatusDAO changeStatusDAO = new ChangeStatusDAO();
        changeStatusDAO.updateStatus(Integer.parseInt(productId), statusInt);
        String roleName = account.getRole() == 0 ? "Quản trị viên" : "Nhân viên kế toán";
        if (statusInt != 4) {
            logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), roleName + " mã: " + account.getId() + " đã cập nhật trạng thái cho đơn hàng có mã: " + productId, 0, logService.getIpClient(request), logService.getBrowserName(request)));
        }
        response.sendRedirect("ListOrderControl");
    }
}
