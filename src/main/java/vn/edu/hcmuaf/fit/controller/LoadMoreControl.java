package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "LoadMoreControl", value = "/load")
public class LoadMoreControl extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int amount = Integer.parseInt(request.getParameter("exist"));
        // Lấy ra danh sách sản phẩm mới nhất
        List<Product> productList = productDAO.getNextTop5Product(amount);
        request.setAttribute("amount", amount);
        PrintWriter out = response.getWriter();
        Locale locale = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        for (Product p : productList) {
            out.println("<div class=\"product body_page-trending-product-list-card\">\n" +
                    "                        <div class=\"card-image\">\n" +
                    "                            <a href=\"product-detail?product_id=" + p.getId() + "\"><img src=\"" + p.getThumbnail() + "\"\n" +
                    "                                                                                    alt=\"\"></a>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"card-title-price\">\n" +
                    "                            <p style=\"font-size: 14px; margin-bottom: 5px;\">" + p.getTitle() + "\n" +
                    "                            </p>\n" +
                    "                            <span style=\"font-size: 15px\">"+numberFormat.format(p.getDiscount())+"</span>\n" +
                    "                            <span style=\"margin-left: 10px; color: #6c6c6c; font-size: 15px\"><strike>"+numberFormat.format(p.getPrice())+"</strike></span>\n" +
                    "                        </div>\n" +
                    "                        <div class=\"card-btn\">\n" +
                    "                            <button><a href=\"product-detail?product_id=" + p.getId() + "\">Chi tiết</a></button>\n" +
                    "                            <button onclick=\"addtocart(" + p.getId() + ")\">Thêm vào giỏ</button>\n" +
                    "                        </div>\n" +
                    "                    </div>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
