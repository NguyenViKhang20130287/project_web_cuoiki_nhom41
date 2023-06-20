package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Favorite;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "DeleteFavoriteControl", value = "/deletefavorites")
public class DeleteFavoriteControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        List<Favorite> listFavorites = (List<Favorite>) session.getAttribute("favorite");
        out.println("<a href=\"favorite.jsp\"><i class=\"fa-solid fa-heart\"></i>Yêu thích(" + (listFavorites != null ? listFavorites.size() : 0) + ")</a>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        new ProductDAO().deleteFavoriteProduct(product_id, account.getId());
        List<Favorite> listFavorites = (List<Favorite>) session.getAttribute("favorite");

        Favorite favoriteToRemove = null;
        for (Favorite favorite : listFavorites) {
            if (favorite.getProduct().getId() == product_id) {
                favoriteToRemove = favorite;
                break;
            }
        }
        if (favoriteToRemove != null) {
            listFavorites.remove(favoriteToRemove);
        }
        session.setAttribute("favorite", listFavorites);
        Locale locale = new Locale("vi", "VN");
        NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
        for (Favorite f : listFavorites) {
            out.println("<div class=\"col-xl-3 col-lg-3 col-md-6 col-sm-6\">\n" +
                    "                                    <div class=\"body_page-trending-product-list-card\">\n" +
                    "                                        <div class=\"card-image\">\n" +
                    "                                            <a href=\"product-detail?product_id=" + f.getProduct().getId() + "\">\n" +
                    "                                                <img src=" + f.getProduct().getThumbnail() + "\n" +
                    "                                                             alt=\"\">\n" +
                    "                                            </a>\n" +
                    "                                        </div>\n" +
                    "                                        <div class=\"card-title-price\">\n" +
                    "                                            <div onclick=\"deleteFavorites(" + f.getProduct().getId() + ")\"\n" +
                    "                                                 class=\"delete-icon-circle\">\n" +
                    "                                                <i class=\"fas fa-trash\"></i>\n" +
                    "                                            </div>\n" +
                    "                                            <p>\n" +
                    "                                                " + f.getProduct().getTitle() + "\n" +
                    "                                            </p>\n" +
                    "                                            <span>" + numberFormat.format(f.getProduct().getDiscount()) + "</span>\n" +
                    "                                            <span style=\"margin-left: 10px; color: #6c6c6c\"><strike>" + numberFormat.format(f.getProduct().getPrice()) + "</strike></span>\n" +
                    "                                        </div>\n" +
                    "                                        <div class=\"card-btn\">\n" +
                    "                                            <button><a href=\"product-detail?product_id=1\">Chi tiết</a></button>\n" +
                    "                                            <button onclick=\"addtocart(" + f.getProduct().getId() + ")\">Thêm vào\n" +
                    "                                                giỏ\n" +
                    "                                            </button>\n" +
                    "                                        </div>\n" +
                    "                                    </div>\n" +
                    "                                </div>");

        }
    }
}
