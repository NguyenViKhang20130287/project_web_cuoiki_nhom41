package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CartDao;
import vn.edu.hcmuaf.fit.entity.Account;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteAllItemCartControl", value = "/DeleteAllItemCartControl")
public class DeleteAllItemCartControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("  <h2>Tổng tiền</h2>\n" +
                "                <ul id=\"totalOrder\"><li>\n" +
                "                        <span class=\"title\">Tạm tính</span>\n" +
                "                        <span class=\"price\">0 ₫ </span>\n" +
                "                    </li>\n" +
                "                    <li>\n" +
                "                        <span class=\"title\">Giảm giá</span>\n" +
                "                        <span class=\"price\">0 ₫</span>\n" +
                "                    </li>\n" +
                "                    <li>\n" +
                "                        <span class=\"title\">Tổng</span>\n" +
                "                        <span class=\"price\">0 ₫</span>\n" +
                "                    </li><button class=\"totals_btns\"><a href=\"checkout.jsp\">Thanh toán</a></button>"
        );
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        Account account = (Account) session.getAttribute("Account");

        if (account == null) {
            session.setAttribute("cart", null);
        } else {
            session.setAttribute("cart", null);
            new CartDao().deleteAllCartItem(account.getId());
        }
        out.println("");
    }
}
