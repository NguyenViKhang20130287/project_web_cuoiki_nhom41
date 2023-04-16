<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CategoryDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.*" %>
<%@ page import="java.util.*" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.GalleryDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CartDao" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/productdetails.css">
    <link rel="stylesheet" href="css/lightslider.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Chi Tiết Sản Phẩm</title>

    <style>

        .product-div-right .product_price {
            display: inline-block;
            margin-right: 10px;
        }

        .product-div-right .old_price {
            display: inline-block;
        }

        .stars a {
            display: inline-block;
            padding-right: 4px;
            text-decoration: none;
            margin: 0;
        }

        .stars a:after {
            position: relative;
            font-size: 18px;
            font-family: 'FontAwesome', serif;
            display: block;
            content: "\f005";
            color: #9e9e9e;
        }

        .stars span {
            font-size: 0;
            /* trick to remove inline-element's margin */
        }

        .stars a:hover ~ a:after {
            color: #9e9e9e !important;
        }

        span.active a.active ~ a:after {
            color: #9e9e9e;
        }

        span:hover a:after {
            color: #fe9727;
        }

        span.active a:after,
        .stars a.active:after {
            color: #fe9727;
        }

        .product_rating span i {
            color: #fe9727;
        }

    </style>

</head>

<body>
<% ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();%>
<%--header page--%>
<%@include file="header.jsp" %>
<!--banner-->
<div class="banner">
    <h1>Chi tiết sản phẩm</h1>
</div>
<!-- body page -->
<% Product product = (Product) request.getAttribute("product");
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
<% List<Review> reviewList = (List<Review>) request.getAttribute("reviewList");%>
<div class="body_page-menu">
    <ul>
        <li><a href="home">
            <i class="fa-solid fa-house"></i>
            Trang chủ</a>
        </li>
        <span><i class="fa-solid fa-chevron-right"></i></span>
        <% Category category = (Category) request.getAttribute("categoryByProductId");%>
        <li class="second"><a href="category?category_id=<%=category.getId()%>"><%=category.getName()%>
        </a></li>
        <span><i class="fa-solid fa-chevron-right"></i></span>
        <li><a href="product-detail?product_id=<%=product.getId()%>"><%=product.getTitle()%>
        </a></li>
    </ul>
</div>
<div class="product_details">
    <div class="product_detail-area">
        <div class="container">
            <div class="row">
                <div class="product-div-left col-xl-6 col-lg-6">
                    <div class="img_container">
                        <img src="<%=product.getThumbnail()%>" alt="">
                    </div>
                    <div class="hover_container">
                        <div class="img_container">
                            <img src="<%=product.getThumbnail()%>" alt="">
                        </div>
                        <% List<Gallery> galleryList = (List<Gallery>) request.getAttribute("galleryList");
                            for (Gallery gallery : galleryList) {%>
                        <div>
                            <img src="<%=gallery.getThumbnail()%>" alt="">
                        </div>
                        <%}%>
                    </div>
                </div>
                <div class="product-div-right col-xl-6 col-lg-6">
                    <span class="product_name mb_18"><%=product.getTitle()%></span>
                    <span class="product_price mb_18"><%=numberFormat.format(product.getDiscount())%></span>
                    <span class="old_price"
                          style="color: #6c6c6c; font-size: 18px;"><strike><%=numberFormat.format(product.getPrice())%></strike></span>
                    <div class="product_rating mb_18">
                        <% double avg = (double) request.getAttribute("avgStar");%>
                        <% int size = reviewList.size();%>
                        <% if (size == 0) {%>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg == 1) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg < 1 && avg < 2) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star-half-stroke"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg == 2) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg > 2 && avg < 3) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star-half-stroke"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg == 3) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg > 3 && avg < 4) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star-half-stroke"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg == 4) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-regular fa-star"></i></span>
                        <%} else if (avg > 4 && avg < 5) {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star-half-stroke"></i></span>
                        <%} else {%>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <%}%>
                        <span><b><%=avg%></b></span>
                        <span>(<%=reviewList.size()%> đánh giá)</span>
                    </div>
                    <% if (product.getDesign() != null) {%>
                    <span class="product_design mb_18">Thiết kế: <b><%=product.getDesign()%></b></span>
                    <%}%>
                    <%
                        if (product.getQuantity() > 0) {

                    %>
                    <span class="product_status mb_18">Tình trạng: <i>Còn hàng</i></span>
                    <% } else { %>
                    <span class="product_status mb_18">Tình trạng: <i>Hết hàng</i></span>
                    <% } %>
                    <div class="size_quantity">
                        <div class="quantity_wrapper">
                            <div style="margin-right: 15px; text-align: center">Số lượng</div>
                            <div class="wrapper">
                                <span class="button minus">-</span>
                                <input type="text" value="1" class="number">
                                <span class="button plus">+</span>
                            </div>
                        </div>
                        <div class="size_wrapper">
                            <% List<Variation> variationList = (List<Variation>) request.getAttribute("variationList");%>
                            <% for (Variation v : variationList) {%>
                            <% if (category.getId() == v.getCategory().getId()) {%>
                            <div style="margin-right: 15px"><%=v.getName()%>
                            </div>
                            <%}%>
                            <%}%>
                            <% for (Variation v : variationList) {%>
                            <%if (category.getId() == v.getCategory().getId()) {%>
                            <select class="select_size">
                                <option>-- Vui lòng chọn --</option>
                                <% List<VariationOption> variationOptionList = (List<VariationOption>) request.getAttribute("variationOptionList");
                                    for (VariationOption vo : variationOptionList) {%>
                                <option><%=vo.getValue()%>
                                </option>
                                <%}%>
                            </select>
                            <%}%>
                            <%}%>
                        </div>
                    </div>
                    <% for (Variation v : variationList) {%>
                    <%if (category.getId() == v.getCategory().getId()) {%>
                    <!-- Trigger/Open The Modal -->
                    <button id="myBtn" onclick="showDiv()"><span>Hướng dẫn chọn kích cỡ<i
                            class="fa-solid fa-chevron-right"></i></span>
                    </button>
                    <%}%>
                    <%}%>
                    <div class="btn-groups">
                        <button onclick="addtocart(<%=product.getId()%>)" <%=new CartDao().checkQuantity(String.valueOf(product.getId()))%>
                                type="button" class="add_cart_btn">
                            <i class="fa-solid fa-cart-shopping"></i>
                            thêm vào giỏ hàng
                        </button>
                        <button <%=new CartDao().checkQuantity(String.valueOf(product.getId()))%> id="buynow"
                                                                                                  type="button"
                                                                                                  class="buy_now_btn">
                            <i class="fa-solid fa-wallet"></i>
                            mua ngay
                        </button>
                        <script type="text/javascript">
                            document.getElementById("buynow").onclick = function () {
                                location.href = "/web_nhom41_war/BuyNowControl?idProduct=<%=product.getId()%>";
                            };
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--tab-->
    <div class="tabs_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="product_details-tab">
                        <!--tab items-->
                        <div class="tabs">
                            <ul class="nav-tabs">
                                <li class="active"><a href="#menu_1"><strong>Mô tả</strong></a></li>
                                <li><a href="#menu_2"><strong>Thông tin chi tiết</strong></a></li>
                                <li><a href="#menu_3"><strong>Đánh giá</strong></a></li>
                            </ul>
                        </div>
                        <!--tab contents-->
                        <div class="tab-content">
                            <div id="menu_1" class="tab-content-item">
                                <p>&emsp;&emsp;&emsp;<%=product.getDescription()%>
                                </p>
                            </div>
                            <div id="menu_2" class="tab-content-item">
                                <div class="table-wrapper">
                                    <table class="table-bordered">
                                        <tbody>
                                        <% List<String> metalList = new ArrayList<>();
                                            metalList.add("Vàng vàng");
                                            metalList.add("Vàng trắng");
                                            metalList.add("Vàng hồng");%>
                                        <tr>
                                            <td><b>Giá:</b></td>
                                            <td><%=numberFormat.format(product.getDiscount())%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Danh mục:</b></td>
                                            <td><%=category.getName()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Đá quý:</b></td>
                                            <td><%=product.getCategory().getName()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Màu kim loại:</b></td>
                                            <% for (String s : metalList) {%>
                                            <%if (product.getTitle().contains(s)) {%>
                                            <td><%=s%>
                                            </td>
                                            <%}%>
                                            <%}%>
                                        </tr>
                                        <tr>
                                            <td><b>Thiết kế:</b></td>
                                            <td><%=product.getDesign()%>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div id="menu_3" class="tab-content-item">
                                <div class="product_review_form">
                                    <% if (reviewList.size() == 0) {%>
                                    <div style="color: #7f8989; font-size: 18px;">Sản phẩm này chưa có đánh giá nào
                                    </div>
                                    <%}%>
                                    <ol class="comment_list">
                                        <% for (Review review : reviewList) {%>
                                        <li class="comment">
                                            <div class="comment_container">
                                                <div class="review_top">
                                                    <strong class="review_author"><%=review.getAccount().getUsername()%>
                                                    </strong>
                                                </div>
                                                <div class="review_mid">
                                                    <div class="star_rating">
                                                        <% if (review.getRating() == 1) {%>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <%} else if (review.getRating() == 2) {%>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <%} else if (review.getRating() == 3) {%>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <%} else if (review.getRating() == 4) {%>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-regular fa-star"></i></span>
                                                        <%} else {%>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <%}%>

                                                    </div>
                                                    <div class="description"><%=review.getMessage()%>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <%}%>
                                    </ol>
                                    <% if (session.getAttribute("Account") == null) {%>
                                    <a style="color: #bc8247; font-size: 18px;" href="login.jsp">Đăng nhập để gửi đánh
                                        giá của bạn</a>
                                    <%}%>
                                    <% if (session.getAttribute("Account") != null) {%>
                                    <form action="review?id=<%=product.getId()%>" method="post">
                                        <h2>Thêm nhận xét</h2>

                                        <div class="row">
                                            <div class="col-12" style="margin-top: 10px">
                                                <label for="review_comment">Nhận xét của bạn </label>
                                                <textarea name="comment" id="review_comment"></textarea>
                                                <div id="rating" class="star_rating" style="margin-bottom: 20px;">
                                                    <p class="stars">
                                                        <span>
                                                          <a class="star-1" href="javascript:void(0)">1</a>
                                                          <a class="star-2" href="javascript:void(0)">2</a>
                                                          <a class="star-3" href="javascript:void(0)">3</a>
                                                          <a class="star-4" href="javascript:void(0)">4</a>
                                                          <a class="star-5" href="javascript:void(0)">5</a>
                                                            <input type="hidden" name="hdrating" id="hdrating">
                                                        </span>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="submit">Gửi</button>
                                    </form>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--related_product-->
    <div class="related_products">
        <div class="title" style="margin-bottom: 30px">
            <h2 style="text-align: center">Sản phẩm liên quan</h2>
        </div>
        <div class="box container">
            <ul id="autoWidth" class="cs-hidden">
                <% List<Product> relatedList = (List<Product>) request.getAttribute("relatedList");%>
                <% for (Product r : relatedList) {%>
                <li class="item-a">
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="product-detail?product_id=<%=r.getId()%>"><img src="<%=r.getThumbnail()%>"
                                                                                    alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <a href=""><p><%=r.getTitle()%>
                            </p></a>
                            <span><%=numberFormat.format(r.getDiscount())%></span>
                        </div>
                        <div class="card-btn">
                            <button><a href="product-detail?product_id=<%=r.getId()%>">Chi tiết</a></button>
                            <button <%=new CartDao().checkQuantity(String.valueOf(r.getId()))%>
                                    onclick="addtocart(<%=r.getId()%>)">Thêm vào giỏ
                            </button>
                        </div>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</div>
<% if (product.getCategory().getParent_id() == category.getId()) {%>
<!-- The Modal -->
<div id="myModal" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2><strong>Bảng size nhẫn</strong></h2>
        <div style="margin: 15px 0"><img src="img/ring-size-chart.png" alt=""></div>
        <h2><strong>Cách đơn giản nhất để đo size nhẫn</strong></h2>
        <h3><strong>Đo bằng tờ giấy & thước</strong></h3>
        <p>Bước 1:&nbsp;Chuẩn bị một cây thước, 1 cây kéo, 1 cây bút &amp; một tờ giấy</p>
        <p>Bước 2:&nbsp;Cắt một mảnh giấy dài khoảng 10 cm và rộng 1 cm.</p>
        <p>Bước 3:&nbsp;Sử dụng đoạn giấy vừa cắt để quấn sát quanh ngón tay muốn đo.</p>
        <p>Bước 4:&nbsp;Đánh dấu điểm giao nhau.</p>
        <p>Bước 5:&nbsp;Tháo ra dùng thước đo chiều dài của đoạn giấy từ điểm đầu cho đến phần đánh dấu. Lấy kết quả đo
            được chia cho 3,14. Sau đó đối chiếu với&nbsp;Bảng size nhẫn.</p>
    </div>
</div>
<%}%>

<!--footer page-->
<%@include file="foooter.jsp" %>
</body>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/productdetail.js"></script>
<script src="js/lightslider.js"></script>
<script type="text/javascript">
    // Lấy ra số sao đánh giá
    $('.stars a').on('mouseover', function () {
        $('.stars span, .stars a').removeClass('active');
        $(this).addClass('active');
        $('.stars span').addClass('active');
        $("#hdrating").val($(this).text());
    });
</script>
</html>

