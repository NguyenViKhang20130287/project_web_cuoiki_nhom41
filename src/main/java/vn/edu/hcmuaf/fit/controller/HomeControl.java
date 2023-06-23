package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.dao.ProductDAO;
import vn.edu.hcmuaf.fit.entity.Banner;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeControl", value = "/home")
public class HomeControl extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ra danh sách các sản phẩm mới nhất
        List<Product> latestProduct = productDAO.getTop5Product();

        request.setAttribute("productList", latestProduct);

        List<Banner> listBanner = new AdminDAO().getListBanner();
        request.setAttribute("listBanner", listBanner);
        request.getRequestDispatcher("index.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static void main(String[] args) {
        ProductDAO productDAO1 = new ProductDAO();
        List<Product> latestProduct = productDAO1.getLatestProduct();
        for (Product p: latestProduct){
            System.out.println(p);
        }
    }
}

