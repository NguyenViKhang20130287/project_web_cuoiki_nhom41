package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Category;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryControl", value = "/category")
public class CategoryControl extends HttpServlet {
    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ra tất cả các danh mục cha từ cơ sở dữ liệu
        List<Category> mainCategoryList = categoryDAO.getMainCategory();
        // Lấy id của danh mục đã được chọn
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        List<Product> productListByCategory = null;
        if(category_id == 1) {
            productListByCategory = productDAO.getAllProducts();
        }else{
            // Lấy ra tất cả các sản phẩm theo category_id của danh mục đã cho
            productListByCategory = productDAO.getAllProductsFromACategory(category_id);
        }
        // Lấy ra 3 sản phẩm nổi bật
        List<Product> featuredProducts = productDAO.getFeaturedProduct();

        request.setAttribute("productList", productListByCategory);
        request.setAttribute("featuredList", featuredProducts);
        request.setAttribute("mainCategoryList", mainCategoryList);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
