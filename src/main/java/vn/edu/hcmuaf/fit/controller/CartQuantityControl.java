package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.entity.ProductInCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CartQuantityControl", value = "/CartQuantityControl")
public class CartQuantityControl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int num = 0;
        String totalString = "";

        HashMap<Integer, ProductInCart> cart = (HashMap<Integer, ProductInCart>) session.getAttribute("cart");
        for (Map.Entry<Integer, ProductInCart> entry : cart.entrySet()) {
            String total = String.valueOf(entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity());
            num += Integer.parseInt(total);
        }
        totalString = String.valueOf(num);
        out.println("  <h2>Tổng tiền</h2>\n" +
                "                <ul id=\"totalOrder\"><li>\n" +
                "                        <span class=\"title\">Tạm tính</span>\n" +
                "                        <span class=\"price\">" + totalString.substring(0, totalString.length() - 6) + "." + totalString.substring(totalString.length() - 6, totalString.length() - 3) + "." + totalString.substring(totalString.length() - 3) + " đ</span>\n" +
                "                    </li>\n" +
                "                    <li>\n" +
                "                        <span class=\"title\">Giảm giá</span>\n" +
                "                        <span class=\"price\">0 đ</span>\n" +
                "                    </li>\n" +
                "                    <li>\n" +
                "                        <span class=\"title\">Tổng</span>\n" +
                "                        <span class=\"price\">" + totalString.substring(0, totalString.length() - 6) + "." + totalString.substring(totalString.length() - 6, totalString.length() - 3) + "." + totalString.substring(totalString.length() - 3) + " đ</span>\n" +
                "                    </li><button class=\"totals_btns\"><a href=\"checkout.html\">Thanh toán</a></button>"
        );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String operator = (String) request.getParameter("operator");
        int browserWidth = Integer.parseInt(request.getParameter("browserWidth"));
        System.out.println(browserWidth);
        int num = 0;
        String pid = request.getParameter("pid");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        HashMap<Integer, ProductInCart> cart = (HashMap<Integer, ProductInCart>) session.getAttribute("cart");
        if (pid == null) {
            pid = "0";
        }
        for (Map.Entry<Integer, ProductInCart> entry : cart.entrySet()) {
            if (entry.getKey() == Integer.parseInt(pid)) {
                int quantity = entry.getValue().getQuantity();
                if (operator.contains("+")) {
                    quantity++;
                } else {
                    if (operator.contains("-")) {
                        if (quantity > 1) {
                            quantity--;
                        }
                    }
                }
                entry.getValue().setQuantity(quantity);
            }
            String price = String.valueOf(entry.getValue().getProduct().getDiscount());
            String total = String.valueOf(entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity());
            num += Integer.parseInt(total);
            if (browserWidth > 428) {
                out.println("<tr>\n" +
                        "                    <th class=\"product-thumbnail\">\n" +
                        "                        <a href=\"product-detail?product_id=" + entry.getValue().getProduct().getId() + "\">\n" +
                        "                            <img src=\"" + entry.getValue().getProduct().getThumbnail() + "\" alt=\"\">\n" +
                        "                        </a>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-name\">\n" +
                        "                        <a href=\"product-detail?product_id=" + entry.getValue().getProduct().getId() + "\">" + entry.getValue().getProduct().getTitle() + "\n" +
                        "                        </a>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-price\">\n" +
                        "                        <span> " + price.substring(0, price.length() - 6) + "." + price.substring(price.length() - 6, price.length() - 3) + "." + price.substring(price.length() - 3) + "đ</span>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-quantity\">\n" +
                        "                        <div class=\"cart-plus-minus\">\n" +
                        "                            <button class=\"dec qtybutton\" id=\"dec\" onclick=\"quantity(this.id," + entry.getKey() + ")\">-\n" +
                        "                            </button>\n" +
                        "                            <input id=\"quantity\" type=\"text\" value=\"" + entry.getValue().getQuantity() + "\">\n" +
                        "                            <button class=\"inc qtybutton\" id=\"inc\" onclick=\"quantity(this.id," + entry.getKey() + ")\">+\n" +
                        "                            </button>\n" +
                        "                        </div>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-total\" id=\"product-total\">\n" +
                        "                        <span> " + total.substring(0, total.length() - 6) + "." + total.substring(total.length() - 6, total.length() - 3) + "." + total.substring(total.length() - 3) + "đ</span>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-remove\">\n" +
                        "                        <button><i class=\"fa-solid fa-xmark\"></i>\n" +
                        "                        </button>\n" +
                        "                    </th>\n" +
                        "                </tr>");

            } else {
                out.println("<li class=\"list_card\">\n" +
                        "                        <div class=\"card_img\">\n" +
                        "                            <img src=\"" + entry.getValue().getProduct().getThumbnail() + "\" alt=\"\">\n" +
                        "                        </div>\n" +
                        "                        <div class=\"card_infor\">\n" +
                        "                            <a href=\"product-detail?product_id=" + entry.getValue().getProduct().getId() + "\"\n" +
                        "                               class=\"title\">" + entry.getValue().getProduct().getTitle() + "\n" +
                        "                            </a><br>\n" +
                        "                            <span class=\"price\">" + total.substring(0, total.length() - 6) + "." + total.substring(total.length() - 6, total.length() - 3) + "." + total.substring(total.length() - 3) + "đ</span>\n" +
                        "                            <div class=\"product-quantity\">\n" +
                        "                                <button id=\"dec1\" onclick=\"quantity(this.id," + entry.getKey() + ")\">-\n" +
                        "                                </button>\n" +
                        "                                <input type=\"text\" value=\"" + entry.getValue().getQuantity() + "\">\n" +
                        "                                <button id=\"inc1\" onclick=\"quantity(this.id," + entry.getKey() + ")\">+\n" +
                        "                                </button>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"deleteProduct\">\n" +
                        "                            <button class=\"deleteProductBtn\"><i class=\"fa-solid fa-xmark\"></i></button>\n" +
                        "                        </div>\n" +
                        "                    </li>");
            }

        }
    }
}
