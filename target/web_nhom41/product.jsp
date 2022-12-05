<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CategoryDAO" %>
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
                    <li><a href="product.jsp"> Sản phẩm
                            <i class="fa-solid fa-chevron-down"></i>
                        </a>
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
                            <li><a href="login.jsp" style="font-weight: normal">Đăng nhập</a></li>
                            <li><a href="cart.html" style="font-weight: normal">Giỏ hàng</a></li>
                            <li><a href="about.html" style="font-weight: normal">Giới thiệu</a></li>
                        </ul>
                    </li>
                    <li><a href="contact.html">Liên hệ</a></li>
                </ul>

            </div>

            <!--  -->
            <div class="header_page-btns non-reponsive">
                <button type="button" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i>Tìm
                    kiếm
                </button>
                <button><a href="cart.html"><i class="fa-solid fa-bag-shopping"></i>Giỏ hàng(100)</a></button>
                <button><a href="login.jsp"><i class="fa-solid fa-user"></i>Tài khoản</a></button>
            </div>
            <!--  -->
            <div class="header_page-btns responsive">
                <div class="nav">
                    <button class="navbar"><i class="fa-solid fa-bars"></i></button>
                </div>

                <div class="right_btn">
                    <button type="button" class="search-btn"><i class="fa-solid fa-magnifying-glass"></i></button>
                    <button><a href="cart.html"><i class="fa-solid fa-bag-shopping"></i></a></button>
                    <button><a href="login.jsp"><i class="fa-solid fa-user"></i></a></button>
                </div>

                <div class="category_header-responsive">
                    <ul class="main-menu">
                        <li><a href="index.jsp">Trang chủ</a></li>
                        <li class="main-menu-list">
                            <div class="main-menu-title">
                                <a href="product.jsp">
                                    <h1>Sản phẩm</h1>
                                </a>
                                <i class="fa-solid fa-chevron-down"></i>
                            </div>
                            <!-- <a href="product.jsp"> Sản phẩm
                        <i class="fa-solid fa-chevron-down"></i>
                    </a> -->
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
                                    <!-- <li><a href=""></a>Đăng ký</li> -->
                                    <li><a href="login.jsp" style="font-weight: normal">Đăng nhập</a></li>
                                    <li><a href="cart.html" style="font-weight: normal">Giỏ hàng</a></li>
                                    <li><a href="about.html" style="font-weight: normal">Giới thiệu</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="contact.html">Liên hệ</a></li>
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
                <input type="text" placeholder="Tìm kiếm sản phẩm...">
                <i class="fa-solid fa-magnifying-glass"></i>
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
                                    <%  CategoryDAO dao = new CategoryDAO();
                                        List<Category> categoryList = (List<Category>) request.getAttribute("mainCategoryList");
                                    for (Category c : categoryList){%>
                                    <li class="list_item dropdown"><a href="CategoryControl?category_id=<%=c.getId()%>"><%= c.getName()%><i class="fa-solid fa-chevron-right"></i></a>
                                        <ul>
                                            <%  List<Category> subCategoryList = dao.getSubCategory(c.getId());
                                                for (Category sc : subCategoryList){%>
                                                    <li><a href="CategoryControl?category_id=<%=sc.getId()%>"><%=sc.getName()%></a></li>
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
                                    <input type="range" class="range-min" min="0" max="6000000" value="1200000" step="50000">
                                    <input type="range" class="range-max" min="0" max="6000000" value="3600000" step="50000">
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
                                            <a href=""><button type="button" class="color-1" title="Đen"></button></a>
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
                                        <li>
                                            <div class="featured_products-wrapper">
                                                <div class="featured_products-thumb">
                                                    <a href="productdetails.html">
                                                        <img src="img/main_products/bracelets/bracelet_ruby-2.jpeg" alt="">
                                                    </a>
                                                </div>
                                                <div class="featured_products-content">
                                                    <h5>
                                                        <a href="">Vòng đeo tay bằng Ruby và Kim cương 18K</a>
                                                    </h5>
                                                    <div class="price">
                                                        <span>3.169.000 đ</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="featured_products-wrapper">
                                                <div class="featured_products-thumb">
                                                    <a href="productdetails.html">
                                                        <img src="img/main_products/rings/ring_emerald-2.jpeg" alt="">
                                                    </a>
                                                </div>
                                                <div class="featured_products-content">
                                                    <h5>
                                                        <a href="">Nhẫn Ngọc lục bảo và Kim cương 14K</a>
                                                    </h5>
                                                    <div class="price">
                                                        <span>5.090.000 đ</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="featured_products-wrapper">
                                                <div class="featured_products-thumb">
                                                    <a href="productdetails.html">
                                                        <img src="img/main_products/necklaces/necklace_sapphire-1.jpeg" alt="">
                                                    </a>
                                                </div>
                                                <div class="featured_products-content">
                                                    <h5>
                                                        <a href="">Vòng cổ Sapphire và Kim cương 18K</a>
                                                    </h5>
                                                    <div class="price">
                                                        <span>1.088.000 đ</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
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
                                <select>
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
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_ruby-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_emerald-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_sapphire-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_aquamarine-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_garnet-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_amethyst-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_quartz-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_tanzanite-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_ruby-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_pearl-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_quartz-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_ruby-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-2" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_amethyst-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_aquamarine-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_emerald-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_amethyst-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_aquamarine-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_pearl-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_amethyst-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_amethyst-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_garnet-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-3" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_garnet-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_sapphire-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_aquamarine-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_aquamarine-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_pearl-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_ruby-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_emerald-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_sapphire-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_sapphire-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-4" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_amethyst-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_morganite-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_diamond-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_morganite-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_pearl-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_ruby-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_emerald-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_pearl-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_aquamarine-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_sapphire-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-5" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_diamond-4.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_morganite-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_ruby-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_diamond-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_amethyst-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_sapphire-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_emerald-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_aquamarine-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_multi-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_ruby&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_ruby-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-6" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_sapphire&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_aquamarine-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_garnet&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_sapphire-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_emerald-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_garnet-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_garnet-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_garnet-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_tanzanite-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_sapphire&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_pearl-4.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_pearl-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-7" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_tanzanite-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_diamond-4.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_tanzanite&diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_ruby-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_pearl-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_morganite-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_multi-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_diamond-4.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_sapphire-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_pearl&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_emerald-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_sapphire-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-8" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_diamond-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_garnet-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_sapphire&diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_pearl-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_tanzanite-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_pearl-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_ruby-4.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_amethyst-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_diamond-4.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_sapphire&diamond-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_emerald-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-9" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_garnet-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_ruby-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_morganite&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_diamond-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_ruby-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_sapphire-4.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_multi-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_sapphire-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_emerald-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_ruby&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_sapphire&diamond-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_tanzanite-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content-item fade active show" id="pills-grid-10" role="tabpanel"
                                 aria-labelledby="pills-grid">
                                <div class="row ">
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_tanzanite-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng đeo tay bằng Ruby và Kim cương 18K</p>
                                                <span>3.169.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_sapphire-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc lục bảo và Kim cương 14K</p>
                                                <span>5.090.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_tanzanite&diamond-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng cổ Sapphire và Kim cương 18K</p>
                                                <span>1.088.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_ruby-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền Aquamarine và Kim cương 14K</p>
                                                <span>1.129.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_tanzanite-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai đính đá Anthill Garnet Châu Phi 18K</p>
                                                <span>829.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_pearl-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Bông tai Thạch anh tím và kim cương Siberia Vàng trắng</p>
                                                <span>2.970.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_pearl-5.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Hoa Mẫu Đơn</p>
                                                <span>1.784.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/bracelets/bracelet_amethyst-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Tanzanite và Kim cương Vàng trắng 14K</p>
                                                <span>1.180.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/rings/ring_garnet-1.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Mặt dây chuyền trái tim Ruby và Vàng 14K</p>
                                                <span>1.713.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/pendants/pendant_diamond-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Nhẫn Ngọc trai nước ngọt và Kim cương 14k</p>
                                                <span>2.285.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/necklaces/necklace_garnet-2.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Vòng Tay Thạch Anh Ưu Linh Trắng 8mm Mix Bạc</p>
                                                <span>1.734.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                                        <div class="body_page-trending-product-list-card">
                                            <div class="card-image">
                                                <a href="productdetails.html"><img src="img/main_products/earrings/earring_tanzanite-3.jpeg" alt=""></a>
                                            </div>
                                            <div class="card-title-price">
                                                <p>Hoa tai Ruby và Kim cương Vàng 18K</p>
                                                <span>2.484.000 đ</span>
                                            </div>
                                            <div class="card-btn">
                                                <button><a href="productdetails.html">Chi tiết</a></button>
                                                <button>Thêm vào giỏ</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="pagenav">
                            <nav class="clearfix relative nav_pagi w_100">
                                <ul class="pagination clearfix">
                                    <li class="page-item"><a class="page-link" href=""><i class="fa-solid fa-chevron-left"></i></a></li>
                                    <li class="active page-item"><a class="page-link" href="#pills-grid-1"><span>1</span></a></li></li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-2"><span>2</span></a></li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-3"><span>3</span></a></li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-4"><span>4</span></a></li>
                                    <li class="page-item "><a class="page-link" href="#pills-grid-5"><span>5</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link" href="#pills-grid-6"><span>6</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link" href="#pills-grid-7"><span>7</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link" href="#pills-grid-8"><span>8</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link" href="#pills-grid-9"><span>9</span></a></li>
                                    <li class="page-item  hidden-sm"><a class="page-link" href="#pills-grid-10"><span>10</span></a></li>
                                    <li class="page-item"><a class="page-link" href=""><i class="fa-solid fa-chevron-right"></i></a></li>
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