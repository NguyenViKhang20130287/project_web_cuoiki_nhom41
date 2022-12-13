<%@ page import="java.util.Objects" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CategoryDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.*" %>
<%@ page import="java.util.ArrayList" %>
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
</head>

<body>
<% ProductDAO productDAO = new ProductDAO();
    CategoryDAO categoryDAO = new CategoryDAO();%>
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
                        <li><a href="admin/doc/index-admin.html" style="font-weight: normal">Quản lý website</a></li>
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
    <h1>Chi tiết sản phẩm</h1>
</div>
<!-- body page -->
<% Product product = (Product) request.getAttribute("product");
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
<div class="body_page-menu">
    <ul>
        <li><a href="index.jsp">
            <i class="fa-solid fa-house"></i>
            Trang chủ</a>
        </li>
        <span><i class="fa-solid fa-chevron-right"></i></span>
        <% Category category = (Category) request.getAttribute("categoryByProductId");%>
        <li class="second"><a href=""><%=category.getName()%>
        </a></li>
        <span><i class="fa-solid fa-chevron-right"></i></span>
        <li><a href=""><%=product.getTitle()%>
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
                    <span style="color: #6c6c6c; font-size: 18px;"><strike><%=numberFormat.format(product.getPrice())%></strike></span>
                    <div class="product_rating mb_18">
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star"></i></span>
                        <span><i class="fa-solid fa-star-half-stroke"></i></span>
                        <span>(2 đánh giá)</span>
                    </div>
                    <% if (product.getDesign() != null) {%>
                    <span class="product_design mb_18">Thiết kế: <b><%=product.getDesign()%></b></span>
                    <%}%>
                    <span class="product_status mb_18">Tình trạng: <i>Còn hàng</i></span>
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
                            <% List<Variation> variationList = (List<Variation>) request.getAttribute("variationList");
                                for (Variation v : variationList) {%>
                            <% if (category.getId() == 2) {%>
                            <div style="margin-right: 15px"><%=v.getName()%>
                            </div>
                            <%}%>
                            <%}%>
                            <%if (category.getId() == 2) {%>
                            <select class="select_size">
                                <option>-- Vui lòng chọn --</option>
                                <% List<VariationOption> variationOptionList = (List<VariationOption>) request.getAttribute("variationOptionList");
                                    for (VariationOption vo : variationOptionList) {%>
                                <option><%=vo.getValue()%>
                                </option>
                                <%}%>
                            </select>
                            <%}%>
                        </div>
                    </div>
                    <%if (category.getId() == 2) {%>
                    <!-- Trigger/Open The Modal -->
                    <button id="myBtn"><span>Hướng dẫn chọn kích cỡ<i class="fa-solid fa-chevron-right"></i></span>
                    </button>
                    <%}%>
                    <div class="btn-groups">
                        <button type="button" class="add_cart_btn">
                            <i class="fa-solid fa-cart-shopping"></i>
                            thêm vào giỏ hàng
                        </button>
                        <button type="button" class="buy_now_btn">
                            <i class="fa-solid fa-wallet"></i>
                            mua ngay
                        </button>
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
                                    <ol class="comment_list">
                                        <li class="comment">
                                            <div class="comment_container">
                                                <div class="review_top">
                                                    <strong class="review_author">Hoàng Thị Bích Ngọc</strong>
                                                </div>
                                                <div class="review_mid">
                                                    <div class="star_rating">
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star-half-stroke"></i></span>
                                                    </div>
                                                    <div class="description">Giao siêu nhanh, đặt hôm trước hôm sau
                                                        có. Sản phẩm giống ảnh.
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="comment">
                                            <div class="comment_container">
                                                <div class="review_top">
                                                    <strong class="review_author">Nguyễn Văn Hoàng</strong>
                                                </div>
                                                <div class="review_mid">
                                                    <div class="star_rating">
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                        <span><i class="fa-solid fa-star"></i></span>
                                                    </div>
                                                    <div class="description">Đóng gói cẩn thận. Shop giao hàng
                                                        nhanh. Sẽ tiếp tục ủng hộ!
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ol>
                                    <form action="#">
                                        <h2>Thêm nhận xét</h2>

                                        <div class="row">
                                            <div class="col-12">
                                                <label for="review_comment">Nhận xét của bạn </label>
                                                <div class="star_rating" style="margin-bottom: 20px;">
                                                    <span><a href=""><i class="fa-regular fa-star"></i></a></span>
                                                    <span><a href=""><i class="fa-regular fa-star"></i></a></span>
                                                    <span><a href=""><i class="fa-regular fa-star"></i></a></span>
                                                    <span><a href=""><i class="fa-regular fa-star"></i></a></span>
                                                    <span><a href=""><i class="fa-regular fa-star"></i></a></span>
                                                </div>
                                                <textarea name="comment" id="review_comment"></textarea>
                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="author">Tên </label>
                                                <input id="author" type="text">

                                            </div>
                                            <div class="col-lg-6 col-md-6">
                                                <label for="email">Email </label>
                                                <input id="email" type="text">
                                            </div>
                                        </div>
                                        <button type="submit">Gửi</button>
                                    </form>
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
                <li class="item-a">
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/bracelets/bracelet_ruby-2.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <a href=""><p>Vòng đeo tay bằng Ruby và Kim cương 18K</p></a>
                            <span>3.169.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>
                </li>
                <li class="item-b">
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/earrings/earring_amethyst-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <a href="productdetails.jsp"><p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                            </a>
                            <span>2.970.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>
                </li>
                <li class="item-c">
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/bracelets/bracelet_quartz-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <a href="productdetails.jsp"><p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu
                                Đơn</p></a>
                            <span>1.784.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>
                </li>
                <li class="item-d">
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/rings/ring_tanzanite-2.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <a href="productdetails.jsp"><p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p></a>
                            <span>1.180.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>
                </li>
                <li class="item-e">
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/pendants/pendant_ruby-2.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <a href="productdetails.jsp"><p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p></a>
                            <span>1.713.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>
                </li>
                <li class="item-f">
                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/rings/ring_pearl-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <a href="productdetails.jsp"><p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p></a>
                            <span>2.285.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<%if (category.getId() == 2) {%>
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
</body>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script src="js/productdetail.js"></script>
<script src="js/lightslider.js"></script>

</html>