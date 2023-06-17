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
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FavoriteItemsControl", value = "/addtofavorites")
public class FavoriteItemsControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        if (account != null) {
            List<Favorite> favorites = new ProductDAO().getListFavoriteItem(account.getId());
            request.setAttribute("favoriteList", favorites);
        }
        request.getRequestDispatcher("favorite.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        ProductDAO productDAO = new ProductDAO();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        int product_id = Integer.parseInt(request.getParameter("product_id"));
        Product product = productDAO.getProduct(product_id);
        Favorite favorite;
        if (account != null) {
            favorite = new Favorite(product, account);
            new ProductDAO().addFavoriteProduct(favorite);
            out.write("success");
        } else {
            out.write("Đăng nhập trước rồi thêm nha");
        }
    }
}
