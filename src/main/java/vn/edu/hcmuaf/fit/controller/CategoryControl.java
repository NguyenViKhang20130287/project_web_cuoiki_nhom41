package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.GalleryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Category;
import vn.edu.hcmuaf.fit.entity.ColorAdmin;
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
    GalleryDAO galleryDAO = new GalleryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ra tất cả các danh mục cha từ cơ sở dữ liệu
        List<Category> mainCategoryList = categoryDAO.getMainCategory();
        // Lấy id của danh mục đã được chọn
        int category_id = Integer.parseInt(request.getParameter("category_id"));
        // Lấy ra 3 sản phẩm nổi bật
        List<Product> featuredProducts = productDAO.getFeaturedProduct();
        // Lấy index của button trang
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int count = productDAO.getTotalProductOfACategory(category_id);
        int endPage = count / 12;
        if (count % 12 != 0) {
            endPage++;
        }
        // Lấy ra tất cả các sản phẩm theo category_id của danh mục đã cho và phân trang
        List<Product> productListByCategory = productDAO.pagingProductOfCategory(category_id, index);
        // Danh sách màu đá quý
        List<ColorAdmin> colorList = galleryDAO.getListGemColor();

        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("active", category_id);
        request.setAttribute("productList", productListByCategory);
        request.setAttribute("featuredList", featuredProducts);
        request.setAttribute("mainCategoryList", mainCategoryList);
        request.setAttribute("colorList", colorList);
        request.getRequestDispatcher("product.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

