<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <% String errorMessage = (String) request.getAttribute("Error"); %>
    <% String errorMessageRegister = (String) request.getAttribute("message_regis"); %>

    <link rel="stylesheet" href="css/login.css">
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
                    <li><a href="CategoryControl"> Sản phẩm<i class="fa-solid fa-chevron-down"></i></a>

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
                <button><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i>Giỏ hàng(100)</a></button>

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
                                <a href="CategoryControl">
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
                <input type="text" placeholder="Tìm kiếm sản phẩm...">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
        </div>
        <div class="hide-modal-search"></div>

    </div>
    <!--banner-->
    <div class="banner">
        <h1>Đăng nhập</h1>
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
                <li><a href="">Đăng nhập</a></li>
            </ul>
        </div>
        <!--        Login Form-->
        <div class="body_page-main">
            <div class="login-container">
                <div class="text-header">
                    <h3>Đăng Nhập</h3>
                </div>
                <form action="LoginControl" method="post">
                    <label for="email">Tên đăng nhập <span>*</span></label>
                    <input id="email" type="text" placeholder="Username..." name="uname">
                    <label for="pass">Mật Khẩu <span>*</span></label>
                    <input id="pass" type="password" placeholder="Nhập Mật Khẩu..." name="password">

                    <div style="margin-bottom: 20px">
                        <p style="border-radius: 3px; color: #a90312;  font-weight: bold">
                            <%= errorMessage != null ? errorMessage : "" %>
                        </p>
                    </div>


                    <div class="save">
                        <div class="save-container">

                            <input id="save" type="checkbox">
                            <label for="save">Nhớ Mật Khẩu!</label>
                        </div>
                        <div class="lost-pass">
                            <a href="lostpassword.jsp">Quên Mật Khẩu?</a>
                        </div>

                    </div>
                    <button class="login-button" type="submit">ĐĂNG NHẬP</button>
                    <div class="or">
                        <span>HOẶC</span>
                    </div>
                    <button class="register-button" id="register-button-login">ĐĂNG KÝ</button>
                    <div class="other_login">
                        <div class="login_google">
                            <button><i class="fa-brands fa-google-plus-g"></i></button>
                        </div>
                        <div class="login_facebook">
                            <button><i class="fa-brands fa-facebook-f"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--        Register Form-->
        <div class="modal">
            <div class="modal-content">

                <div class="register-container">
                    <div class="close"><a href="" id="closeButton"><i class="fa-solid fa-xmark"></i></a></div>
                    <div class="text-header">
                        <h3>Đăng Ký</h3>
                    </div>
                    <form action="RegisterControl" method="post">
                        <label for="uname">Tên Đăng Nhập <span>*</span></label>
                        <input id="uname" type="text" placeholder="Nhập Tên Đăng Nhập..." name="uname">
                        <label for="email-register">Địa Chỉ Email <span>*</span></label>
                        <input id="email-register" type="email" placeholder="Địa Chỉ Email..." name="email_register">
                        <label for="pass-register">Mật Khẩu <span>*</span></label>
                        <input id="pass-register" type="password" placeholder="Nhập Mật Khẩu..." name="pass_register">

                        <div style="margin-bottom: 20px">
                            <p style="border-radius: 3px; color: #a90312;  font-weight: bold">
                                <%= errorMessageRegister != null ? errorMessageRegister : "" %>
                            </p>
                        </div>

                        <button class="register-button" id="register-button" type="submit">ĐĂNG KÝ</button>
                        <div class="or">
                            <span>HOẶC</span>
                        </div>
                        <button class="login-button" id="login-button-register">ĐĂNG NHẬP</button>
                    </form>
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
<script src="js/login.js"></script>

</html>