<%@ page import="java.util.Objects" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CategoryDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<head>
    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/home.css">
    <title>Shop Bán Ngọc Quý</title>

    <%-- css box login--%>
    <style>

        .header_page-btns.non-reponsive {
            display: flex;
            justify-content: space-between;
        }

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

<% ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
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
                            <li><a href="login.jsp" style="font-weight: normal">Tài khoản</a></li>
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
                <button type="button" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i>Tìm
                    kiếm
                </button>
                <% HashMap<Integer, CartItem> listCart = (HashMap<Integer, CartItem>) session.getAttribute("cart"); %>
                <button id="cartQuantity"><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i>Giỏ hàng(<%=listCart != null ? listCart.size() : 0 %>)</a></button>

                <% if (session.getAttribute("Account") != null) {%>
                <% if ((Objects.equals(session.getAttribute("role"), "0"))) { %>
                <div id="box-admin">
                    <button><%= session.getAttribute("username") %></button>
                    <ul id="box-admin-menu">
                        <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li>
                        <li><a href="admin/doc/index-admin.jsp"><i class="fa-solid fa-user-gear"></i>Quản lý website</a>
                        </li>
                    </ul>
                </div>
                <% } else if((Objects.equals(session.getAttribute("role"), "1"))) { %>
                <div id="box-admin">
                    <button><%= session.getAttribute("username") %></button>
                    <ul id="box-admin-menu">
                        <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li>
                    </ul>
                </div>
<%--                <button><%= session.getAttribute("username") %></button>--%>
<%--                <ul id="box-admin-menu">--%>
<%--                    <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li>--%>
<%--                </ul>--%>
                <% } %>
                <% } %>

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

    <!-- body page -->
    <div class="body_page_container">
        <div class="body_page">

            <div class="body_page-slides">
                <div class="body_page-slides-card">
                    <a href=""><img src="img/Slider/product_1.jpg" alt=""></a>
                    <a href=""><img src="img/Slider/product_2.jpg" alt=""></a>
                    <a href=""><img src="img/Slider/product_3.jpg" alt=""></a>
                </div>
                <div class="body_page-slides-card-btns">
                    <div class="body_page-slides-card-list-btn">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="body_page-popular-product">
                <div class="body_page-popular-product-card">
                    <a href=""><img src="img/banner/banner-1.jpg" alt=""></a>
                    <button><a href="product">Khám phá ngay</a></button>
                </div>
                <div class="body_page-popular-product-card">
                    <a href=""><img src="img/banner/banner-2.jpg" alt=""></a>
                    <button><a href="product">Khám phá ngay</a></button>
                </div>
                <div class="body_page-popular-product-card">
                    <a href=""><img src="img/banner/banner-3.jpg" alt=""></a>
                    <button><a href="product">Khám phá ngay</a></button>
                </div>
            </div>

            <div class="body_page-trending-product">

                <div class="body_page-trending-product-title">
                    <p>Sản phẩm</p>
                </div>
                <div class="body_page-trending-product-des">
                    <p>Những sản phẩm mới nhất hiện tại</p>
                </div>
                <div class="body_page-trending-product-list">
                    <% List<Product> productList = (List<Product>) request.getAttribute("productList");
                        for (Product p : productList) {%>
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="product-detail?product_id=<%=p.getId()%>"><img src="<%=p.getThumbnail()%>"
                                                                                    alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p style="font-size: 14px; margin-bottom: 5px;"><%=p.getTitle()%>
                            </p>
                            <span style="font-size: 15px"><%=numberFormat.format(p.getDiscount())%></span>
                            <span style="margin-left: 10px; color: #6c6c6c; font-size: 15px"><strike><%=numberFormat.format(p.getPrice())%></strike></span>
                        </div>
                        <div class="card-btn">
                            <button><a href="product-detail?product_id=<%=p.getId()%>">Chi tiết</a></button>
                            <button onclick="addtocart(<%=p.getId()%>)">Thêm vào giỏ</button>
                        </div>
                    </div>
                    <%}%>
                </div>

                <div class="body_page-trending-product-seeMoreBtn">
                    <button><a href="product">Xem thêm</a></button>
                </div>

            </div>

            <div class="body_page-sub-product">
                <div class="body_page-trending-product-title">
                    <p>Vật phẩm phong thủy</p>
                </div>
                <div class="body_page-trending-product-des">
                    <p>Những sản phẩm mới nhất hiện tại</p>
                </div>

                <div class="body_page-trending-product-list">

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s1.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Nhẫn Bạc Hồ Ly Thạch Anh Tóc Vàng</p>
                            <span>2,400,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s2.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Dần</p>
                            <span>540,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s3.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Dậu</p>
                            <span>540,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s4.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Hợi</p>
                            <span>450,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s5.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Mùi</p>
                            <span>540,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                </div>

                <div class="body_page-trending-product-seeMoreBtn">
                    <button><a href="">Xem thêm</a></button>
                </div>

            </div>

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
    </div>


    <!-- footer page -->
    <div class="footer_container">
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


</div>
</body>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/home.js"></script>


</html>