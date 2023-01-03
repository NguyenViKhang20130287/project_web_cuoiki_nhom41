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
import java.util.List;

@WebServlet(name = "GemColorControl", value = "/gem_color")
public class GemColorControl extends HttpServlet {
    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();
    GalleryDAO galleryDAO = new GalleryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ra tất cả các danh mục cha từ cơ sở dữ liệu
        List<Category> mainCategoryList = categoryDAO.getMainCategory();
        // Lấy ra 3 sản phẩm nổi bật
        List<Product> featuredProducts = productDAO.getFeaturedProduct();
        // Danh sách màu đá quý
        List<ColorAdmin> colorList = galleryDAO.getListGemColor();

        int color_id = Integer.parseInt(request.getParameter("color_id"));
        //
        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int count = productDAO.getTotalProductByGemColor(color_id);
        int endPage = count / 12;
        if (count % 12 != 0) {
            endPage++;
        }
        List<Product> productByGemColor = productDAO.pagingProductByGemColor(color_id, index);

        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
        request.setAttribute("mainCategoryList", mainCategoryList);
        request.setAttribute("featuredList", featuredProducts);
        request.setAttribute("colorList", colorList);
        request.setAttribute("productList", productByGemColor);
        request.getRequestDispatcher("product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
