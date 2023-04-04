package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteUserAdminControl", value = "/admin/doc/DeleteUserAdminControl")
public class DeleteUserAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int uid = Integer.parseInt(request.getParameter("uid"));
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        try {
            new AdminDAO().deleteUser(uid);

//            response.sendRedirect("ListProductAdminControl");

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Xóa tài khoản người dùng thành công');");
            out.println("location='UserAdminControl';");
            out.println("</script>");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
