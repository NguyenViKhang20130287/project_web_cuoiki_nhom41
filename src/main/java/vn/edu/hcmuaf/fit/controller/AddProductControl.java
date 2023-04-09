package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddProductControl", value = "/admin/doc/AddProductControl")
public class AddProductControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String nameProduct = request.getParameter("nameProduct");
            String nameGem = request.getParameter("nameGem");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String category = request.getParameter("category");
            String color = request.getParameter("color");
            int price = Integer.parseInt(request.getParameter("price"));
            String keyword = request.getParameter("keyword");
            String design = request.getParameter("design");
            File imgLink = new File(request.getParameter("ImageUpload"));
            String description = request.getParameter("mota");

            new AdminDAO().addProduct(id, nameProduct, nameGem,
                    quantity, category, color, price,
                    keyword, design, imgLink, description);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Thêm sản phẩm thành công');");
            out.println("location='ListProductAdminControl';");
            out.println("</script>");
        } catch (Exception e) {

        }


    }
}
