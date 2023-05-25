package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.GalleryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Category;
import vn.edu.hcmuaf.fit.entity.Color;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductControl", value = "/product")
public class ProductControl extends HttpServlet {
    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();
    GalleryDAO galleryDAO = new GalleryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param = request.getParameter("action");
        if (param != null) {
            getListProduct(request, response);
            return;
        }
        // Lấy ra tất cả các danh mục cha từ cơ sở dữ liệu
        List<Category> mainCategoryList = categoryDAO.getMainCategory();
        mainCategoryList.add(0, new Category(0, -1, "Tất cả"));

        int category_id = request.getParameter("category_id") == null ? 0 : Integer.parseInt(request.getParameter("category_id"));
        int color_id = request.getParameter("color_id") == null ? 0 : Integer.parseInt(request.getParameter("color_id"));

        // Lấy ra 3 sản phẩm nổi bật
        List<Product> featuredProducts = productDAO.getFeaturedProduct();

        // Danh sách các sản phẩm trên một trang theo index của nút đã nhấn
        List<Product> productList = productDAO.getAllProducts();
        // Danh sách màu đá quý
        List<Color> colorList = galleryDAO.getListGemColor();


//        request.setAttribute("endP", endPage);
//        request.setAttribute("tag", index);
        request.setAttribute("activeCate", category_id);
        request.setAttribute("mainCategoryList", mainCategoryList);
        request.setAttribute("productList", productList);
        request.setAttribute("featuredList", featuredProducts);
        request.setAttribute("colorList", colorList);
        request.getRequestDispatcher("product.jsp").forward(request, response);

    }

    private void getListProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Gson gson = new Gson();
        response.setContentType("text/html; charset=UTF-8");
        List<Product> products = new ProductDAO().getAllProducts();
        String json = gson.toJson(products);
        request.setAttribute("json", json);
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
