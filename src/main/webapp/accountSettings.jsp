<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Account" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/14/2023
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Shop Bán Ngọc Quý</title>

    <style>
        html a:hover {
            text-decoration: none !important;
        }

        .header_page {
            background-color: #E4E4E4;
            width: 100%;
        }

        .header_page-main {
            width: 80%;
            margin: 0 auto;
            background-color: #E4E4E4;
        }

        .header_page-category-main-menu {
            margin-bottom: 0;
        }

        .sticky {
            width: 100%;
            background: #fff;
        }

        /*.banner{*/
        /*    width: 100%;*/
        /*    height: 530px;*/
        /*    background-image: url("../img/product_page/product_banner.jpg") ;*/
        /*    background-repeat: no-repeat;*/
        /*    background-size: cover;*/
        /*    object-fit: contain;*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*    align-items: center;*/
        /*}*/
        .body_page-menu {
            padding: 15px;
            background: #b2bec3;
        }

        .body_page-menu ul {
            width: 80%;
            margin: 0 auto;
            display: flex;
        }

        .body_page-menu ul li {
            margin-right: 10px;
        }

        .body_page-menu span {
            margin-right: 10px;
        }

        .body_page-menu ul li:first-child:hover a {
            color: #bc8247;
        }

        .body_page-menu ul li a {
            color: #000;
            transition: all 0.2s;
        }

        .body_page-menu ul li a i {
            margin-right: 3px;
            font-size: 14px;
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

        .shadow {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
        }

        .profile-tab-nav {
            min-width: 250px;
        }

        .tab-content {
            flex: 1;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .nav-pills a.nav-link {
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
            border-radius: 0;
            color: #333;
        }

        .nav-pills a.nav-link i {
            width: 20px;
        }

        .img-circle img {
            height: 100px;
            width: 100px;
            border-radius: 100%;
            border: 5px solid #fff;
        }


    </style>

</head>
<% HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
    Account accSession = (Account) session.getAttribute("Account");

    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>
<body onload="validateForm()">
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
                            <li><a href="purchase.jsp" style="font-weight: normal">Đơn mua</a></li>
                            <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý website</a></li>

                            <% } else if ((Objects.equals(session.getAttribute("role"), "1"))) { %>
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
                                <li><a href="purchase.jsp" style="font-weight: normal">Đơn mua</a></li>
                                <li><a href="admin/doc/index-admin.jsp" style="font-weight: normal">Quản lý website</a>
                                </li>

                                <% } else if ((Objects.equals(session.getAttribute("role"), "1"))) { %>
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
<!--banner-->
<div class="banner">
    <h1>Thông tin cá nhân</h1>
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
            <li><a href="">Thông tin cá nhân</a></li>
        </ul>
    </div>
    <section class="py-5 my-5">
        <div class="container">
            <div class="bg-white shadow rounded-lg d-block d-sm-flex">
                <div class="profile-tab-nav border-right">
                    <div class="p-4">
                        <% if (session.getAttribute("Account") != null) { %>
                        <h4 class="text-center"><%=session.getAttribute("full_name") != null ? session.getAttribute("full_name") : session.getAttribute("fullName")%>
                        </h4>
                        <% } else if (session.getAttribute("Account") == null) { %>
                        <% response.sendRedirect("../../home"); %>
                        <% } %>
                        <h4 class="text-center"></h4>
                    </div>
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab"
                           aria-controls="account" aria-selected="true">
                            <i class="fa fa-home text-center mr-1"></i>
                            Tài khoản
                        </a>
                        <a class="nav-link" id="password-tab" data-toggle="pill" href="#password" role="tab"
                           aria-controls="password" aria-selected="false">
                            <i class="fa fa-key text-center mr-1"></i>
                            Mật khẩu
                        </a>
                    </div>
                </div>
                <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="account" role="tabpanel"
                         aria-labelledby="account-tab">
                        <h3 class="mb-4">Cài đặt tài khoản</h3>
                        <form id="information-form" action="/web_nhom41_war/AccountSettingControl" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Họ tên</label>
                                        <input id="name" name="full_name" type="text" class="form-control"
                                               onchange="validateForm()"
                                               value="<%=session.getAttribute("full_name")!=null?session.getAttribute("full_name"):session.getAttribute("fullName")%>">
                                        <input type="hidden" name="currentName" id="currentName"
                                               value="<%=session.getAttribute("full_name")!=null?session.getAttribute("full_name"):session.getAttribute("fullName")%>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input id="email" name="email_update" type="text" class="form-control"
                                               onchange="validateForm()"
                                               value="<%=session.getAttribute("email_update")!=null?session.getAttribute("email_update"):session.getAttribute("email")%>">
                                        <input type="hidden" name="currentEmail" id="currentEmail"
                                               value="<%=session.getAttribute("email_update")!=null?session.getAttribute("email_update"):session.getAttribute("email")%>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                        <input id="phone_number" name="phone_number" type="text" class="form-control"
                                               onchange="validateForm()"
                                               value="<%=session.getAttribute("phone_number")!=null?session.getAttribute("phone_number"):session.getAttribute("phoneNumber")%>">
                                        <input type="hidden" name="currentPhoneNumber" id="currentPhoneNumber"
                                               value="<%=session.getAttribute("phone_number")!=null?session.getAttribute("phone_number"):session.getAttribute("phoneNumber")%>">
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button id="updateBtn" type="submit" class="btn btn-primary">Cập nhật</button>
                                <button id="cancelBtn" class="btn btn-light">Hủy</button>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                        <h3 class="mb-4">Cài đặt mặt khẩu</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Mật khẩu cũ</label>
                                    <input type="password" class="form-control" name="old_password">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Mật khẩu mới</label>
                                    <input type="password" class="form-control" name="new_password">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Xác nhận mật khẩu mới</label>
                                    <input type="password" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-primary">Cập nhật</button>
                            <button class="btn btn-light">Hủy</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function validateForm() {
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var phone_number = document.getElementById("phone_number").value;
        var currentName = document.getElementById("currentName").value;
        var currentEmail = document.getElementById("currentEmail").value;
        var currentPhoneNumber = document.getElementById("currentPhoneNumber").value;
        if (name === "" || email === "" || phone_number === "" || (name === currentName && email === currentEmail && phone_number === currentPhoneNumber)) {
            document.getElementById("updateBtn").disabled = true;
            document.getElementById("cancelBtn").disabled = true;
        } else {
            document.getElementById("updateBtn").disabled = false;
            document.getElementById("cancelBtn").disabled = false;
        }
    }

    var cancelBtn = document.getElementById("cancelBtn");
    var informationForm = document.getElementById("information-form");
    cancelBtn.addEventListener("click", function () {
        informationForm.reset();
    });


</script>
</body>
</html>
