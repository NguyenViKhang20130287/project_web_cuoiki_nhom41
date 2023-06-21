package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.PurchaseDAO;
import vn.edu.hcmuaf.fit.dao.orderdetailDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.entity.Product;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "CancelButtonControl", value = "/CancelButtonControl")
public class CancelButtonControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        List<Product> productList = new PurchaseDAO().getListItem(orderId);
        orderdetailDAO orderdetailDAO = new orderdetailDAO();
        LogService logService = LogService.getInstance();
        String action = request.getParameter("action");
        if(action.equals("cancel")){
            orderdetailDAO.cancel(orderId);
            logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), "Người dùng có tên đăng nhập:" + account.getUsername() + " đã hủy đơn hàng có mã: " + orderId, 0, logService.getIpClient(request), logService.getBrowserName(request)));
            for (int i = 0; i < productList.size(); i++) {
                orderdetailDAO.updateQuantityAfterCancel(productList.get(i).getId(), productList.get(i).getQuantity() + orderdetailDAO.getQuantity(productList.get(i).getId()));
            }
            PrintWriter out = response.getWriter();
            out.print("| Đã hủy");
        }else if(action.equals("confirm")){
            orderdetailDAO.confirmReceipt(orderId);
            logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), "Người dùng có tên đăng nhập:" + account.getUsername() + " đã xác nhận đơn hàng có mã: " + orderId, 0, logService.getIpClient(request), logService.getBrowserName(request)));
            PrintWriter out = response.getWriter();
            out.print("| Đã giao");
        }
    }
}
