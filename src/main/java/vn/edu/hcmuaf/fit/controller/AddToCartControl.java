package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CartDao;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.CartItem;
import vn.edu.hcmuaf.fit.entity.Log;
import vn.edu.hcmuaf.fit.entity.Product;
import vn.edu.hcmuaf.fit.service.LogService;

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
        String quantity = request.getParameter("quantity");
        Product product = CartDao.getProductById(idProduct);
        LogService logService = LogService.getInstance();
        CartItem cartItem;
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("Account");
        PrintWriter out = response.getWriter();
        HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");

        if (account == null) {
            if (cart == null) {
                cart = new HashMap<Integer, CartItem>();
                if (quantity != null) {
                    cartItem = new CartItem(product, Integer.parseInt(quantity));
                } else {
                    cartItem = new CartItem(product, 1);
                }
                cart.put(Integer.valueOf(idProduct), cartItem);
            } else {
                if (cart.containsKey(Integer.parseInt(idProduct))) {
                    cartItem = cart.get(Integer.parseInt(idProduct));
                    if (cartItem.getQuantity() < product.getQuantity()) {
                        if (quantity == null) {
                            cartItem.incrementQuantity();
                        } else {
                            if ((Integer.parseInt(quantity) + cartItem.getQuantity()) < product.getQuantity()) {
                                cartItem.incrementQuantityWithQuantity(Integer.parseInt(quantity));
                            } else {
                                cartItem.setQuantity(product.getQuantity());
                            }

                        }
                    }
                } else {
                    if (quantity != null) {
                        cartItem = new CartItem(product, Integer.parseInt(quantity));
                    } else {
                        cartItem = new CartItem(product, 1);
                    }
                    cart.put(Integer.parseInt(idProduct), cartItem);
                }
            }
        } else {
            if (cart == null) {
                cart = new HashMap<Integer, CartItem>();
                if (quantity != null) {
                    cartItem = new CartItem(product, Integer.parseInt(quantity), account);
                    new CartDao().addCartItem(cartItem);
                } else {
                    cartItem = new CartItem(product, 1, account);
                    new CartDao().addCartItem(cartItem);
                }
                cart.put(Integer.valueOf(idProduct), cartItem);
            } else {
                if (cart.containsKey(Integer.parseInt(idProduct))) {
                    cartItem = cart.get(Integer.parseInt(idProduct));
                    if (cartItem.getQuantity() < product.getQuantity()) {
                        if (quantity == null) {
                            cartItem.incrementQuantity();
                            new CartDao().updateCartItem(cartItem);
                            logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), "Cập nhật số lượng sản phẩm mã " + product.getId() + " thành " + cartItem.getQuantity() + "", 0, logService.getIpClient(request), logService.getBrowserName(request)));
                        } else {
                            if ((Integer.parseInt(quantity) + cartItem.getQuantity()) < product.getQuantity()) {
                                cartItem.incrementQuantityWithQuantity(Integer.parseInt(quantity));
                                new CartDao().updateCartItem(cartItem);
                            } else {
                                cartItem.setQuantity(product.getQuantity());
                                new CartDao().updateCartItem(cartItem);
                            }

                        }
                    }
                } else {
                    if (quantity != null) {
                        cartItem = new CartItem(product, Integer.parseInt(quantity), account);
                        new CartDao().addCartItem(cartItem);
                        logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), "Thêm sản phẩm mã " + product.getId() + " vào giỏ hàng", 0, logService.getIpClient(request), logService.getBrowserName(request)));

                    } else {
                        cartItem = new CartItem(product, 1, account);
                        new CartDao().addCartItem(cartItem);
                        logService.insertNewLog(new Log(Log.INFO, account.getId(), this.getClass().getName(), "Thêm sản phẩm mã " + product.getId() + " vào giỏ hàng", 0, logService.getIpClient(request), logService.getBrowserName(request)));
                    }
                    cart.put(Integer.parseInt(idProduct), cartItem);

                }
            }
        }

        session.setAttribute("cart", cart);
        out.println("<a href=\"cart.jsp\"><i class=\"fa-solid fa-bag-shopping\"></i>Giỏ hàng(" + (cart != null ? cart.size() : 0) + ")</a>");
    }
}


