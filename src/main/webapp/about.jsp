<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/about.css">
    <title>Giới thiệu</title>

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

                            <% if (session.getAttribute("Account") != null) { %>
                            <% if (Objects.equals(session.getAttribute("role"), "0")) { %>
                            <li><a href="LogoutControl" style="font-weight: normal">Đăng xuất</a></li>
                            <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                            <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                            <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý website</a></li>
                            <% }
                            } %>
                            <% if ((session.getAttribute("Account") == null) ||
                                    (Objects.equals(session.getAttribute("role"), "1"))) { %>
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
                    <button><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i>Giỏ
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
    <h1>Giới thiệu</h1>
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
            <li><a href="">Giới thiệu</a></li>
        </ul>
    </div>
    <div class="body_page-main">
        <div class="welcome_container">
            <div class="left_container">
                <h1>Chào mừng tới với GemStore!</h1>
                <p>GemStore là địa chỉ uy tín, tin cậy để khách hàng có thể an tâm chọn lựa được những viên đá
                    quý thật
                    mà đảm bảo 100% về tiêu chuẩn. Ngọc Gems luôn tâm niệm: Sản phẩm phải xuất phát từ tâm.
                    Không chỉ là người kinh doanh, chúng tôi còn là những người yêu thích và sưu tầm đá quý.

                    Từ những viên đá thô ráp, lẫn tạp chất đất mùn, qua các công đoạn chế tác thành vòng tay,
                    khuyên tai, nhẫn, mặt dây những sản phẩm về đá quý được đưa vào sử dụng rộng rãi. Hiểu được
                    điều đó Ngọc chế tác những viên đá thành trang sức sao cho phù hợp nhất với từng đối tượng
                    khách hàng. <br>
                    Không chỉ phát triển thị trường trong nước, thương hiệu của cô nàng sinh năm 1995 đang từng
                    ngày sải bước trên thương trường quốc tế.

                    Thừa hưởng nền tảng vững chắc, Ngọc sớm tiếp xúc, gặp gỡ với khách hàng nước ngoài rất
                    nhiều, và đưa thương hiệu Ngọc Gems đến các nước như Ấn Độ, Hồng Kông, Thái Lan, Trung
                    Quốc.... Năm nào Ngọc Gems cũng tham dự Hội chợ Đá quý thế giới tại Thái Lan. Tại đây, Ngọc
                    được trao đổi, học hỏi và làm việc với các đối tác nước ngoài, đưa những ý tưởng về dòng sản
                    phẩm của mình và đối tác rất thích thú với cách phát triển dự án của một cô gái trẻ trung,
                    năng động, vốn kiến thức rộng.
                </p>
                <button id="view"><a href="home">Tới cửa hàng</a></button>
            </div>
            <div class="right_container">
                <img src="img/about_page/about_pic.jpg" alt="">
            </div>
        </div>
        <div class="counter_container">
            <div class="counter">
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>2170</h2>
                        <p>KHÁCH HÀNG HÀI LÒNG</p>
                    </div>
                </div>
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count2.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>8080</h2>
                        <p>GIẢI THƯỞNG</p>
                    </div>
                </div>
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count3.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>2150</h2>
                        <p>SỐ GIỜ LÀM VIỆC</p>
                    </div>
                </div>
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count4.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>2170</h2>
                        <p>DỰ ÁN ĐÃ HOÀN THIỆN</p>
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

</html>