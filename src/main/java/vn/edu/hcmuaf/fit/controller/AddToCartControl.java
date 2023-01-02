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

@WebServlet(name = "AddToCartControl", value = "/addtocart")
public class AddToCartControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CartDao CartDao = new CartDao();
        String idProduct = request.getParameter("inputId");
        Product product = CartDao.getProductById(idProduct);
        CartItem cartItem;
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<Integer, CartItem>();
            cartItem = new CartItem(product, 1);
            cart.put(Integer.valueOf(idProduct), cartItem);
        } else {
            if (cart.containsKey(Integer.parseInt(idProduct))) {
                cartItem = cart.get(Integer.parseInt(idProduct));
                if (cartItem.getQuantity() < product.getQuantity()) {

                    cartItem.incrementQuantity();
                }
            } else {
                cartItem = new CartItem(product, 1);
                cart.put(Integer.parseInt(idProduct), cartItem);
            }
        }

        session.setAttribute("cart", cart);
        out.println("<a href=\"cart.jsp\"><i class=\"fa-solid fa-bag-shopping\"></i>Giỏ hàng(" + (cart != null ? cart.size() : 0) + ")</a>");
    }
}
