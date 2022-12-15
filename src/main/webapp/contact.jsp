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
    <link rel="stylesheet" href="css/contact.css">
    <title>Shop Bán Ngọc Quý</title>
</head>

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
            <h1>Liên hệ</h1>
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
                    <li><a href="">Liên hệ</a></li>
                </ul>
            </div>

            <div class="body_page-main">
                <div class="body_page-main-address">
                    <h1>Tìm kiếm tại đây</h1>
                    <ul>
                        <li>
                            <span><i class="fa-solid fa-location-dot"></i></span>
                            <p>Địa chỉ: <br>
                                <a href="https://www.google.com/maps/@10.8826482,106.7824544,13z?hl=vi">Đông hòa, Dĩ An,
                                    Bình Dương</a></p>
                        </li>
                        <li>
                            <span><i class="fa-solid fa-envelope"></i></span>
                            <p>Email: <br>
                                <a href="mailto:vikhang17112002@gmail.com">vikhang17112002@gmail.com</a></p>
                        </li>
                        <li>
                            <span><i class="fa-solid fa-phone"></i></span>
                            <p>Điện thoại: <br>
                                <a href="tel:0943382248">0943382248</a></p>
                        </li>

                        <li>
                            <span><i class="fa-brands fa-facebook"></i></span>
                            <p>Fanpage: <br>
                                <a href="">GemStore</a></p>
                        </li>
                    </ul>
                </div>
                <div class="body_page-main-form">
                    <h1>Liên hệ chúng tôi</h1>
                    <ul>
                        <li>
                            <label for="">Họ và tên</label>
                            <input type="text" name="name">
                        </li>
                        <li>
                            <label for="">Email</label>
                            <input type="email" name="email">
                        </li>
                        <li>
                            <label for="">Số điện thoại</label>
                            <input type="text" name="phone">
                        </li>
                        <li>
                            <label for="">Tin nhắn</label>
                            <textarea name="message" id="" cols="30" rows="10"></textarea>
                        </li>

                        <li>
                            <input type="submit" value="Gửi tin nhắn">
                        </li>
                    </ul>
                </div>
            </div>
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15672.858378257437!2d106.7917617!3d10.8712764!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1667027947435!5m2!1svi!2s"
                width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>
            <div class="body_page-subscribe">

                <div class="body_page-subscribe-title">
                    <h1>Nhận thông tin mã giảm giá</h1>
                </div>

                <div class="body_page-subscribe-des">
                    <p>Đăng ký danh sách gửi thư GemStore để nhận thông tin cập nhật về hàng mới, ưu đãi đặc biệt và
                        thông tin giảm giá khác.</p>
                </div>

                <div class="body_page-subscribe-input">
                    <input type="text" placeholder="Theo dõi tin tức của chúng tôi">
                </div>

                <div class="body_page-subscribe-btn">
                    <button>Đăng ký</button>
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

</html>