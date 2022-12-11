package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Category;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SearchControl", value = "/search")
public class SearchControl extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        // Lấy ra tất cả các sản phẩm với từ khóa đã cho
        List<Product> productListByKeyword = productDAO.searchProducts(keyword);
        // Lấy ra tất cả các danh mục cha từ cơ sở dữ liệu
        List<Category> mainCategoryList = categoryDAO.getMainCategory();
        // Lấy ra 3 sản phẩm nổi bật
        List<Product> featuredProducts = productDAO.getFeaturedProduct();

        request.setAttribute("productList", productListByKeyword);
        request.setAttribute("featuredList", featuredProducts);
        request.setAttribute("mainCategoryList", mainCategoryList);
        request.getRequestDispatcher("product.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
