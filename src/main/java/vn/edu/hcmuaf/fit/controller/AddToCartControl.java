package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CartDao;
import vn.edu.hcmuaf.fit.entity.Product;
import vn.edu.hcmuaf.fit.entity.ProductInCart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
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
        ProductInCart productInCart;
        HttpSession session = request.getSession();
        HashMap<Integer, ProductInCart> cart = (HashMap<Integer, ProductInCart>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<Integer, ProductInCart>();
            productInCart = new ProductInCart(product, 1);
            cart.put(Integer.valueOf(idProduct), productInCart);
        } else {
            if (cart.containsKey(Integer.parseInt(idProduct))) {
                productInCart = cart.get(Integer.parseInt(idProduct));
                productInCart.incrementQuantity();
            } else {
                productInCart = new ProductInCart(product, 1);
                cart.put(Integer.parseInt(idProduct), productInCart);
            }
        }
        session.setAttribute("cart", cart);
        request.getRequestDispatcher("product").forward(request, response);
    }
}
