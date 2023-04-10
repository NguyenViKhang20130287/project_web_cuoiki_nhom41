<%--
  Created by IntelliJ IDEA.
  User: Khanh
  Date: 3/31/2023
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.PurchaseDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.OrderUser" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Account" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/purchase.css">
    <title>Đơn hàng của bạn</title>
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
<%
    PurchaseDAO purchaseDAO = new PurchaseDAO();
    Account accSession = (Account) session.getAttribute("Account");
    String username = "";
    if (accSession != null) {
        username = accSession.getUsername();
    }
    int userId = purchaseDAO.getUserID(username);
    List<OrderUser> listAll = purchaseDAO.getDataPurchase(userId);
    List<OrderUser> listToPay = purchaseDAO.getListStatus(userId, 1);
    List<OrderUser> listToReceive = purchaseDAO.getListStatus(userId, 2);
    List<OrderUser> listComplete = purchaseDAO.getListStatus(userId, 3);
    List<OrderUser> listCancel = purchaseDAO.getListStatus(userId, 4);
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>
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
    <h1>Đơn hàng của bạn</h1>
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
            <li><a href="">Đơn hàng của bạn</a></li>
        </ul>
    </div>
    <div class="body_page-main">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#all">Tất cả(<%=listAll.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#toPay">Chờ thanh toán(<%=listToPay.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#toReceive">Đang giao hàng(<%=listToReceive.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#completed">Hoàn thành(<%=listComplete.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#cancelled">Đã hủy(<%=listCancel.size()%>)</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane container active" id="all">
                <%
                    if (listAll.size() != 0) {
                        for (int i = 0; i < listAll.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p class="status"><%=new PurchaseDAO().getmessage(listAll.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listAll.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listAll.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listAll.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listAll.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listAll.get(i).getListItem().get(j).getId()%>">
                                <p><%=listAll.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listAll.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><% if (listAll.get(i).getListItem().get(j).getDiscount() != 0) {%>
                                <s class="price"><%=numberFormat.format(listAll.get(i).getListItem().get(j).getPrice()) %></s>
                                <% }%>
                                <p class="itemDiscount"> <%=listAll.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listAll.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listAll.get(i).getListItem().get(j).getPrice())%></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listAll.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listAll.get(i).getId()%>">Xem thêm</a>
                        </button>
                        <% if (purchaseDAO.getOrderStatusId(listAll.get(i).getId()) <= 2) {%>
                        <button><a href="">Hủy đơn hàng</a></button>
                        <%}%>
                    </div>
                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>
            </div>
            <div class="tab-pane container fade" id="toPay">
                <%
                    if (listToPay.size() != 0) {
                        for (int i = 0; i < listToPay.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p class="status"><%=new PurchaseDAO().getmessage(listToPay.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listToPay.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listToPay.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listToPay.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listToPay.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listToPay.get(i).getListItem().get(j).getId()%>">
                                <p><%=listToPay.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listToPay.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listToPay.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToPay.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listToPay.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToPay.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listToPay.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listToPay.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listToPay.get(i).getId()%>">Xem thêm</a>
                        </button>
                        <button><a href="">Hủy đơn hàng</a></button>
                    </div>
                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>
            </div>
            <div class="tab-pane container fade" id="toReceive">
                <%
                    if (listToReceive.size() != 0) {
                        for (int i = 0; i < listToReceive.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p
                                class="status"><%=new PurchaseDAO().getmessage(listToReceive.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listToReceive.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listToReceive.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listToReceive.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listToReceive.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listToReceive.get(i).getListItem().get(j).getId()%>">
                                <p><%=listToReceive.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listToReceive.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listToReceive.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToReceive.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listToReceive.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToReceive.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listToReceive.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listToReceive.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listToReceive.get(i).getId()%>">Xem thêm</a>
                        </button>
                        <button><a href="">Hủy đơn hàng</a></button>
                    </div>

                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>

            </div>
            <div class="tab-pane container fade" id="completed">
                <%--                đã hoàn thành--%>
                <%
                    if (listComplete.size() != 0) {
                        for (int i = 0; i < listComplete.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p
                                class="status"><%=new PurchaseDAO().getmessage(listComplete.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listComplete.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listComplete.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listComplete.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listComplete.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listComplete.get(i).getListItem().get(j).getId()%>">
                                <p><%=listComplete.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listComplete.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listComplete.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listComplete.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listComplete.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listComplete.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listComplete.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listComplete.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listComplete.get(i).getId()%>">Xem thêm</a>
                        </button>
                    </div>

                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>

            </div>
            <div class="tab-pane container fade" id="cancelled">
                <%--                đơn đã hủy--%>
                <%
                    if (listCancel.size() != 0) {
                        for (int i = 0; i < listCancel.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p
                                class="status"><%=new PurchaseDAO().getmessage(listCancel.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listCancel.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listCancel.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listCancel.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listCancel.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listCancel.get(i).getListItem().get(j).getId()%>">
                                <p><%=listCancel.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listCancel.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listCancel.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listCancel.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listCancel.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listCancel.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listCancel.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listCancel.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listCancel.get(i).getId()%>">Xem thêm</a>
                        </button>
                    </div>

                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>

            </div>
        </div>

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
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
