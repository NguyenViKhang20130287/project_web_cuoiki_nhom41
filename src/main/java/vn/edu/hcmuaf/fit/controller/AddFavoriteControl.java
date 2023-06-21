package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.LogDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Favorite;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.entity.Product;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddFavoriteControl", value = "/addtofavorites")
public class AddFavoriteControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
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
        LogService logService = LogService.getInstance();
        if (account != null) {
            favorite = new Favorite(product, account);
            new ProductDAO().addFavoriteProduct(favorite);
            logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), "Thêm sản phẩm mã " + product_id + " vào danh sách yêu thích", 0, logService.getIpClient(request), logService.getBrowserName(request)));
            List<Favorite> listFavorites = (List<Favorite>) session.getAttribute("favorite");

            if (listFavorites == null) {
                listFavorites = new ArrayList<>();
                session.setAttribute("favorite", listFavorites);
            }
            listFavorites.add(favorite);
            out.write("<a href=\"favorite.jsp\"><i class=\"fa-solid fa-heart\"></i>Yêu thích(" + (listFavorites != null ? listFavorites.size() : 0) + ")</a>");

        } else {
            out.write("login_required");
        }
    }
}
