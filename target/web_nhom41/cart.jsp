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
</head>

<body>
<% Map<Integer, CartItem> cartList = (Map<Integer, CartItem>) session.getAttribute("cart");
    if (cartList == null) {
        cartList = new HashMap<>();
    }
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>
<%--header page--%>
<%@include file="header.jsp" %>

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
            <button class="totals_btns"><a href="/web_nhom41_war/CheckoutButtonControl">Thanh toán</a></button>
        </div>
    </div>


</div>

<!-- footer page -->
<%@include file="foooter.jsp" %>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"
        integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="js/main.js"></script>
<script src="js/cart.js"></script>
</html>