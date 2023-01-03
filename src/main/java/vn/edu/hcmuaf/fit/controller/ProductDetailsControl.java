package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.dao.GalleryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.dao.ReviewDAO;
import vn.edu.hcmuaf.fit.entity.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ProductDetails", value = "/product-detail")
public class ProductDetailsControl extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    GalleryDAO galleryDAO = new GalleryDAO();

    ReviewDAO reviewDAO = new ReviewDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("product_id"));
        Product product = productDAO.getProduct(id);
        // Lấy ra tất cả các sản phẩm từ cơ sở dữ liệu
        List<Product> productList = productDAO.getAllProducts();
        // Lấy ra ảnh chi tiết của từng sản phẩm theo product_id
        List<Gallery> galleryList = galleryDAO.getGallery(id);
        // Lấy ra danh mục theo id của danh mục con
        Category category = categoryDAO.getCategoryBySubId(product.getCategory().getId());
        // Lấy ra danh sách các biến thể theo id của danh mục
        List<Variation> variationList = galleryDAO.getVariationList(category.getId());
        // Lấy ra biến thể theo id của danh mục
        Variation variation = galleryDAO.getVariation(category.getId());
        // Lấy ra danh sách các tùy chọn của biến thể theo id của biến thể
        List<VariationOption> variationOptionList = galleryDAO.getVariationOptionList(variation.getId());
        // Lấy ra danh sách các sản phẩm liên quan
        List<Product> relatedList = productDAO.getRelatedProduct(product.getCategory().getName(), product.getId());
        // Lấy ra danh sách các review theo id của sản phẩm
        List<Review> reviewList = reviewDAO.getReviewById(id);
        // Lấy ra trung bình sao của sản phẩm
        double avgStar = reviewDAO.getAverage(id);

        request.setAttribute("avgStar", avgStar);
        request.setAttribute("reviewList", reviewList);
        request.setAttribute("product", product);
        request.setAttribute("productList", productList);
        request.setAttribute("galleryList", galleryList);
        request.setAttribute("variationList", variationList);
        request.setAttribute("variationOptionList", variationOptionList);
        request.setAttribute("categoryByProductId", category);
        request.setAttribute("relatedList", relatedList);
        request.getRequestDispatcher("productdetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

