package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.EditProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditProductAdminControl", value = "/admin/doc/EditProductAdminControl")
public class EditProductAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            int id = Integer.parseInt(request.getParameter("edit_product-id"));
            String name = request.getParameter("edit_product-name");
            String nameGem = request.getParameter("edit_product-nameGem");
            String catName = request.getParameter("edit_product-cat_name");
            int quantity = Integer.parseInt(request.getParameter("edit_product-quantity"));
            String color = request.getParameter("edit_product-color");
            int price = Integer.parseInt(request.getParameter("edit_product-price"));

            new EditProductDAO().update(id, name, nameGem, catName, quantity, color, price);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cập nhật sản phẩm thành công');");
            out.println("location='ListProductAdminControl';");
            out.println("</script>");
        } catch (Exception e) {

        }

    }
}
