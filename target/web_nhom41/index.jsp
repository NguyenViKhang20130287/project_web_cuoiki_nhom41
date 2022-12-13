<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.ProductInCart" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<head>
    <meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/home.css">
    <title>Shop Bán Ngọc Quý</title>
</head>

<body>
<div class="main_page">

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
                <% HashMap<Integer, ProductInCart> listCart = (HashMap<Integer, ProductInCart>) session.getAttribute("cart"); %>
                <button><a href="cart.jsp"><i class="fa-solid fa-bag-shopping"></i>Giỏ hàng(<%=listCart != null ? listCart.size() : 0 %>)</a></button>

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

    <!-- body page -->
    <div class="body_page_container">
        <div class="body_page">

            <div class="body_page-slides">
                <div class="body_page-slides-card">
                    <a href=""><img src="img/Slider/product_1.jpg" alt=""></a>
                    <a href=""><img src="img/Slider/product_2.jpg" alt=""></a>
                    <a href=""><img src="img/Slider/product_3.jpg" alt=""></a>
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
                    <button><a href="product.jsp">Khám phá ngay</a></button>
                </div>
                <div class="body_page-popular-product-card">
                    <a href=""><img src="img/banner/banner-2.jpg" alt=""></a>
                    <button><a href="product.jsp">Khám phá ngay</a></button>
                </div>
                <div class="body_page-popular-product-card">
                    <a href=""><img src="img/banner/banner-3.jpg" alt=""></a>
                    <button><a href="product.jsp">Khám phá ngay</a></button>
                </div>
            </div>

            <div class="body_page-trending-product">

                <div class="body_page-trending-product-title">
                    <p>Sản phẩm</p>
                </div>
                <div class="body_page-trending-product-des">
                    <p>Những sản phẩm mới nhất hiện tại</p>
                </div>
                <div class="body_page-trending-product-list">

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/bracelets/bracelet_ruby-2.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                            <span>3.169.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/rings/ring_emerald-2.jpeg" alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                            <span>5.090.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img
                                    src="img/main_products/necklaces/necklace_sapphire-1.jpeg" alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Vòng cổ Sapphire và Kim cương 18K</p>
                            <span>1.088.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img
                                    src="img/main_products/pendants/pendant_aquamarine-1.jpeg" alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                            <span>1.129.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/earrings/earring_garnet-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                            <span>829.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/earrings/earring_amethyst-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                            <span>2.970.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/bracelets/bracelet_quartz-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                            <span>1.784.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/rings/ring_tanzanite-2.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                            <span>1.180.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/pendants/pendant_ruby-2.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                            <span>1.713.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/rings/ring_pearl-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                            <span>2.285.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/bracelets/bracelet_quartz-2.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                            <span>1.734.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/earrings/earring_ruby-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                            <span>2.484.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img
                                    src="img/main_products/bracelets/bracelet_amethyst-1.jpeg" alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Vòng tay thạch anh tím Siberia 14K</p>
                            <span>5.035.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img
                                    src="img/main_products/earrings/earring_aquamarine-1.jpeg" alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Hoa tai Aquamarine và Kim cương 14K</p>
                            <span>3.265.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <a href="productdetails.jsp"><img src="img/main_products/necklaces/necklace_emerald-1.jpeg"
                                                              alt=""></a>
                        </div>
                        <div class="card-title-price">
                            <p>Vòng cổ Ngọc lục bảo và Kim cương 14K</p>
                            <span>1.394.000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="productdetails.jsp">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                </div>

                <div class="body_page-trending-product-seeMoreBtn">
                    <button><a href="product.jsp">Xem thêm</a></button>
                </div>

            </div>

            <div class="body_page-sub-product">
                <div class="body_page-trending-product-title">
                    <p>Vật phẩm phong thủy</p>
                </div>
                <div class="body_page-trending-product-des">
                    <p>Những sản phẩm mới nhất hiện tại</p>
                </div>

                <div class="body_page-trending-product-list">

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s1.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Nhẫn Bạc Hồ Ly Thạch Anh Tóc Vàng</p>
                            <span>2,400,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s2.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Dần</p>
                            <span>540,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s3.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Dậu</p>
                            <span>540,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s4.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Hợi</p>
                            <span>450,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                    <div class="body_page-trending-product-list-card">
                        <div class="card-image">
                            <img src="img/sub_products/s5.jpg" alt="">
                        </div>
                        <div class="card-title-price">
                            <p>Móc khóa 12 con giáp cẩm thạch – Tuổi Mùi</p>
                            <span>540,000 đ</span>
                        </div>
                        <div class="card-btn">
                            <button><a href="#">Chi tiết</a></button>
                            <button>Thêm vào giỏ</button>
                        </div>
                    </div>

                </div>

                <div class="body_page-trending-product-seeMoreBtn">
                    <button><a href="">Xem thêm</a></button>
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
    <div class="footer_container">
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


</div>
</body>
<script src="js/main.js"></script>
<script src="js/home.js"></script>

</html>