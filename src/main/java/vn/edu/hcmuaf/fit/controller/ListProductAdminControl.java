package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ProductAdminDAO;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListProductAdminControl", value = "/admin/doc/ListProductAdminControl")
public class ListProductAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ProductAdmin> listPro = new ProductAdminDAO().getData();
        request.setAttribute("listProduct", listPro);
        request.getRequestDispatcher("table-data-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
    }
}
