package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.GalleryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Category;
import vn.edu.hcmuaf.fit.entity.ColorAdmin;
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
        // Lấy ra 3 sản phẩm nổi bật
        List<Product> featuredProducts = productDAO.getFeaturedProduct();

        String indexPage = request.getParameter("index");
        if (indexPage == null) {
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);

        int count = productDAO.getTotalProducts();
        int endPage = count / 12;
        if (count % 12 != 0) {
            endPage++;
        }
        // Danh sách các sản phẩm trên một trang theo index của nút đã nhấn
        List<Product> productList = productDAO.pagingProduct(index);
        // Danh sách màu đá quý
        List<ColorAdmin> colorList = galleryDAO.getListGemColor();

        request.setAttribute("endP", endPage);
        request.setAttribute("tag", index);
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
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

