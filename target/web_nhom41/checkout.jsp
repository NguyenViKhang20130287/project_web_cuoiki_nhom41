<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.ProductInCart" %>
<%@ page import="java.util.HashMap" %>
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

<body>
    <div class="main_page">

        <!-- Header page -->
        <div class="header_page">
            <div class="header_page-main">

                <div class="header_page-logo">
                    <a href="index.jsp"><img src="img/logo.png" alt=""></a>
                </div>

                <div class="header_page-category">

                    <ul class="header_page-category-main-menu">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li><a href="product"> Sản phẩm<i class="fa-solid fa-chevron-down"></i></a>

                            <ul class="header_page-category-sub-menu">

                                <li><a href="">Nhẫn</a></li>
                                <li><a href="">Hoa tai</a></li>
                                <li><a href="">Dây chuyền</a></li>
                                <li><a href="">Vòng tay</a></li>
                                <li><a href="">Mặt dây chuyền</a></li>
                            </ul>
                        </li>

                        <li><a href="">Trang<i class="fa-solid fa-chevron-down"></i></a>
                            <ul class="header_page-category-sub-menu">

                                <% if (session.getAttribute("Account") != null) {%>
                                <li><a href="LogoutControl" style="font-weight: normal">Đăng xuất</a></li>
                                <%}%>

                                <% if (session.getAttribute("Account") == null) { %>
                                <li><a href="login.jsp" style="font-weight: normal">Tài khoản</a></li>
                                <% } %>

                                <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                                <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>

                                <% if (Objects.equals(session.getAttribute("role"), "0")) { %>
                                <li><a href="admin/doc/index-admin.html" style="font-weight: normal">Quản lý website</a></li>
                                <% } %>

                            </ul>
                        </li>
                        <li><a href="contact.jsp">Liên hệ</a></li>
                    </ul>
                </div>

                <!--  -->
                <div class="header_page-btns non-reponsive">
                    <button type="button" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i>Tìm
                        kiếm
                    </button>
                    <% HashMap<Integer, ProductInCart> listCart = (HashMap<Integer, ProductInCart>) session.getAttribute("cart"); %>
                    <button><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i>Giỏ hàng(<%=listCart != null ? listCart.size() : 0 %>)</a></button>

                    <% if (session.getAttribute("Account") != null) {%>
                    <button><a href="LogoutControl">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        <%= session.getAttribute("username") %>
                    </a></button>
                    <%}%>

                    <% if (session.getAttribute("Account") == null) {%>
                    <button><a href="login.jsp"><i class="fa-solid fa-user"></i>Tài khoản</a></button>
                    <%}%>

                </div>
                <!--  -->
                <div class="header_page-btns responsive">
                    <div class="nav">
                        <button class="navbar"><i class="fa-solid fa-bars"></i></button>
                    </div>

                    <div class="right_btn">
                        <button type="button" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        <button><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i></a></button>
                        <button><a href="login.jsp"><i class="fa-solid fa-user"></i></a></button>
                    </div>

                    <div class="category_header-responsive">
                        <ul class="main-menu">
                            <li><a href="index.jsp">Trang chủ</a></li>
                            <li class="main-menu-list">
                                <div class="main-menu-title">
                                    <a href="product">
                                        <h1>Sản phẩm</h1>
                                    </a>
                                    <i class="fa-solid fa-chevron-down"></i>
                                </div>
                                <div class="main-menu-content">
                                    <ul>
                                        <li><a href="" style="font-weight: normal">Nhẫn</a></li>
                                        <li><a href="" style="font-weight: normal">Hoa tai</a></li>
                                        <li><a href="" style="font-weight: normal">Dây chuyên</a></li>
                                        <li><a href="" style="font-weight: normal">Vòng tay</a></li>
                                        <li><a href="" style="font-weight: normal">Mặt dây chuyền</a></li>
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
                                        <li><a href="logincontrol" style="font-weight: normal">Đăng nhập</a></li>
                                        <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                                        <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
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
                        <li>Hoa tay</li>
                        <li>Dây chuyền</li>
                        <li>Vòng tay</li>
                        <li>Mặt dây chuyền</li>
                    </ul>
                </div>
                <div class="main-modal-search">
                    <form action="search" method="get" class="site-block-top-search">
                        <input name="keyword" type="text" placeholder="Tìm kiếm sản phẩm...">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </form>
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
                    <li><a href="index.jsp">
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
                                <p>Bạn đã có tài khoản?<span id="login">Bấm vào đây để đăng nhập</span></p>
                            </div>
                        </div>
                        <form class="checkout-login" style="display: none">
                            <h1 style="margin-bottom: 30px; text-align: center">Đăng Nhập</h1>
                            <div class="item-1">

                                <div class="input-text">
                                    <label for="email">Địa Chỉ Email<span style="color: red">*</span></label>
                                    <input type="email" id="email" placeholder="Địa Chỉ Email...">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="login-Pass">Mật Khẩu <span style="color: red">*</span></label>
                                    <input type="password" id="login-Pass" placeholder="Mật Khẩu">
                                </div>
                            </div>
                            <div class="save">
                                <div class="save-container">

                                    <input id="save" type="checkbox">
                                    <label for="save">Nhớ Mật Khẩu!</label>
                                </div>
                                <div class="lost-pass">
                                    <a href="">Quên Mật Khẩu?</a>
                                </div>

                            </div>
                            <button class="login-button">ĐĂNG NHẬP</button>
                        </form>
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

                <div class="checkout-container">
                    <div class="left-container">


                        <div class="checkout-area">
                            <h3>Chi Tiết Thanh Toán</h3>

                            <div class="item-1">
                                <div class="input-text">
                                    <label for="lastName">Họ Và Tên<span style="color: red">*</span></label>
                                    <input type="text" id="lastName" placeholder="Họ Và Tên">
                                </div>
                            </div>


                            <div class="item-1">
                                <div class="input-text">
                                    <label for="streetAddress">Số Nhà, Tên Đường <span
                                            style="color: red">*</span></label>
                                    <input type="text" id="streetAddress" placeholder="Số Nhà, Tên Đường">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="ward">Phường / Xã <span style="color: red">*</span></label>
                                    <input type="text" id="ward" placeholder="Phường / Xã">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="district">Quận / Huyện <span style="color: red">*</span></label>
                                    <input type="text" id="district" placeholder="Quận / Huyện">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="city">Tỉnh / Thành Phố <span style="color: red">*</span></label>
                                    <input type="text" id="city" placeholder="Tỉnh / Thành Phố">
                                </div>
                            </div>
                            <div class="item-2">
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="mail">Địa Chỉ Email <span style="color: red">*</span></label>
                                        <input type="email" id="mail" placeholder="Địa Chỉ Email">
                                    </div>
                                </div>
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="phone">Số Điện Thoại <span style="color: red">*</span></label>
                                        <input type="tel" id="phone" placeholder="Số Điện Thoại">
                                    </div>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <input type="checkbox" id="newAccount">
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
                                        <input type="password" id="pass" placeholder="Nhập Mật Khẩu">
                                    </div>
                                </div>
                            </div>
                            <h3 class="difference-Add">Giao Tới Một Địa Chỉ Khác? <input type="checkbox"
                                    class="difference" style="width: 18px;height: 18px;">
                            </h3>
                            <div id="difference-Add">


                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="lastName2">Họ Và Tên <span style="color: red">*</span></label>
                                        <input type="text" id="lastName2" placeholder="Họ Và Tên">
                                    </div>
                                </div>


                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="streetAddress2">Số Nhà, Tên Đường <span
                                                style="color: red">*</span></label>
                                        <input type="text" id="streetAddress2" placeholder="Số Nhà, Tên Đường">
                                    </div>
                                </div>
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="ward2">Phường / Xã <span style="color: red">*</span></label>
                                        <input type="text" id="ward2" placeholder="Phường / Xã">
                                    </div>
                                </div>
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="district2">Quận / Huyện <span style="color: red">*</span></label>
                                        <input type="text" id="district2" placeholder="Quận / Huyện">
                                    </div>
                                </div>
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="city2">Tỉnh / Thành Phố <span style="color: red">*</span></label>
                                        <input type="text" id="city2" placeholder="Tỉnh / Thành Phố">
                                    </div>
                                </div>
                                <div class="item-2">
                                    <div class="item-1">
                                        <div class="input-text">
                                            <label for="mail2">Địa Chỉ Email <span style="color: red">*</span></label>
                                            <input type="email" id="mail2" placeholder="Địa Chỉ Email">
                                        </div>
                                    </div>
                                    <div class="item-1">
                                        <div class="input-text">
                                            <label for="phone2">Số Điện Thoại <span style="color: red">*</span></label>
                                            <input type="tel" id="phone2" placeholder="Số Điện Thoại">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="note">Ghi Chú</label>
                                    <textarea name="note" id="note" cols="30" rows="10"
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
                                    <tbody></tbody>
                                    <tfoot>
                                        <tr class="cartSubtotal">
                                            <th>Tổng Giỏ Hàng</th>
                                            <td><span class="amount">0₫</span></td>
                                        </tr>
                                        <tr class="order-total">
                                            <th style="border-bottom: none;">Tổng Đơn Hàng</th>
                                            <td style="border-bottom: none;"><strong><span
                                                        class="amount">0₫</span></strong>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                                <div class="collapsible_set">
                                    <button id="collapsible1" onclick="payment(this.id)">
                                        <h5>
                                            THANH TOÁN KHI NHẬN HÀNG
                                            (COD)</h5>
                                    </button>
                                    <div class="content1 show">
                                        <p>Hình thức thanh toán khi nhận hàng, giao hàng thu tiền.
                                            Người
                                            mua với hình thức ship COD chỉ thanh toán tiền khi nhận được hàng, sau đó
                                            tiền sẽ
                                            chuyển về cho người bán thông qua đơn vị vận chuyển trên.</p>
                                    </div>
                                    <button id="collapsible2" onclick="payment(this.id)">
                                        <h5>THANH TOÁN BẰNG MOBILE
                                            BANKING</h5>
                                    </button>
                                    <div class="content2">
                                        <p>Thanh toán hoá đơn chỉ với một chiếc điện thoại đã được cài đặt
                                            sẵn ứng dụng của các ngân hàng và có kết nối mạng. Hệ thống thanh toán qua
                                            Mobile
                                            Banking đang được các nhà cung cấp dịch vụ nâng cấp để đáp ứng được tối đa
                                            nhu cầu
                                            của khách hàng.</p>
                                    </div>
                                    <button id="collapsible3" onclick="payment(this.id)">
                                        <h5>
                                            THANH TOÁN BẰNG VÍ ĐIỆN TỬ</h5>
                                    </button>
                                    <div class="content3">
                                        <p>Hình thức thanh toán hoá đơn bằng ví điện tử được sử dụng rộng
                                            rãi trong thời đại ngày nay. Chỉ với một vài thao tác đơn giản là bạn có thể
                                            thanh
                                            toán tại bất kỳ nơi nào chấp nhận thanh toán. Một số ví điện tử phổ biến
                                            hiện nay:
                                            Momo, Zalo Pay, SmartPay,ViettelPay...</p>
                                    </div>
                                </div>
                                <button class="place-order">ĐẶT HÀNG</button>
                            </div>

                        </div>
                    </div>
                </div>


            </div>

        </div>

        <!-- footer page -->
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

    </div>
</body>
<script src="js/main.js"></script>
<script src="js/checkout.js"></script>

</html>