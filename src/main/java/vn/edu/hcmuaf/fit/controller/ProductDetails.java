package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.GalleryDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Gallery;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetails", value = "/product-detail")
public class ProductDetails extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    GalleryDAO galleryDAO = new GalleryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productDAO.getProduct(id);
        // Lấy ra tất cả các sản phẩm từ cơ sở dữ liệu
        List<Product> productList = productDAO.getAllProducts();
        //
        List<Gallery> galleryList = galleryDAO.getGallery(id);

        request.setAttribute("product", product);
        request.setAttribute("productList", productList);
        request.setAttribute("galleryList", galleryList);
        request.getRequestDispatcher("productdetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
