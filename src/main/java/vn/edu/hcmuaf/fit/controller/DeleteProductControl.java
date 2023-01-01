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

@WebServlet(name = "DeleteProductControl", value = "/DeleteProductControl")
public class DeleteProductControl extends HttpServlet {
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
        PrintWriter out = response.getWriter();
        out.println("<a href=\"cart.jsp\"><i class=\"fa-solid fa-bag-shopping\"></i>Giỏ hàng("+(cart != null ? cart.size() : 0 )+")</a>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String productID = request.getParameter("productId");
        int browserWidth = Integer.parseInt(request.getParameter("browserWidth"));
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
        cart.remove(Integer.parseInt(productID));
        session.setAttribute("cart", cart);
        for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
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
                        "                            <input id=\"quantity\" type=\"text\" value=\"" + entry.getValue().getQuantity() + "\">\n" +
                        "                            <button class=\"inc qtybutton\" id=\"inc\" onclick=\"quantity(this.id," + entry.getKey() + ")\">+\n" +
                        "                            </button>\n" +
                        "                        </div>\n" +
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
                        "                                <input type=\"text\" value=\"" + entry.getValue().getQuantity() + "\">\n" +
                        "                                <button id=\"inc1\" onclick=\"quantity(this.id," + entry.getKey() + ")\">+\n" +
                        "                                </button>\n" +
                        "                            </div>\n" +
                        "                        </div>\n" +
                        "                        <div class=\"deleteProduct\">\n" +
                        "                            <button onclick=\"DeleteItem(" + entry.getKey() + ")\"><i class=\"fa-solid fa-trash\"></i>\n" +
                        "                        </button>\n" +
                        "                        </div>\n" +
                        "                    </li>");
            }

        }
    }
}
