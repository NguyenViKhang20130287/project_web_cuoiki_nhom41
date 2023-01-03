package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.ChangeStatusDAO;
import vn.edu.hcmuaf.fit.dao.OrderDAO;
import vn.edu.hcmuaf.fit.entity.OrderAdmin;
import vn.edu.hcmuaf.fit.entity.ProductAdmin;

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
        List<OrderAdmin> listOrder = new OrderDAO().getListOrder();
        for (OrderAdmin o : listOrder) {
            String s = "";
            for (ProductAdmin p : o.getProducts()) {
                s += p.getName() + "<b> x " + p.getQuantity() + "</b>, ";
            }
            String statusSpan = "";
            if (o.getId_status() == 1) {
                statusSpan = "<span class=\"badge bg-warning\">Đang giao hàng</span>";
            }
            if (o.getId_status() == 2) {
                statusSpan = "<span class=\"badge bg-info\">Chờ thanh toán</span>";
            }
            if (o.getId_status() == 3) {
                statusSpan = "<span class=\"badge bg-success\">Hoàn thành</span>";
            }
            if (o.getId_status() == 4) {
                statusSpan = "<span class=\"badge bg-danger\">Đã hủy</span>";
            }
            out.println(" <tr>\n" +
                    "                            <td width=\"10\"><input type=\"checkbox\" name=\"check1\" value=\"1\"></td>\n" +
                    "                            <td>" + o.getId() + "\n" +
                    "                            </td>\n" +
                    "                            <td>"+ o.getFullName()+"\n" +
                    "                            </td>\n" +
                    "                            <td>\n" + s + "                            </td>\n" +
                    "\n" +
                    "                            <td>" + o.getPhone() + "\n" +
                    "                            </td>\n" +
                    "                            <td>" + o.getTotalMoney() + "\n" +
                    "                            </td>\n" +
                    "                            <td id=\"orderStatus\">\n" + statusSpan + "                            </td>\n" +
                    "                            <td id=\"buttonGroup\">\n" +
                    "\n" +

                    "                                <button id=\"editbutton\" class=\"btn btn-primary btn-sm edit\" type=\"button\"\n" +
                    "                                        title=\"Sửa\"\n" +
                    "                                        onclick=\"changeStatus(" + o.getId() + "," + o.getId_status() + ")\">\n" +
                    "                                    <i class=\"fa fa-edit\"></i></button>\n" +
                    "                            </td>\n" +
                    "                        </tr>");

        }

//        response.sendRedirect("ListOrderControl");
    }
}
