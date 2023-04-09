package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DetailsProductAdminControl", value = "/admin/doc/DetailsProductAdminControl")
public class DetailsProductAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<ProductAdmin> listPro = new AdminDAO().getData();
            request.setAttribute("listProductEdit", listPro);

            String edit_id = request.getParameter("edit_pid");
            System.out.println(edit_id);
            request.setAttribute("edit_id", edit_id);
            request.getRequestDispatcher("form-edit-product.jsp").forward(request, response);
        } catch (Exception e) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
