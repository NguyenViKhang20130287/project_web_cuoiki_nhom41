package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.entity.Category;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CategoryControl", value = "/CategoryControl")
public class CategoryControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO categoryDAO = new CategoryDAO();
        List<Category> mainCategoryList = categoryDAO.getMainCategory();
        request.setAttribute("mainCategoryList", mainCategoryList);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
