package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.AdminDAO;
import vn.edu.hcmuaf.fit.entity.Banner;
import vn.edu.hcmuaf.fit.entity.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DataBannerControl", value = "/admin/doc/DataBannerControl")
public class DataBannerControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        response.getWriter().println("ok");
        try {
            String bid = request.getParameter("bid");
            AdminDAO ad = new AdminDAO();
            Banner b = ad.getBannerByID(bid);
            request.setAttribute("banner", b);
//            System.out.println(request.getAttribute("banner"));
            request.getRequestDispatcher("form-edit-banner.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
