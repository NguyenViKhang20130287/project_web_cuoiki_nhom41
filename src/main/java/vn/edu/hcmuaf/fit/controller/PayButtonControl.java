package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.PurchaseDAO;
import vn.edu.hcmuaf.fit.dao.orderdetailDAO;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "PayButtonControl", value = "/PayButtonControl")
public class PayButtonControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String orderId = request.getParameter("orderId");
        out.println("<button id=\"cancelButton\" onclick=\"showConfirm()\">Hủy đơn hàng</button>\n" +
                "                    <div class=\"confirmCancel\">\n" +
                "                        Xác nhận hủy?\n" +
                "                        <button class=\"confirmButton\" onclick=\"cancelButton("+orderId+")\">Hủy</button>\n" +
                "                    </div>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        orderdetailDAO orderdetailDAO = new orderdetailDAO();
        orderdetailDAO.paid(orderId);
        PrintWriter out = response.getWriter();
        out.print("| Đang giao hàng");
    }
}
