package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CartDao;
import vn.edu.hcmuaf.fit.entity.CartItem;
import vn.edu.hcmuaf.fit.entity.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet(name = "BuyNowControl", value = "/BuyNowControl")
public class BuyNowControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CartDao CartDao = new CartDao();
        String idProduct = request.getParameter("idProduct");
        String quantity = request.getParameter("quantity");
        Product product = CartDao.getProductById(idProduct);
        CartItem cartItem;
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        cartItem = new CartItem(product, Integer.parseInt(quantity));

        session.setAttribute("buynow", cartItem);
        response.sendRedirect("checkout.jsp");
    }
}
