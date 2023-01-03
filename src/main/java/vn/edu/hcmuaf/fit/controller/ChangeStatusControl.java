package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ChangeStatusDAO;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ChangeStatusControl", value = "/admin/doc/ChangeStatusControl")
public class ChangeStatusControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String productId = request.getParameter("productId");
        String status = request.getParameter("status");
        int statusInt = Integer.parseInt(status);
        ChangeStatusDAO changeStatusDAO = new ChangeStatusDAO();
        changeStatusDAO.updateStatus(Integer.parseInt(productId), statusInt);
        response.sendRedirect("ListOrderControl");
    }
}
