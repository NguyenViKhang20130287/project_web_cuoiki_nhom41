<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CategoryDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CartDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Sản Phẩm</title>

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

        .list_item.active, .list_item ul li.active {
            background-color: #bc8247;
            border-radius: 5px;
            border-color: #bc8247;
            color: #fff;
            display: block;
        }

        .list_item.active a:hover, .list_item ul li.active a:hover {
            color: #fff;
        }

        .field input {
            height: 35px;
        }

        .currency {
            position: absolute;
            bottom: calc(100% - 8px);
            left: 4px;
            padding: 1px;
            background: #fff;
            color: #494949;
            letter-spacing: .03em;
            font-size: 14px;
            line-height: 16px;
        }

        .slider .progress {
            left: 0%;
            right: 0%;
        }

    </style>

</head>
<body>
<% ProductDAO productDAO = new ProductDAO();
    CategoryDAO dao = new CategoryDAO();
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
<% List<Category> categoryList = (List<Category>) request.getAttribute("mainCategoryList");%>
<div id="product_page">
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
                                <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a>
                                </li>
                                <li><a href="admin/doc/index-admin.jsp"><i class="fa-solid fa-user-gear"></i>Quản lý
                                    website</a>
                                </li>
                            </ul>
                        </div>
                        <% } else if ((Objects.equals(session.getAttribute("role"), "1"))) { %>
                        <div id="box-admin">
                            <button><%= session.getAttribute("username") %>
                            </button>
                            <ul id="box-admin-menu">
                                <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a>
                                </li>
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
                                    <li><a href="category?category_id=6" style="font-weight: normal">Mặt dây chuyền</a>
                                    </li>
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
                                    <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý
                                        website</a>
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
                <input oninput="searchByName(this)" name="keyword" type="text" placeholder="Tìm kiếm sản phẩm...">
                <i class="fa-solid fa-magnifying-glass"></i>
            </div>
        </div>
        <div class="hide-modal-search"></div>

    </div>
    <!--banner-->
    <div class="banner">
        <h1>Sản phẩm</h1>
    </div>
    <div class="body_page-menu">
        <ul>
            <li><a href="home">
                <i class="fa-solid fa-house"></i>
                Trang chủ</a>
            </li>
            <span><i class="fa-solid fa-chevron-right"></i></span>
            <li><a href="">Sản phẩm</a></li>
        </ul>
    </div>
    <% List<Product> productList = (List<Product>) request.getAttribute("productList");%>
    <!--Product Categories-->
    <section class="product_categories">
        <div class="container">
            <div class="row">
                <!--Sidebar-->
                <div class="col-xl-3 col-lg-3 col-md-4">
                    <div class="product_sidebar">
                        <div class="sidebar_widget mb_55">
                            <div class="sidebar_widget-title">
                                <h3>Danh mục sản phẩm</h3>
                            </div>
                            <div class="sidebar_widget-content">
                                <ul>
                                    <% for (Category c : categoryList) {%>
                                    <li class="list_item dropdown"><a
                                            href="category?category_id=<%=c.getId()%>"><%= c.getName()%><i
                                            class="fa-solid fa-chevron-right"></i></a>
                                        <ul>
                                            <% List<Category> subCategoryList = dao.getSubCategory(c.getId());
                                                for (Category sc : subCategoryList) {%>
                                            <li><a href="category?category_id=<%=sc.getId()%>"><%=sc.getName()%>
                                            </a></li>
                                            <%}%>
                                        </ul>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>

                        </div>
                        <div class="sidebar_widget mb_55">
                            <div class="sidebar_widget-title">
                                <h3>Lọc theo giá</h3>
                            </div>
                            <div class="sidebar_widget-content">
                                <div class="slider">
                                    <div class="progress"></div>
                                </div>
                                <% DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                                <% Product maxPrice = Collections.max(productList);
                                    Product minPrice = Collections.min(productList); %>
                                <div class="range-input">
                                    <input type="range" class="range-min" min="<%=minPrice.getDiscount()%>"
                                           max="<%=maxPrice.getDiscount()%>"
                                           value="<%=minPrice.getDiscount()%>"
                                           step="100000">
                                    <input type="range" class="range-max" min="<%=minPrice.getDiscount()%>"
                                           max="<%=maxPrice.getDiscount()%>"
                                           value="<%=maxPrice.getDiscount()%>"
                                           step="100000">
                                </div>
                                <div class="price-input">
                                    <div class="field">
                                        <span style="margin-right: 5px;">Giá: </span>
                                        <div style="position: relative">
                                            <input type="text" class="input-min"
                                                   value="<%=minPrice.getDiscount()%>">
                                            <span class="currency">đ</span>
                                        </div>
                                        <span class="separator">-</span>
                                        <input type="text" class="input-max" value="<%=maxPrice.getDiscount()%>">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="sidebar_widget mb_55">
                            <div class="sidebar_widget-title">
                                <h3>Màu đá quý</h3>
                            </div>
                            <div class="sidebar_widget-content">
                                <div class="color_pick">
                                    <ul>
                                        <% List<ColorAdmin> colorList = (List<ColorAdmin>) request.getAttribute("colorList");%>
                                        <% for (int i = 0; i < colorList.size(); i++) {%>
                                        <li>
                                            <a href="gem_color?color_id=<%=colorList.get(i).getIdColor()%>">
                                                <button type="button" class="color-<%=i+1%>"
                                                        title="<%=colorList.get(i).getNameColor()%>"></button>
                                            </a>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="sidebar_widget mb_55">
                            <div class="sidebar_widget-title">
                                <h3>Sản phẩm nổi bật</h3>
                            </div>
                            <div class="sidebar_widget-content">
                                <div class="featured_products">
                                    <ul>
                                        <% List<Product> featuredList = (List<Product>) request.getAttribute("featuredList");
                                            for (Product f : featuredList) {%>
                                        <li>
                                            <div class="featured_products-wrapper">
                                                <div class="featured_products-thumb">
                                                    <a href="product-detail?product_id=<%=f.getId()%>">
                                                        <img src="<%=f.getThumbnail()%>"
                                                             alt="">
                                                    </a>
                                                </div>
                                                <div class="featured_products-content">
                                                    <h5>
                                                        <a href="product-detail?product_id=<%=f.getId()%>"><%=f.getTitle()%>
                                                        </a>
                                                    </h5>
                                                    <div class="price">
                                                        <span><%=numberFormat.format(f.getDiscount())%></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Products List-->
                <div class="col-xl-9 col-lg-9 col-md-8">
                    <div class="product_content-area">
                        <div class="product_header">
                            <div class="product_header-left" style="font-size: 20px">Tất cả các sản phẩm</div>
                            <div class="product_header-right">
                                <i class="fa fa-sort" style="color: #a3a3a3" aria-hidden="true"></i>
                                <span>Sắp xếp:</span>
                                <select id="mySelect" name="sortBy" onchange="sort(this)">
                                    <option value="default">Mặc định</option>
                                    <option value="atoz">A &rarr; Z</option>
                                    <option value="ztoa">Z &rarr; A</option>
                                    <option value="increase">Giá tăng dần</option>
                                    <option value="descrease">Giá giảm dần</option>
                                    <option value="newest">Hàng mới nhất</option>
                                    <option value="oldest">Hàng cũ nhất</option>
                                </select>
                            </div>
                        </div>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-content-item fade active show" id="pills-grid-1" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row " id="products">
                                    <% for (Product p : productList) {%>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="product-detail?product_id=<%=p.getId()%>"><img
                                                        src="<%=p.getThumbnail()%>"
                                                        alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p><%=p.getTitle()%>
                                                </p>
                                                <span><%=numberFormat.format(p.getDiscount())%></span>
                                                <span style="margin-left: 10px; color: #6c6c6c"><strike><%=numberFormat.format(p.getPrice())%></strike></span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="product-detail?product_id=<%=p.getId()%>">Chi tiết</a>
                                                </button>
                                                <%--                                                <form class="addToCart" action="addtocart" method="get">--%>
                                                <%--                                                    <input type="hidden" value="<%=p.getId()%>"--%>
                                                <%--                                                           name="inputId">--%>
                                                <%--                                                    <button type="submit" onclick="">Thêm vào giỏ</button>--%>
                                                <%--                                                </form>--%>
                                                <button onclick="addtocart(<%=p.getId()%>)" <%=new CartDao().checkQuantity(String.valueOf(p.getId()))%>>
                                                    Thêm vào giỏ
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <div class="pagenav">
                            <nav class="clearfix relative nav_pagi w_100">
                                <ul class="pagination clearfix">
                                    <% int endPage = (int) request.getAttribute("endP");%>
                                    <% int tag = (int) request.getAttribute("tag");%>
                                    <% if (tag > 1) {%>
                                    <li class="page-item"><a class="page-link" href="product?index=<%=tag-1%>"><i
                                            class="fa-solid fa-chevron-left"></i></a></li>
                                    <%}%>
                                    <% for (int i = 1; i <= endPage; i++) {%>
                                    <li class="page-item <%if(tag==i){%>active<%}else{%><%}%>"><a class="page-link"
                                                                                                  href="product?index=<%=i%>"><%=i%>
                                    </a></li>
                                    <%}%>
                                    <% if (tag < endPage) {%>
                                    <li class="page-item"><a class="page-link" href="product?index=<%=tag+1%>"><i
                                            class="fa-solid fa-chevron-right"></i></a></li>
                                    <%}%>
                                </ul>
                            </nav>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--footer page-->
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
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/product.js"></script>
</html>
