<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CategoryDAO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Product" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
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
</head>
<body>
<% ProductDAO productDAO = new ProductDAO();
    CategoryDAO dao = new CategoryDAO();
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
<div id="product_page">
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
                            <li><a href="admin/doc/index-admin.html" style="font-weight: normal">Quản lý website</a>
                            </li>
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
                <form action="search" method="post" class="site-block-top-search">
                    <input name="keyword" type="text" placeholder="Tìm kiếm sản phẩm...">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </form>
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
            <li><a href="index.jsp">
                <i class="fa-solid fa-house"></i>
                Trang chủ</a>
            </li>
            <span><i class="fa-solid fa-chevron-right"></i></span>
            <li><a href="">Sản phẩm</a></li>
        </ul>
    </div>
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
                                    <% List<Category> categoryList = (List<Category>) request.getAttribute("mainCategoryList");
                                        for (Category c : categoryList) {%>
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
                                <div class="range-input">
                                    <input type="range" class="range-min" min="0" max="6000000" value="1200000"
                                           step="50000">
                                    <input type="range" class="range-max" min="0" max="6000000" value="3600000"
                                           step="50000">
                                </div>
                                <div class="price-input">
                                    <div class="field">
                                        <span style="margin-right: 5px;">Giá: </span>
                                        <input type="text" class="input-min" value="1200000">
                                        <span class="separator">-</span>
                                        <input type="text" class="input-max" value="3600000">
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
                                        <li>
                                            <a href="">
                                                <button type="button" class="color-1" title="Đen"></button>
                                            </a>
                                        </li>
                                        <li>
                                            <button type="button" class="color-2" title="Xanh da trời"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-3" title="Nâu"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-4" title="Màu Gold"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-5" title="Xanh lá"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-6" title="Nhiều màu"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-7" title="Cam"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-8" title="Hồng"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-9" title="Tím"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-10" title="Đỏ"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-11" title="Trắng"></button>
                                        </li>
                                        <li>
                                            <button type="button" class="color-12" title="Vàng"></button>
                                        </li>
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
                                <select name="sortBy">
                                    <option>Mặc định</option>
                                    <option>A &rarr; Z</option>
                                    <option>Z &rarr; A</option>
                                    <option>Giá tăng dần</option>
                                    <option>Giá giảm dần</option>
                                    <option>Hàng mới nhất</option>
                                    <option>Hàng cũ nhất</option>
                                </select>
                            </div>
                        </div>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-content-item fade active show" id="pills-grid-1" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <% List<Product> productList = (List<Product>) request.getAttribute("productList");
                                        for (Product p : productList) {%>
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
                                                <button><a href="product-detail?product_id=<%=p.getId()%>">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
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
                                    <li class="page-item"><a class="page-link" href=""><i
                                            class="fa-solid fa-chevron-left"></i></a></li>
                                    <li class="active page-item"><a class="page-link"
                                                                    href="#pills-grid-1"><span>1</span></a></li>
                                    </li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-2"><span>2</span></a>
                                    </li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-3"><span>3</span></a>
                                    </li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-4"><span>4</span></a>
                                    </li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-5"><span>5</span></a>
                                    </li>
                                    <li class="page-item  hidden-sm"><a class="page-link"
                                                                        href="#pills-grid-6"><span>6</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link"
                                                                        href="#pills-grid-7"><span>7</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link"
                                                                        href="#pills-grid-8"><span>8</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link"
                                                                        href="#pills-grid-9"><span>9</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link"
                                                                        href="#pills-grid-10"><span>10</span></a></li>
                                    <li class="page-item"><a class="page-link" href=""><i
                                            class="fa-solid fa-chevron-right"></i></a></li>
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