package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.DeleteProductAdminDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "DeleteProductAdminControl", value = "/admin/doc/DeleteProductAdminControl")
public class DeleteProductAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();


        try {
            new DeleteProductAdminDAO().Delete(pid);

//            response.sendRedirect("ListProductAdminControl");

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Xóa sản phẩm thành công');");
            out.println("location='ListProductAdminControl';");
            out.println("</script>");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
