<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <link rel="stylesheet" href="css/cart.css">
    <title>Shop Bán Ngọc Quý</title>

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
<% Map<Integer, CartItem> cartList = (Map<Integer, CartItem>) session.getAttribute("cart");
    if (cartList == null) {
        cartList = new HashMap<>();
    }
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
                    <button id="cartQuantity"><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i>Giỏ
                        hàng(<%=listCart != null ? listCart.size() : 0 %>)</a></button>

                    <% if (session.getAttribute("Account") != null) {%>
                    <% if ((Objects.equals(session.getAttribute("role"), "0"))) { %>
                    <div id="box-admin">
                        <button><%=session.getAttribute("username")%>
                        </button>
                        <ul id="box-admin-menu">
                            <li><a href="LogoutControl"><i class="fa-solid fa-right-from-bracket"></i>Đăng xuất</a></li>
                            <li><a href="admin/doc/index-admin.jsp"><i class="fa-solid fa-user-gear"></i>Quản lý website</a>
                            </li>
                        </ul>
                    </div>
                    <% } else if ((Objects.equals(session.getAttribute("role"), "1"))) { %>
                    <div id="box-admin">
                        <button><%=session.getAttribute("username")%>
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
    <h1>Giỏ hàng</h1>
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
            <li><a href="">Giỏ hàng</a></li>
        </ul>
    </div>

    <div class="table_main">

        <table class="table table-responsive">

            <thead>
            <tr>
                <th class="product-thumbnail">Hình ảnh</th>
                <th class="product-name">Tên sản phẩm</th>
                <th class="product-price">Giá</th>
                <th class="product-quantity">Số lượng</th>
                <th class="product-total">Tổng</th>
                <th class="product-remove">Xóa sản phẩm</th>
                <!-- <i class="fa-solid fa-xmark"></i> -->
            </tr>
            </thead>

            <!-- content -->
            <tbody id="productContainer">

            <!-- product -->
            <% int num = 0;
                int totalCart = 0;
                for (Map.Entry<Integer, CartItem> entry : cartList.entrySet()) {
                    int total = 0;
                    if (entry.getValue().getProduct().getDiscount() != 0) {

                        total = entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity();
                        num += total;
                    } else {
                        total = entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity();
                        num += total;
                    }
                    totalCart = num;

            %>
            <tr>
                <th class="product-thumbnail">
                    <a href="product-detail?product_id=<%=entry.getValue().getProduct().getId()%>">
                        <img src="<%=entry.getValue().getProduct().getThumbnail()%>" alt="">
                    </a>
                </th>
                <th class="product-name">
                    <a href="product-detail?product_id=<%=entry.getValue().getProduct().getId()%>">
                        <%=entry.getValue().getProduct().getTitle()%>
                    </a>
                </th>
                <th class="product-price">
                        <span>
                    <%=(entry.getValue().getProduct().getDiscount() != 0) ? numberFormat.format(entry.getValue().getProduct().getDiscount()) :
                            numberFormat.format(entry.getValue().getProduct().getPrice())
                    %></span>
                </th>
                <th class="product-quantity">
                    <div class="cart-plus-minus">
                        <button class="dec qtybutton" id="dec"
                                onclick="quantity(this.id,<%=entry.getKey()%>)">-
                        </button>
                        <input id="quantity" type="text" value="<%=entry.getValue().getQuantity()%>">
                        <button class="inc qtybutton" id="inc"
                                onclick="quantity(this.id,<%=entry.getKey()%>)">+
                        </button>
                    </div>
                </th>
                <th class="product-total" id="product-total">

                        <span> <%=(entry.getValue().getProduct().getDiscount() != 0) ? numberFormat.format(entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity()) :
                                numberFormat.format(entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity())
                        %></span>
                </th>
                <th class="product-remove">
                    <%--                    <button><a href="/web_nhom41_war/DeleteProductControl?productId=<%=entry.getKey()%>"><i--%>
                    <%--                            class="fa-solid fa-trash"></i></a>--%>
                    <%--                    </button>--%>
                    <button onclick="DeleteItem(<%=entry.getKey()%>)"><i class="fa-solid fa-trash"></i>
                    </button>
                </th>
            </tr>
            <% } %>


            </tbody>

        </table>

        <div class="table table-non-responsive">

            <ul id="productContainer2">
                <% for (Map.Entry<Integer, CartItem> entry : cartList.entrySet()) {

                %>
                <li class="list_card">
                    <div class="card_img">
                        <img src="<%=entry.getValue().getProduct().getThumbnail()%>" alt="">
                    </div>
                    <div class="card_infor">
                        <a href="product-detail?product_id=<%=entry.getValue().getProduct().getId()%>"
                           class="title"><%=entry.getValue().getProduct().getTitle()%>
                        </a><br>

                        <span class="price">
                                <%=(entry.getValue().getProduct().getDiscount() != 0) ? numberFormat.format(entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity()) :
                                        numberFormat.format(entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity())
                                %></span>
                        <div class="product-quantity">
                            <button id="dec1" onclick="quantity(this.id,<%=entry.getKey()%>)">-
                            </button>
                            <input type="text" value="<%=entry.getValue().getQuantity()%>">
                            <button id="inc1" onclick="quantity(this.id,<%=entry.getKey()%>)">+
                            </button>
                        </div>
                    </div>
                    <div class="deleteProduct">
                        <%--                        <button class="deleteProductBtn"><a--%>
                        <%--                                href="/web_nhom41_war/DeleteProductControl?productId=<%=entry.getKey()%>"><i--%>
                        <%--                                class="fa-solid fa-trash"></i></a></button>--%>
                        <button onclick="DeleteItem(<%=entry.getKey()%>)"><i class="fa-solid fa-trash"></i>
                        </button>
                    </div>
                </li>
                <% } %>

            </ul>

        </div>

    </div>

    <div class="coupon_clear">
        <div class="couponCode">
            <input type="text" placeholder="Mã giảm giá">
            <button>OK</button>
        </div>

        <div class="clearCart">
            <button class="refresh" style="margin-right: 10px;"><a href="cart.jsp">Cập nhật giỏ hàng</a>
            </button>
            <button onclick="DeleteAllItem()" style="margin-left: 10px;">Xóa tất cả</button>
        </div>
    </div>

    <div class="body_page-footer">
        <div class="empty_page"></div>
        <div class="CartTotals" id="CartTotalsID">
            <h2>Tổng tiền</h2>
            <ul id="totalOrder">
                <li>
                    <span class="title">Tạm tính</span>
                    <span class="price"><%=numberFormat.format(totalCart)%></span>
                </li>
                <li>
                    <span class="title">Giảm giá</span>
                    <span class="price">0 đ</span>
                </li>
                <li>
                    <span class="title">Tổng</span>
                    <span class="price"><%=numberFormat.format(totalCart)%></span>
                </li>
            </ul>
            <button class="totals_btns"><a href="checkout.jsp">Thanh toán</a></button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/main.js"></script>
<script src="js/cart.js"></script>
</html>