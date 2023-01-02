package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.dao.ProductAdminDAO;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListOrderControl", value = "/admin/doc/ListOrderControl")
public class ListOrderControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<OrderAdmin> listOrder = new OrderDAO().getListOrder();
        request.setAttribute("listOrder", listOrder);
        request.getRequestDispatcher("table-data-oder.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
