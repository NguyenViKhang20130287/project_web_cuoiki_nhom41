package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "EditUserAdminControl", value = "/admin/doc/EditUserAdminControl")
public class EditUserAdminControl extends HttpServlet {
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
            int uid = Integer.parseInt(request.getParameter("uid"));
            String uname = request.getParameter("uname");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            int role = Integer.parseInt(request.getParameter("role"));

            System.out.println(role);

            new AdminDAO().editDataUser(uid, uname, fullName, email, phone, role);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Cập nhật thông tin khách hàng thành công');");
            out.println("location='UserAdminControl';");
            out.println("</script>");
        } catch (Exception e) {

        }


    }
}
