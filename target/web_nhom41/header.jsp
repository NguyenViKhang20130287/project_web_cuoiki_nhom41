<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/16/2023
  Time: 5:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .header_page-btns.non-reponsive {
            /*display: flex;*/
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
                            <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                            <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                            <li><a href="purchase.jsp" style="font-weight: normal">Đơn mua</a></li>
                            <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý website</a></li>

                            <% } else if ((Objects.equals(session.getAttribute("role"), "3"))) { %>
                            <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                            <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                            <li><a href="purchase.jsp" style="font-weight: normal">Đơn mua</a></li>
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
                            <li><a href="admin/doc/index-admin.jsp"><i class="fa-solid fa-user-gear"></i>Quản lý website</a>
                            <li><a href="accountSettings.jsp"><i class="fa-solid fa-user"></i></i>Thông tin</a></li>
                            <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li>
                            </li>
                        </ul>
                    </div>
                    <% } else if ((Objects.equals(session.getAttribute("role"), "3"))) { %>
                    <div id="box-admin">
                        <button><%= session.getAttribute("isSocial").equals(0)?session.getAttribute("username"):session.getAttribute("fullName") %>
                        </button>
                        <ul id="box-admin-menu">
                            <li><a href="accountSettings.jsp"><i class="fa-solid fa-user"></i>Thông tin</a></li>
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
                                <li><a href="purchase.jsp" style="font-weight: normal">Đơn mua</a></li>
                                <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý website</a>
                                </li>

                                <% } else if ((Objects.equals(session.getAttribute("role"), "3"))) { %>
                                <li><a href="LogoutControl" style="font-weight: normal">Đăng xuất</a></li>
                                <li><a href="cart.jsp" style="font-weight: normal">Giỏ hàng</a></li>
                                <li><a href="about.jsp" style="font-weight: normal">Giới thiệu</a></li>
                                <li><a href="purchase.jsp" style="font-weight: normal">Đơn mua</a></li>
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
</body>
</html>
