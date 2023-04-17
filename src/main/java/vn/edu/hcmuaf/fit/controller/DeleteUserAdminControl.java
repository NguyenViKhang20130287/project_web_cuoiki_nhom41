package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "DeleteUserAdminControl", value = "/admin/doc/DeleteUserAdminControl")
public class DeleteUserAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter printWriter = response.getWriter();


        String uid = request.getParameter("id");
        System.out.println(uid);

        try {
            new AdminDAO().deleteUser(Integer.parseInt(uid));

            List<User> list = new AdminDAO().getListUser();
            for (User u : list) {
                printWriter.println(
                        "<tbody>" +
                                "<tr>\n" +
                                "<td>" + u.getId() + "</td>\n" +
                                "<td>" + u.getUserName() + "</td>\n" +
                                "<td>" + u.getPassword() + "</td>\n" +
                                "<td>" + u.getFullName() + "</td>\n" +
                                "<td>" + u.getEmail() + "</td>\n" +
                                "<td>" + u.getPhone() + "</td>\n" +
                                "<td>" + u.getRoleDes() + "</td>\n" +
                                "<td class=\"table-td-center\">\n" +
                                "<button class=\"btn btn-primary btn-sm trash deleteUser\" type=\"button\"\n" +
                                "onclick=\"deleteUser(id=" + u.getId() + ")\"\n" +
                                "title=\"Xóa\">\n" +
                                "<i class=\"fas fa-trash-alt\"></i>\n" +
                                "</button>\n" +
                                "<a href=\"DataUserAdminControl?uid=<%=u.getId()%>\"\n" +
                                "class=\"btn btn-primary btn-sm edit\"\n" +
                                "title=\"Sửa\" id=\"show-emp\"><i class=\"fas fa-edit\"></i>\n" +
                                "</a>\n" +
                                "</td>\n" +
                                "</tr>\n" +
                                "</tbody>" +
                                "");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
