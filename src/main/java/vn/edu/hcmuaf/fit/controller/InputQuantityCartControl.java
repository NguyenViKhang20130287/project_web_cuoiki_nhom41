package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.entity.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

@WebServlet(name = "InputQuantityCartControl", value = "/InputQuantityCartControl")
public class InputQuantityCartControl extends HttpServlet {
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        int num = 0;
        String totalString = "";

        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
        for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
            String total = "";
            if (entry.getValue().getProduct().getDiscount() != 0) {
                total = String.valueOf(entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity());

            } else {
                total = String.valueOf(entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity());

            }
            num += Integer.parseInt(total);

        }
        totalString = numberFormat.format(num);
        out.println("  <h2>Tổng tiền</h2>\n" +
                "                <ul id=\"totalOrder\"><li>\n" +
                "                        <span class=\"title\">Tạm tính</span>\n" +
                "                        <span class=\"price\">" + totalString + " </span>\n" +
                "                    </li>\n" +
                "                    <li>\n" +
                "                        <span class=\"title\">Giảm giá</span>\n" +
                "                        <span class=\"price\">0 đ</span>\n" +
                "                    </li>\n" +
                "                    <li>\n" +
                "                        <span class=\"title\">Tổng</span>\n" +
                "                        <span class=\"price\">" + totalString + " </span>\n" +
                "                    </li><button class=\"totals_btns\"><a href=\"checkout.jsp\">Thanh toán</a></button>"
        );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String quantity = request.getParameter("quantity");
        int browserWidth = Integer.parseInt(request.getParameter("browserWidth"));
        String pid = request.getParameter("pid");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
        if (pid == null) {
            pid = "0";
        }
        for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
            if (entry.getKey() == Integer.parseInt(pid)) {
//                int quantity = entry.getValue().getQuantity();
                entry.getValue().setQuantity(Integer.parseInt(quantity));
            }
            String price = "";
            String total = "";
            if (entry.getValue().getProduct().getDiscount() != 0) {
                price = numberFormat.format(entry.getValue().getProduct().getDiscount());
                total = numberFormat.format(entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity());
            } else {
                price = numberFormat.format(entry.getValue().getProduct().getPrice());
                total = numberFormat.format(entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity());
            }

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
                        "                        <span> " + price + "</span>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-quantity\">\n" +
                        "                        <div class=\"cart-plus-minus\">\n" +
                        "                            <button class=\"dec qtybutton\" id=\"dec\" onclick=\"quantity(this.id," + entry.getKey() + ")\">-\n" +
                        "                            </button>\n" +
                        "                            <input id=\"quantity quantity" + entry.getKey() + "\" onblur=\"inputQuantity(this.id," + entry.getKey() + ")\" type=\"text\" value=\"" + entry.getValue().getQuantity() + "\">\n" +
                        "                            <button class=\"inc qtybutton\" id=\"inc\" onclick=\"quantity(this.id," + entry.getKey() + ")\">+\n" +
                        "                            </button>\n" +
                        "                        </div>\n" +
                        "                        <div id=\"max" + entry.getKey() + "\" style=\"display: none\">" + entry.getValue().getProduct().getQuantity() + "</div>\n" +
                        "                        <div id=\"current" + entry.getKey() + "\" style=\"display: none\">" + entry.getValue().getQuantity() + "</div>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-total\" id=\"product-total\">\n" +
                        "                        <span> " + total + "</span>\n" +
                        "                    </th>\n" +
                        "                    <th class=\"product-remove\">\n" +
                        "                         <button onclick=\"DeleteItem(" + entry.getKey() + ")\"><i class=\"fa-solid fa-trash\"></i>\n" +
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
                        "                            <span class=\"price\">" + total + "</span>\n" +
                        "                            <div class=\"product-quantity\">\n" +
                        "                                <button id=\"dec1\" onclick=\"quantity(this.id," + entry.getKey() + ")\">-\n" +
                        "                                </button>\n" +
                        "                                <input type=\"text\" id=\"quantityResponsive quantity" + entry.getKey() + "\" onblur=\"inputQuantity(this.id," + entry.getKey() + ")\" value=\"" + entry.getValue().getQuantity() + "\">\n" +
                        "                                <button id=\"inc1\" onclick=\"quantity(this.id," + entry.getKey() + ")\">+\n" +
                        "                                </button>\n" +
                        "                            </div>\n" +
                        "                        <div id=\"max" + entry.getKey() + "\" style=\"display: none\">" + entry.getValue().getProduct().getQuantity() + "</div>\n" +
                        "                        <div id=\"current" + entry.getKey() + "\" style=\"display: none\">" + entry.getValue().getQuantity() + "</div>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"deleteProduct\">\n" +
                        "                            <button onclick=\"DeleteItem(" + entry.getKey() + ")\"><i class=\"fa-solid fa-trash\"></i>\n" +
                        "                        </button>\n" +
                        "                        </div>\n" +
                        "                    </li>");
            }

        }
    }

    public static boolean isNumeric(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
