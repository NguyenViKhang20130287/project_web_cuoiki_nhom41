package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.dao.CheckoutDAO;
import vn.edu.hcmuaf.fit.entity.Account;
import vn.edu.hcmuaf.fit.entity.CartItem;
import vn.edu.hcmuaf.fit.entity.Log;
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
import java.util.Map;

@WebServlet(name = "CheckoutBuyNowControl", value = "/CheckoutBuyNowControl")
public class CheckoutBuyNowControl extends HttpServlet {
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
        String wardValue = request.getParameter("ward");
        String[] wardParts = wardValue.split("-");
        String ward = wardParts[1];
        String districtValue = request.getParameter("district");
        String[] districtParts = districtValue.split("-");
        String district = districtParts[1];
        String cityValue = request.getParameter("city");
        String[] cityParts = cityValue.split("-");
        String city = cityParts[1];
        String mail = request.getParameter("mail");
        String phone = request.getParameter("phone");
        String pass = request.getParameter("pass");
        String note = request.getParameter("note");
        String newAccount = request.getParameter("newAccount");
        String payment = request.getParameter("payment");
        int shippingCost = Integer.parseInt(request.getParameter("costs"));
        LogService logService = LogService.getInstance();

        Account accSession = (Account) session.getAttribute("Account");
        String username = "";
        if (accSession != null) {
            username = accSession.getUsername();

        } else {
            username = null;
        }

        PrintWriter out = response.getWriter();
        CheckoutDAO checkoutDAO = new CheckoutDAO();
        String registerMessage = "";

        if (session.getAttribute("buynow") != null) {
            if (name.equals("") || streetAddress.equals("") || ward.equals("") || district.equals("") || city.equals("") || phone.equals("") || payment == null || !checkoutDAO.validatePhoneNumber(phone)) {

                request.setAttribute("message", "Vui lòng điền đúng và đầy đủ thông tin!");
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
                HashMap<Integer, CartItem> cart = new HashMap<Integer, CartItem>();
                CartItem item = (CartItem) session.getAttribute("buynow");
                cart.put(item.getProduct().getId(), item);
                int idAdd = 0;
                if (checkoutDAO.getIdAddress(streetAddress, ward, district, city) != 0) {
                    idAdd = checkoutDAO.getIdAddress(streetAddress, ward, district, city);

                } else {
                    checkoutDAO.addAddress(streetAddress, ward, district, city);
                    idAdd = checkoutDAO.getIdAddress(streetAddress, ward, district, city);
                }
                int statusId = 1;
                if (paymentMethod.equals("Tiền mặt")) {
                    statusId = 2;
                }
                if (accSession != null) {
                    logService.insertNewLog(new Log(Log.INFO, accSession.getId(), this.getClass().getName(), "Người dùng có tên đăng nhập: " + accSession.getUsername() + " đã mua ngay một sản phẩm", 0, logService.getIpClient(request), logService.getBrowserName(request)));
                }
                checkoutDAO.addCheckout(name, idAdd, mail, phone, note, cart, userId, paymentMethod, statusId, shippingCost);
                Map<Integer, CartItem> cartList = (Map<Integer, CartItem>) session.getAttribute("cart");
                for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                    int price = 0;
                    if (entry.getValue().getProduct().getDiscount() != 0) {
                        price = entry.getValue().getProduct().getDiscount();
                    } else {
                        price = entry.getValue().getProduct().getPrice();
                    }
                    checkoutDAO.addOrderDetail(entry.getKey(), checkoutDAO.getOrderID(name, checkoutDAO.getIdAddress(streetAddress, ward, district, city), mail, phone, checkoutDAO.getTotalMoney(cart)), price, entry.getValue().getQuantity());
                    if (cartList != null) {
                        if ((cartList.get(entry.getKey()).getQuantity()) > (entry.getValue().getProduct().getQuantity() - entry.getValue().getQuantity())) {
                            cartList.get(entry.getKey()).setQuantity(cartList.get(entry.getKey()).getQuantity() - entry.getValue().getQuantity());
                            if (cartList.get(entry.getKey()).getQuantity() <= 0) {
                                cartList.remove(entry.getKey());
                            }
                        }
                        if (cartList.size() == 0) {
                            session.setAttribute("cart", null);
                        }
                    }

                    checkoutDAO.updateQuantity(String.valueOf(entry.getKey()), entry.getValue().getProduct().getQuantity() - entry.getValue().getQuantity());
                }

                session.setAttribute("buynow", null);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đặt hàng thành công" + registerMessage + "');");
                out.println("location='home';");
                out.println("</script>");

            }


        }

    }

}
