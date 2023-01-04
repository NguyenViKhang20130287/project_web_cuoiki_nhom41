<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
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

    <style>


        #box-admin {
            position: relative;
        }

        #box-admin:hover #box-admin-menu {
            visibility: visible;
            opacity: 1;
        }

        #box-admin-btn:hover #box-admin-menu {
            visibility: visible;
            opacity: 1;
        }

        #box-admin-menu {
            border: 1px solid #dadada;
            box-shadow: 0px 1px 6px 0px #dadada;
            position: absolute;
            z-index: 2;
            width: 200px;
            left: 10px;
            background: #fff;

            visibility: hidden;
            opacity: 0;
            transition: visibility 0s, opacity 0.3s linear;
        }

        #box-admin-menu li {
            font-size: 14px;
            color: #000;
            border-bottom: 1px solid #bc8247;
            transition: all ease .3s;
        }

        #box-admin-menu li:last-child {
            border-bottom: none;
        }

        #box-admin-menu li a {
            display: block;
            padding: 20px;
            font-size: 14px;
            color: #000;
            ransition: all ease .3s;
        }

        #box-admin-menu li a i {
            margin-right: 10px;
        }

        #box-admin-menu li:hover {
            transform: scale(0.8);
            color: #bc8247;
        }

        #box-admin-menu li:hover a {
            color: #bc8247;
        }

    </style>

</head>
<% HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>

<body>
<div class="main_page">

    <!-- Header page -->
    <div class="header_page">
        <div class="header_page-main">

            <div class="header_page-logo">
                <a href="home"><img src="img/logo.png" alt=""></a>
            </div>

            <div class="header_page-category">

                <ul class="header_page-category-main-menu">
                    <li><a href="home">Trang chủ</a></li>
                    <li><a href="product"> Sản phẩm<i class="fa-solid fa-chevron-down"></i></a>

                        <ul class="header_page-category-sub-menu">

                            <li><a href="category?category_id=2">Nhẫn</a></li>
                            <li><a href="category?category_id=3">Hoa tai</a></li>
                            <li><a href="category?category_id=4">Vòng cổ</a></li>
                            <li><a href="category?category_id=5">Vòng tay</a></li>
                            <li><a href="category?category_id=6">Mặt dây chuyền</a></li>
                        </ul>
                    </li>

                    <li><a href="">Trang<i class="fa-solid fa-chevron-down"></i></a>
                        <ul class="header_page-category-sub-menu">

                            <% if (session.getAttribute("Account") != null) { %>
                            <% if (Objects.equals(session.getAttribute("role"), "0")) { %>
                            <li><a href="LogoutControl" style="font-weight: normal">Đăng xuất</a></li>
                            <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                            <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                            <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý website</a></li>

                            <% } else if ((Objects.equals(session.getAttribute("role"), "1"))) { %>
                            <li><a href="LogoutControl" style="font-weight: normal">Đăng xuất</a></li>
                            <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                            <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                            <%}%>
                            <%}%>

                            <% if ((session.getAttribute("Account") == null)) { %>
                            <li><a href="LoginControl" style="font-weight: normal">Tài khoản</a></li>
                            <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                            <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                            <% } %>

                        </ul>
                    </li>
                    <li><a href="contact.jsp">Liên hệ</a></li>
                </ul>
            </div>

            <!--  -->
            <div class="header_page-btns non-reponsive">
                <div style="display: flex; justify-content: space-between">
                    <button type="button" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i>Tìm
                        kiếm
                    </button>
                    <% HashMap<Integer, CartItem> listCart = (HashMap<Integer, CartItem>) session.getAttribute("cart"); %>
                    <button id="cartQuantity"><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i>Giỏ
                        hàng(<%=listCart != null ? listCart.size() : 0 %>)</a></button>

                    <% if (session.getAttribute("Account") != null) {%>
                    <% if ((Objects.equals(session.getAttribute("role"), "0"))) { %>
                    <div id="box-admin">
                        <button><%= session.getAttribute("username") %>
                        </button>
                        <ul id="box-admin-menu">
                            <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li>
                            <li><a href="admin/doc/index-admin.jsp"><i class="fa-solid fa-user-gear"></i>Quản lý website</a>
                            </li>
                        </ul>
                    </div>
                    <% } else if ((Objects.equals(session.getAttribute("role"), "1"))) { %>
                    <div id="box-admin">
                        <button><%= session.getAttribute("username") %>
                        </button>
                        <ul id="box-admin-menu">
                            <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li>
                        </ul>
                    </div>
                    <% } %>
                    <% } %>

                    <% if (session.getAttribute("Account") == null) {%>
                    <button><a href="LoginControl"><i class="fa-solid fa-user"></i>Tài khoản</a></button>
                    <%}%>
                </div>
            </div>
        </div>
        <!--  -->
        <div class="header_page-btns responsive">
            <div class="nav">
                <button class="navbar"><i class="fa-solid fa-bars"></i></button>
            </div>

            <div class="right_btn">
                <button type="button" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                <button><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i></a></button>

                <% if (session.getAttribute("Account") != null) {%>
                <button><a href="LogoutControl"><i class="fa-solid fa-user-check"></i></a></button>
                <% } %>

                <% if (session.getAttribute("Account") == null) {%>
                <button><a href="LoginControl"><i class="fa-solid fa-user"></i></a></button>
                <%}%>
            </div>

            <div class="category_header-responsive">
                <ul class="main-menu">
                    <li><a href="home">Trang chủ</a></li>
                    <li class="main-menu-list">
                        <div class="main-menu-title">
                            <a href="product">
                                <h1>Sản phẩm</h1>
                            </a>
                            <i class="fa-solid fa-chevron-down"></i>
                        </div>
                        <div class="main-menu-content">
                            <ul>
                                <li><a href="category?category_id=2" style="font-weight: normal">Nhẫn</a></li>
                                <li><a href="category?category_id=3" style="font-weight: normal">Hoa tai</a></li>
                                <li><a href="category?category_id=4" style="font-weight: normal">Vòng cổ</a></li>
                                <li><a href="category?category_id=5" style="font-weight: normal">Vòng tay</a></li>
                                <li><a href="category?category_id=6" style="font-weight: normal">Mặt dây chuyền</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="main-menu-list">
                        <div class="main-menu-title">
                            <h1>Trang</h1>
                            <i class="fa-solid fa-chevron-down"></i>
                        </div>
                        <div class="main-menu-content">
                            <ul>
                                <% if (session.getAttribute("Account") != null) { %>
                                <% if (Objects.equals(session.getAttribute("role"), "0")) { %>
                                <li><a href="LogoutControl" style="font-weight: normal">Đăng xuất</a></li>
                                <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                                <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                                <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý website</a>
                                </li>

                                <% } else if ((Objects.equals(session.getAttribute("role"), "1"))) { %>
                                <li><a href="LogoutControl" style="font-weight: normal">Đăng xuất</a></li>
                                <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                                <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                                <%}%>
                                <%}%>

                                <% if ((session.getAttribute("Account") == null)) { %>
                                <li><a href="LoginControl" style="font-weight: normal">Tài khoản</a></li>
                                <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                                <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                                <% } %>
                            </ul>
                        </div>
                    </li>
                    <li><a href="contact.jsp">Liên hệ</a></li>
                </ul>
                <button class="closeBtn"><i class="fa-solid fa-xmark"></i></button>
                <div class="hidden-menu"></div>
            </div>

        </div>
    </div>

</div>

<div class="header_page-modal-search">

    <div class="main-modal">
        <div class="main-modal-close-btn">
            <button type="button"><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="main-modal-title">
            <h1>Tìm kiếm</h1>
        </div>
        <div class="main-modal-category">
            <ul>
                <li>Tất cả</li>
                <li>Nhẫn</li>
                <li>Hoa tai</li>
                <li>Vòng cổ</li>
                <li>Vòng tay</li>
                <li>Mặt dây chuyền</li>
            </ul>
        </div>
        <div class="main-modal-search">
            <input name="keyword" type="text" placeholder="Tìm kiếm sản phẩm...">
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>
    </div>
    <div class="hide-modal-search"></div>

</div>

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
                                <label for="ward">Phường / Xã <span style="color: red">*</span></label>
                                <input type="text" id="ward" placeholder="Phường / Xã" name="ward">
                            </div>
                        </div>
                        <div class="item-1">
                            <div class="input-text">
                                <label for="district">Quận / Huyện <span style="color: red">*</span></label>
                                <input type="text" id="district" placeholder="Quận / Huyện" name="district">
                            </div>
                        </div>
                        <div class="item-1">
                            <div class="input-text">
                                <label for="city">Tỉnh / Thành Phố <span style="color: red">*</span></label>
                                <input type="text" id="city" placeholder="Tỉnh / Thành Phố" name="city">
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
                        <h3 class="difference-Add">Giao Tới Một Địa Chỉ Khác? <input type="checkbox"
                                                                                     class="difference"
                                                                                     style="width: 18px;height: 18px;">
                        </h3>
                        <div id="difference-Add">


                            <div class="item-1">
                                <div class="input-text">
                                    <label for="lastName2">Họ Và Tên <span style="color: red">*</span></label>
                                    <input type="text" id="lastName2" placeholder="Họ Và Tên" name="name2">
                                </div>
                            </div>


                            <div class="item-1">
                                <div class="input-text">
                                    <label for="streetAddress2">Số Nhà, Tên Đường <span
                                            style="color: red">*</span></label>
                                    <input type="text" id="streetAddress2" placeholder="Số Nhà, Tên Đường"
                                           name="streetAddress2">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="ward2">Phường / Xã <span style="color: red">*</span></label>
                                    <input type="text" id="ward2" placeholder="Phường / Xã" name="ward2">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="district2">Quận / Huyện <span style="color: red">*</span></label>
                                    <input type="text" id="district2" placeholder="Quận / Huyện" name="district2">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="city2">Tỉnh / Thành Phố <span style="color: red">*</span></label>
                                    <input type="text" id="city2" placeholder="Tỉnh / Thành Phố" name="city2">
                                </div>
                            </div>
                            <div class="item-2">
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="mail2">Địa Chỉ Email <span style="color: red">*</span></label>
                                        <input type="email" id="mail2" placeholder="Địa Chỉ Email" name="mail2">
                                    </div>
                                </div>
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="phone2">Số Điện Thoại <span style="color: red">*</span></label>
                                        <input type="tel" id="phone2" placeholder="Số Điện Thoại" name="phone2">
                                    </div>
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
                                    <option value="2"> Internet banking</option>
                                    <option value="3"> Ví điện tử</option>
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
<section class="footer_area">
<div class="footer_page">

    <div class="footer_page-inforCompany">
        <h3>Thông tin công ty</h3>
        <ul>
            <li>Giới thiệu công ty</li>
            <li>Hệ thống siêu thị</li>
            <li>Phương châm bán hàng</li>
            <li>Cơ hội nghề nghiệp</li>
            <li>Mua hàng doanh nghiệp</li>
        </ul>
    </div>
    <div class="footer_page-policy">
        <h3>Chính sách chung</h3>
        <ul>
            <li>Bảo trì - Bảo hành - Đổi trả</li>
            <li>Quy định giao hàng</li>
            <li>Điều khoản sử dụng</li>
            <li>Thỏa thuận người dùng</li>
            <li>Cần thuê mặt bằng</li>
        </ul>
    </div>
    <div class="footer_page-members">
        <h3>Thẻ thành viên</h3>
        <ul>
            <li>Quyền lợi của thành viên</li>
            <li>Hỗ trợ thành viên</li>
            <li>Giftcard - Thẻ quà tặng</li>
            <li>Liên hệ</li>
        </ul>
    </div>
    <div class="footer_page-buyOnline">
        <h3>Mua hàng online</h3>
        <ul>
            <li>Lợi ích khi mua hàng online</li>
            <li>Thông tin chuyển khoản</li>
            <li>Hướng dẫn mua hàng</li>
            <li>Câu hỏi thường gặp</li>
        </ul>
    </div>
    <div class="footer_page-social">
        <h3>Kết nối với chúng tôi</h3>
        <ul>
            <li class="facebook"><a href=""><i class="fa-brands fa-facebook-f"></i></a></li>
            <li class="twitter"><a href=""><i class="fa-brands fa-twitter"></i></a></li>
            <li class="instagram"><a href=""><i class="fa-brands fa-instagram"></i></a></li>
        </ul>
    </div>

</div>
</section>
</div>
</body>
<script src="js/main.js"></script>
<script src="js/checkout.js"></script>
</html>