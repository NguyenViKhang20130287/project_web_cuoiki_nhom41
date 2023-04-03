package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;
import vn.edu.hcmuaf.fit.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DataUserAdminControl", value = "/admin/doc/DataUserAdminControl")
public class DataUserAdminControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try{
            List<User> list = new AdminDAO().getListUser();
            request.setAttribute("listUser", list);

            String uid = request.getParameter("uid");
            request.setAttribute("uid", uid);
            request.getRequestDispatcher("form-edit-user.jsp").forward(request, response);
        }catch (Exception e){

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
