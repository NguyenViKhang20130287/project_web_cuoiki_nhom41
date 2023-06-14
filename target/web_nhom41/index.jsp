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
<%@ page import="vn.edu.hcmuaf.fit.dao.CartDao" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Banner" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.AdminDAO" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

        .body_page-trending-product-seeMoreBtn button {
            font-weight: bold;
            color: #bc8247;
            font-size: 14px;
            transition: all .3s ease;
        }

        .body_page-trending-product-seeMoreBtn button:hover {
            color: #fff;
        }

    </style>

</head>

<body>

<% ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
<%--header page--%>
<%@include file="header.jsp" %>

<!-- body page -->
<div class="body_page_container">
    <div class="body_page">

        <div class="body_page-slides">
            <div class="body_page-slides-card">
                <% List<Banner> listBanner = (List<Banner>) request.getAttribute("listBanner");
                    for (Banner b : listBanner) {
                %>
                <a href=""><img src="<%=b.getImage()%>" alt=""></a>
                <%}%>
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
            <div id="content" class="body_page-trending-product-list">
                <% List<Product> productList = (List<Product>) request.getAttribute("productList");
                    for (Product p : productList) {%>
                <div class="product body_page-trending-product-list-card">
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
                        <button  <%=new CartDao().checkQuantity(String.valueOf(p.getId()))%>
                                onclick="addtocart(<%=p.getId()%>)">Thêm vào giỏ
                        </button>
                    </div>
                </div>
                <%}%>
            </div>
            <div class="body_page-trending-product-seeMoreBtn">
                <button onclick="loadMore()">Xem thêm</button>
            </div>
        </div>

        <div class="body_page-sub-product">
            <div class="body_page-trending-product-title">
                <p>Sản phẩm phổ biến</p>
            </div>
            <div class="body_page-trending-product-des">
                <p>Những sản phẩm bán chạy nhất hiện tại</p>
            </div>

            <div class="body_page-trending-product-list">
                <% List<Product> list = new AdminDAO().getTop5();
                    for (Product p : list) {
                %>
                <div class="body_page-trending-product-list-card">
                    <div class="card-image">
                        <a href="product-detail?product_id=<%=p.getId()%>"><img src="<%=p.getThumbnail()%>"
                                                                                alt=""></a>
                    </div>
                    <div class="card-title-price">
                        <p><%= p.getTitle() %>
                        </p>
                        <span style="font-size: 15px"><%=numberFormat.format(p.getDiscount())%></span>
                        <span style="margin-left: 10px; color: #6c6c6c; font-size: 15px"><strike><%=numberFormat.format(p.getPrice())%></strike></span>
                    </div>
                    <div class="card-btn">
                        <button><a href="product-detail?product_id=<%=p.getId()%>">Chi tiết</a></button>
                        <button  <%=new CartDao().checkQuantity(String.valueOf(p.getId()))%>
                                onclick="addtocart(<%=p.getId()%>)">Thêm vào giỏ
                        </button>
                    </div>
                </div>

                <% } %>

            </div>

            <div class="body_page-trending-product-seeMoreBtn">
                <button><a href="product?category_id=0">Xem thêm</a></button>
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
<%@include file="foooter.jsp" %>


</body>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/home.js"></script>
<script type="text/javascript">
    function loadMore() {
        var amount = document.getElementsByClassName("product").length;
        $.ajax({
            url: "/web_nhom41_war/load",
            type: "get",
            data: {
                exist: amount
            },
            success: function (data) {
                var row = document.getElementById("content");
                row.innerHTML += data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }
</script>

</html>

