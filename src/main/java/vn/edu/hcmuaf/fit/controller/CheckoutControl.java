package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CheckoutDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
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
        String newAccount = request.getParameter("newAccount");
        System.out.println(newAccount);
        String payment = request.getParameter("payment");
        String username = (String) session.getAttribute("username");

        PrintWriter out = response.getWriter();
        CheckoutDAO checkoutDAO = new CheckoutDAO();
        String registerMessage = "";
        if (session.getAttribute("cart") != null) {
            if (name.equals("") || streetAddress.equals("") || ward.equals("") || district.equals("") || city.equals("") || phone.equals("") || payment == null) {

                request.setAttribute("message", "Vui lòng điền đủ thông tin");
                request.getRequestDispatcher("checkout.jsp").forward(request, response);

            } else {
                String paymentMethod = "";
                switch (payment) {
                    case "1":
                        paymentMethod = "Tiền mặt";
                        break;
                    case "2":
                        paymentMethod = "Internet Banking";
                        break;
                    case "3":
                        paymentMethod = "Ví điện tử";
                        break;
                }
                String userId = null;
                if (username != null) {
                    userId = String.valueOf(checkoutDAO.getUserID(username));
                } else {
                    userId = null;
                }

                if (newAccount != null) {
                    if (userId == null) {
                        if (!pass.equals("") && !mail.equals("")) {
                            Account acc = checkoutDAO.checkEmail(mail);
                            if (acc != null) {
                                registerMessage = ", tài khoản vừa đăng ký đã tồn tại!";
                            } else {
                                registerMessage = ", đăng ký thành công!";
                                checkoutDAO.registerCheckout(pass, name, mail, phone);
                            }
                        } else {
                            registerMessage = ", đăng ký thất bại!";
                        }
                    } else {
                        registerMessage = ", bạn đã có tài khoản!";
                    }

                }
                HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
                int idAdd = 0;
                if (checkoutDAO.getIdAddress(streetAddress, ward, district, city) != 0) {
                    idAdd = checkoutDAO.getIdAddress(streetAddress, ward, district, city);

                } else {
                    checkoutDAO.addAddress(streetAddress, ward, district, city);
                    idAdd = checkoutDAO.getIdAddress(streetAddress, ward, district, city);
                }

                checkoutDAO.addCheckout(name, idAdd, mail, phone, note, cart, userId, paymentMethod);
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
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đặt hàng thành công" + registerMessage + "');");
                out.println("location='home';");
                out.println("</script>");

            }


        } else {

            request.setAttribute("message", "Giỏ hàng trống vui lòng chọn hàng");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }

    }

}