package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.entity.User;
import vn.edu.hcmuaf.fit.service.LogService;

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
        int uid = Integer.parseInt(request.getParameter("id"));
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        String roleName = account.getRole() == 0 ? "Quản trị viên" : "";
        LogService logService = LogService.getInstance();
        try {
            new AdminDAO().deleteUser(uid);
            logService.insertNewLog(new Log(Log.DANGER, account.getId(), this.getClass().getName(), roleName + " mã: " + account.getId() + " đã người dùng có mã: " + uid, 0, logService.getIpClient(request), logService.getBrowserName(request)));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        List<User> list = new AdminDAO().getListUser();
        for (User u : list) {
            out.println("<tbody>\n" +
                    "                            <tr>\n" +
                    "                                <td>" + u.getId() + "</td>\n" +
                    "                                <td>" + u.getUserName() + "</td>\n" +
                    "                                <td>" + u.getFullName() + "</td>\n" +
                    "                                <td>" + u.getEmail() + "</td>\n" +
                    "                                <td>" + u.getPhone() + "</td>\n" +
                    "                                <td>" + u.getRoleDes() + " </td>\n" +
                    "                                <td class=\"table-td-center\">\n" +
                    "                                    <button class=\"btn btn-primary btn-sm trash deleteUser\" type=\"button\"\n" +
                    "                                            onclick=\"deleteUser(" + u.getId() + ")\"\n" +
                    "                                            title=\"Xóa\">\n" +
                    "                                        <i class=\"fas fa-trash-alt\"></i>\n" +
                    "                                    </button>\n" +
                    "                                    <a href=\"DataUserAdminControl?uid=<%=u.getId()%>\"\n" +
                    "                                       class=\"btn btn-primary btn-sm edit\"\n" +
                    "                                       title=\"Sửa\" id=\"show-emp\"><i class=\"fas fa-edit\"></i>\n" +
                    "                                    </a>\n" +
                    "                                </td>\n" +
                    "                            </tr>\n" +
                    "                            </tbody>");
        }
    }
}
