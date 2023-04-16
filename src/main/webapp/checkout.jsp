<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Account" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/checkout.css">
    <title>Shop Bán Ngọc Quý</title>
</head>
<% HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
    Account accSession = (Account) session.getAttribute("Account");

    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>

<body>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Thanh toán</h1>
</div>
<!-- body page -->
<div class="body_page">

    <div class="body_page-menu">
        <ul>
            <li><a href="home">
                <i class="fa-solid fa-house"></i>
                Trang chủ</a>
            </li>
            <span><i class="fa-solid fa-chevron-right"></i></span>
            <li><a href="">Thanh toán</a></li>
        </ul>
    </div>

    <div class="body_page-main">
        <div class="checkout-container">
            <div class="left-container">
                <div class="clickbox">
                    <i class="fa-solid fa-folder"></i>
                    <div class="text-inbox">
                        <p>Bạn đã có tài khoản? <a style="color: #6f7172; transition: all .3s"
                                                   id="login" href="LoginControl">Bấm vào đây để đăng nhập</a></p>
                    </div>
                </div>

            </div>
            <div class="right-container">
                <div class="clickbox">
                    <i class="fa-solid fa-folder"></i>
                    <div class="text-inbox">
                        <p>Có phiếu giảm giá?<span id="coupon">Bấm vào đây để nhập mã</span></p>
                    </div>

                </div>
                <form action="" id="useCoupon" style="display: none">
                    <div class="enter-Coupon">
                        <div class="item-1">
                            <div class="input-text">
                                <input type="text" id="couponCode" placeholder="Mã Giảm Giá">

                            </div>
                        </div>
                    </div>
                    <button class="apply-coupon">ÁP DỤNG MÃ</button>
                </form>
            </div>
        </div>
        <% if (session.getAttribute("buynow") == null) { %>
        <form action="CheckoutControl" method="get">
                <% }else{ %>
            <form action="CheckoutBuyNowControl" method="get">
                <% } %>
                <div class="checkout-container">
                    <div class="left-container">


                        <div class="checkout-area">
                            <h3>Chi Tiết Thanh Toán</h3>

                            <div class="item-1">
                                <div class="input-text">
                                    <label for="lastName">Họ Và Tên<span style="color: red">*</span></label>
                                    <input type="text" id="lastName" placeholder="Họ Và Tên" name="name">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="streetAddress">Số Nhà, Tên Đường <span
                                            style="color: red">*</span></label>
                                    <input type="text" id="streetAddress" placeholder="Số Nhà, Tên Đường"
                                           name="streetAddress">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="city">Tỉnh / Thành Phố <span style="color: red">*</span></label>
                                    <select id="city" name="city" onchange="resetDistrict()">
                                        <option value="" selected disabled>Chọn Tỉnh / Thành Phố</option>
                                    </select>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="district">Quận / Huyện <span style="color: red">*</span></label>
                                    <select id="district" name="district" onchange="resetWard()">
                                        <option value="" selected disabled>Chọn Quận / Huyện</option>
                                    </select>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="ward">Phường / Xã <span style="color: red">*</span></label>
                                    <select id="ward" name="ward">
                                        <option value="" selected disabled>Chọn Phường / Xã</option>
                                    </select>
                                </div>
                            </div>

                            <div class="item-2">
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="mail">Địa Chỉ Email <span style="color: red">*</span></label>
                                        <input type="email" id="mail" placeholder="Địa Chỉ Email" name="mail">
                                    </div>
                                </div>
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="phone">Số Điện Thoại <span style="color: red">*</span></label>
                                        <input type="tel" id="phone" placeholder="Số Điện Thoại" name="phone">
                                    </div>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <input type="checkbox" id="newAccount" name="newAccount" value="newAccount">
                                    <label for="newAccount" id="label-New-Account">Tạo Tài Khoản Mới?</label>
                                </div>
                            </div>
                            <div class="newAccount">

                                <div class="item-1">
                                    <p>Tạo tài khoản mới bằng cách nhập vào thông tin bên dưới. Nếu bạn đã có tài khoản,
                                        xin
                                        hãy đăng nhập ở phần đầu trang</p>
                                    <div class="input-text">
                                        <label for="pass">Mật Khẩu <span style="color: red">*</span></label>
                                        <input type="password" id="pass" placeholder="Nhập Mật Khẩu" name="pass">
                                    </div>
                                </div>
                            </div>

                            <div class="item-1">
                                <div class="input-text">
                                    <label for="note">Ghi Chú</label>
                                    <textarea name="note" id="note" cols="30" rows="10" name="note"
                                              placeholder="Ghi chú về đơn hàng của bạn, ví dụ: lưu ý đặc biệt về vận chuyển..."></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="right-container">


                        <div class="your-order">
                            <h3>Đơn Hàng Của Bạn</h3>
                            <div class="order-table">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>Sản Phẩm</th>
                                        <th>Tổng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% int total = 0;
                                        int totalCart = 0;
                                        if (session.getAttribute("buynow") == null) {
                                            if (cart != null) {
                                                for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                                                    if (entry.getValue().getProduct().getDiscount() != 0) {
                                                        total = entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity();

                                                    } else {
                                                        total = entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity();
                                                    }
                                                    totalCart += total;
                                    %>
                                    <tr>
                                        <td>
                                            <%= entry.getValue().getProduct().getTitle() %>
                                            <strong>x <%= entry.getValue().getQuantity() %>
                                            </strong>
                                        </td>
                                        <td>
                                            <%= numberFormat.format(total)%>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    } else {
                                        CartItem cartItem = (CartItem) session.getAttribute("buynow");
                                        if (cartItem.getProduct().getDiscount() != 0) {
                                            total = cartItem.getProduct().getDiscount() * cartItem.getQuantity();

                                        } else {
                                            total = cartItem.getProduct().getPrice() * cartItem.getQuantity();
                                        }
                                        totalCart += total;
                                    %>
                                    <tr>
                                        <td>
                                            <%= cartItem.getProduct().getTitle() %>
                                            <strong>x <%= cartItem.getQuantity() %>
                                            </strong>
                                        </td>
                                        <td>
                                            <%= numberFormat.format(total)%>
                                        </td>
                                    </tr>
                                    <% }
                                    %>
                                    </tbody>
                                    <tfoot>
                                    <tr class="cartSubtotal">
                                        <th>Tổng Giỏ Hàng</th>
                                        <td><span class="amount"><%= numberFormat.format(totalCart)%></span></td>
                                    </tr>
                                    <tr class="order-total">
                                        <th style="border-bottom: none;">Tổng Đơn Hàng</th>
                                        <td style="border-bottom: none;"><strong><span
                                                class="amount"><%= numberFormat.format(totalCart)%></span></strong>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>

                                <div class="collapsible_set">
                                    <label for="payment">Hình thức thanh toán: </label>
                                    <select name="payment" id="payment">
                                        <option value="" disabled selected> Vui lòng chọn hình thức thanh toán</option>
                                        <option value="1"> Tiền mặt</option>
                                        <% if (accSession != null) { %>
                                        <option value="2"> Internet banking</option>
                                        <option value="3"> Ví điện tử</option>
                                        <% } %>
                                    </select>
                                </div>
                                <% if (request.getAttribute("message") != null) {

                                %>
                                <p style="color: red;text-align: center"><%=request.getAttribute("message") %>
                                </p>
                                <%
                                    }
                                %>
                                <button type="submit" class="place-order">ĐẶT HÀNG</button>
                            </div>

                        </div>
                    </div>
                </div>

            </form>


    </div>

</div>

<!-- footer page -->
<%@include file="foooter.jsp" %>
</body>
<script src="js/jquery-3.6.1.min.js"></script>
<script>
    fetch(`https://provinces.open-api.vn/api/?depth=2`)
        .then((data) => data.json())
        .then(data => {
            data.forEach(province => {
                const city = `<option value="${province.name}">${province.name}</option>`;
                document.querySelector("select#city").insertAdjacentHTML('beforeend', city);
            })
        })

</script>
<script src="js/main.js"></script>
<script src="js/checkout.js"></script>
</html>