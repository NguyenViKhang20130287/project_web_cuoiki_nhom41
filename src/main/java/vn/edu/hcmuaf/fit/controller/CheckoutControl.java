package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CheckoutDAO;
import vn.edu.hcmuaf.fit.entity.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CheckoutControl", value = "/CheckoutControl")
public class CheckoutControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String streetAddress = request.getParameter("streetAddress");
        String ward = request.getParameter("ward");
        String district = request.getParameter("district");
        String city = request.getParameter("city");
        String mail = request.getParameter("mail");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String name2 = request.getParameter("name2");
        String streetAddress2 = request.getParameter("streetAddress2");
        String ward2 = request.getParameter("ward2");
        String district2 = request.getParameter("district2");
        String city2 = request.getParameter("city2");
        String mail2 = request.getParameter("mail2");
        String phone2 = request.getParameter("phone2");
        String note = request.getParameter("note");

        CheckoutDAO checkoutDAO = new CheckoutDAO();
        if (session.getAttribute("cart") != null) {
            HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
            String username = (String) session.getAttribute("username");
            int idAdd = 0;
            if (checkoutDAO.getIdAddress(streetAddress, ward, district, city) != 0) {
                idAdd = checkoutDAO.getIdAddress(streetAddress, ward, district, city);

            } else {
                checkoutDAO.addAddress(streetAddress, ward, district, city);
                idAdd = checkoutDAO.getIdAddress(streetAddress, ward, district, city);
            }
            String userId = null;
            if (username != null) {
                userId = String.valueOf(checkoutDAO.getUserID(username));
            } else {
                userId = null;
            }
            checkoutDAO.addCheckout(name, idAdd, mail, phone, note, cart, userId);
            for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                int price = 0;
                if (entry.getValue().getProduct().getDiscount() != 0) {
                    price = entry.getValue().getProduct().getDiscount();
                } else {
                    price = entry.getValue().getProduct().getPrice();
                }
                checkoutDAO.addOrderDetail(entry.getKey(), checkoutDAO.getOrderID(name, checkoutDAO.getIdAddress(streetAddress, ward, district, city), mail, phone, checkoutDAO.getTotalMoney(cart)), price, entry.getValue().getQuantity());
            }
            session.setAttribute("cart", null);
            response.sendRedirect("home");
        } else {
            response.sendRedirect("checkout.jsp");
        }

    }

}
