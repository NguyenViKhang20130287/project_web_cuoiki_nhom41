<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CategoryDAO" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.*" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.CartDao" %>
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

    <style>

        .list_item.active, .list_item ul li.active {
            background-color: #bc8247;
            border-radius: 5px;
            border-color: #bc8247;
            color: #fff;
            display: block;
        }

        .list_item.active a:hover, .list_item ul li.active a:hover {
            color: #fff;
        }

        .field input {
            height: 35px;
        }

        .currency {
            position: absolute;
            bottom: calc(100% - 8px);
            left: 4px;
            padding: 1px;
            background: #fff;
            color: #494949;
            letter-spacing: .03em;
            font-size: 14px;
            line-height: 16px;
        }

        .slider .progress {
            left: 0%;
            right: 0%;
        }

        /*.page-item:first-child {*/
        /*    display: none;*/
        /*}*/

        /*.page-item:last-child {*/
        /*    display: block;*/
        /*}*/

        .hidden {
            display: none;
        }

    </style>

</head>
<body>
<% ProductDAO productDAO = new ProductDAO();
    CategoryDAO dao = new CategoryDAO();
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
<% List<Category> categoryList = (List<Category>) request.getAttribute("mainCategoryList");%>
<%--header page--%>
<%@include file="header.jsp" %>
<!--banner-->
<div class="banner">
    <h1>Sản phẩm</h1>
</div>
<div class="body_page-menu">
    <ul>
        <li><a href="home">
            <i class="fa-solid fa-house"></i>
            Trang chủ</a>
        </li>
        <span><i class="fa-solid fa-chevron-right"></i></span>
        <li><a href="">Sản phẩm</a></li>
    </ul>
</div>
<% List<Product> productList = (List<Product>) request.getAttribute("productList");%>
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
                                <% for (Category c : categoryList) {%>
                                <li class="list_item dropdown"><a
                                        href="category?category_id=<%=c.getId()%>"><%= c.getName()%><i
                                        class="fa-solid fa-chevron-right"></i></a>
                                    <ul>
                                        <% List<Category> subCategoryList = dao.getSubCategory(c.getId());
                                            for (Category sc : subCategoryList) {%>
                                        <li><a href="category?category_id=<%=sc.getId()%>"><%=sc.getName()%>
                                        </a></li>
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
                            <% DecimalFormat formatter = new DecimalFormat("###,###,###");%>
                            <% Product maxPrice = Collections.max(productList);
                                Product minPrice = Collections.min(productList); %>
                            <div class="range-input">
                                <input type="range" class="range-min" min="<%=minPrice.getDiscount()%>"
                                       max="<%=maxPrice.getDiscount()%>"
                                       value="<%=minPrice.getDiscount()%>"
                                       step="100000">
                                <input type="range" class="range-max" min="<%=minPrice.getDiscount()%>"
                                       max="<%=maxPrice.getDiscount()%>"
                                       value="<%=maxPrice.getDiscount()%>"
                                       step="100000">
                            </div>
                            <div class="price-input">
                                <div class="field">
                                    <span style="margin-right: 5px;">Giá: </span>
                                    <div style="position: relative">
                                        <input type="text" class="input-min"
                                               value="<%=minPrice.getDiscount()%>">
                                        <span class="currency">đ</span>
                                    </div>
                                    <span class="separator">-</span>
                                    <input type="text" class="input-max" value="<%=maxPrice.getDiscount()%>">
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
                                    <% List<ColorAdmin> colorList = (List<ColorAdmin>) request.getAttribute("colorList");%>
                                    <% for (int i = 0; i < colorList.size(); i++) {%>
                                    <li>
                                        <a href="gem_color?color_id=<%=colorList.get(i).getIdColor()%>">
                                            <button type="button" class="color-<%=i+1%>"
                                                    title="<%=colorList.get(i).getNameColor()%>"></button>
                                        </a>
                                    </li>
                                    <%}%>
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
                                    <% List<Product> featuredList = (List<Product>) request.getAttribute("featuredList");
                                        for (Product f : featuredList) {%>
                                    <li>
                                        <div class="featured_products-wrapper">
                                            <div class="featured_products-thumb">
                                                <a href="product-detail?product_id=<%=f.getId()%>">
                                                    <img src="<%=f.getThumbnail()%>"
                                                         alt="">
                                                </a>
                                            </div>
                                            <div class="featured_products-content">
                                                <h5>
                                                    <a href="product-detail?product_id=<%=f.getId()%>"><%=f.getTitle()%>
                                                    </a>
                                                </h5>
                                                <div class="price">
                                                    <span><%=numberFormat.format(f.getDiscount())%></span>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
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
                            <select id="mySelect" name="sortBy" onchange="sort(this)">
                                <option value="default">Mặc định</option>
                                <option value="atoz">A &rarr; Z</option>
                                <option value="ztoa">Z &rarr; A</option>
                                <option value="increase">Giá tăng dần</option>
                                <option value="descrease">Giá giảm dần</option>
                                <option value="newest">Hàng mới nhất</option>
                                <option value="oldest">Hàng cũ nhất</option>
                            </select>
                        </div>
                    </div>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-content-item fade active show" id="pills-grid-1" role="tabpanel"
                             aria-labelledby="pills-grid">
                            <div class="row " id="products">
                                <%--                                <% for (Product p : productList) {%>--%>
                                <%--                                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">--%>
                                <%--                                    <div class="body_page-trending-product-list-card">--%>
                                <%--                                        <div class="card-image">--%>
                                <%--                                            <a href="product-detail?product_id=<%=p.getId()%>"><img--%>
                                <%--                                                    src="<%=p.getThumbnail()%>"--%>
                                <%--                                                    alt=""></a>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="card-title-price">--%>
                                <%--                                            <p><%=p.getTitle()%>--%>
                                <%--                                            </p>--%>
                                <%--                                            <span><%=numberFormat.format(p.getDiscount())%></span>--%>
                                <%--                                            <span style="margin-left: 10px; color: #6c6c6c"><strike><%=numberFormat.format(p.getPrice())%></strike></span>--%>
                                <%--                                        </div>--%>
                                <%--                                        <div class="card-btn">--%>
                                <%--                                            <button><a href="product-detail?product_id=<%=p.getId()%>">Chi tiết</a>--%>
                                <%--                                            </button>--%>
                                <%--                                            &lt;%&ndash;                                                <form class="addToCart" action="addtocart" method="get">&ndash;%&gt;--%>
                                <%--                                            &lt;%&ndash;                                                    <input type="hidden" value="<%=p.getId()%>"&ndash;%&gt;--%>
                                <%--                                            &lt;%&ndash;                                                           name="inputId">&ndash;%&gt;--%>
                                <%--                                            &lt;%&ndash;                                                    <button type="submit" onclick="">Thêm vào giỏ</button>&ndash;%&gt;--%>
                                <%--                                            &lt;%&ndash;                                                </form>&ndash;%&gt;--%>
                                <%--                                            <button onclick="addtocart(<%=p.getId()%>)" <%=new CartDao().checkQuantity(String.valueOf(p.getId()))%>>--%>
                                <%--                                                Thêm vào giỏ--%>
                                <%--                                            </button>--%>
                                <%--                                        </div>--%>
                                <%--                                    </div>--%>
                                <%--                                </div>--%>
                                <%--                                <%}%>--%>
                            </div>
                        </div>
                    </div>
                    <div class="pagenav" id="pagenav">
                        <nav class="clearfix relative nav_pagi w_100">
                            <ul class="pagination clearfix">
                            </ul>
                        </nav>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--footer page-->
<%@include file="foooter.jsp" %>
</body>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script>
    var pageActive = 0
    var pageTotal = 0
    const render = () => {
        console.log(arrProduct)
        var pageActive = 0
        pageTotal = Math.floor(arrProduct.length / 12)
        if (arrProduct.length % 12 != 0) {
            pageTotal++;
        }
        console.log(pageActive, pageTotal)

        let rs = ``
        arrProduct.map((tmp) => {
            let dis = tmp.discount.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            })
            let price = tmp.price.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            })
            rs += `
        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
        <div class="body_page-trending-product-list-card">
        <div class="card-image">
            <a href="product-detail?product_id=${tmp.id}"><img src="${tmp.thumbnail}" alt=""></a>
        </div>
        <div class="card-title-price">
            <p>
                ${tmp.title}
            </p>
            <span>

                ${dis}
            </span>
            <span style="margin-left: 10px; color: #6c6c6c"><strike>
                ${price}
                </strike></span>
        </div>
        <div class="card-btn">
            <button><a href="product-detail?product_id=${tmp.id}">Chi tiết</a>
            </button>
            <button onclick="addtocart(${tmp.id})">Thêm vào giỏ</button>
        </div>
    </div>
</div>
                            `
        })
        document.getElementById("products").innerHTML = rs
        elemPage = ``
        let elmNavPage = document.querySelector(".pagination")
        elemPage += `<li class="page-item" onclick='renderPage(${-1})'><a class="page-link" ><i class="fa-solid fa-chevron-left"></i></a></li>`
        for (let i = 0; i < pageTotal; i++) {

            elemPage += `<li class="page-item pageitem_${i}" onclick='renderPage(${i})'><a class="page-link" >${i+1}
        </a></li>`
        }
        elemPage += `<li class="page-item" onclick='renderPage(${-2})'><a class="page-link" ><i class="fa-solid fa-chevron-right"></i></a></li>`
        elmNavPage.innerHTML = elemPage
        renderPage(0)
    }
    const renderPage = (i) => {
        if (i > 0) {
            document.querySelector(".page-item:first-child").classList.remove("hidden");
        } else {
            document.querySelector(".page-item:first-child").classList.add("hidden");
        }
        if (i < pageTotal - 1) {
            document.querySelector(".page-item:last-child").classList.remove("hidden");
        } else {
            document.querySelector(".page-item:last-child").classList.add("hidden");
        }
        if (i == -1) {
            i = pageActive - 1;
            console.log(i)
            if (i < 0)
                i = 0;
            // Ẩn nút "left" khi active bằng trang đầu
            if (i > 0) {
                document.querySelector(".page-item:first-child").classList.remove("hidden");
            } else {
                document.querySelector(".page-item:first-child").classList.add("hidden");
            }
        }
        if (i == -2) {
            i = pageActive + 1;
            console.log(i)

            // if (i > pageTotal - 1)
            //     i = pageTotal - 1;
            // Ẩn nút "right" khi ở trang cuối
            if (i < pageTotal - 1) {
                document.querySelector(".page-item:last-child").classList.remove("hidden");
                document.querySelector(".page-item:first-child").classList.remove("hidden");
            } else {
                document.querySelector(".page-item:last-child").classList.add("hidden");
            }
            if (i === pageTotal - 1) {
                document.querySelector(".page-item:first-child").classList.remove("hidden");
            }
        }
        let active = i + 1
        pageActive = active - 1
        console.log(i)
        data = arrProduct.slice((active - 1) * 12, active * 12)
        let rs = ``
        data.map((tmp) => {
            let dis = tmp.discount.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            })
            let price = tmp.price.toLocaleString('vi-VN', {
                style: 'currency',
                currency: 'VND'
            })
            rs += `
                                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
    <div class="body_page-trending-product-list-card">
        <div class="card-image">
            <a href="product-detail?product_id=${tmp.id}"><img src="${tmp.thumbnail}" alt=""></a>
        </div>
        <div class="card-title-price">
            <p>
                ${tmp.title}
            </p>
            <span>

                ${dis}
            </span>
            <span style="margin-left: 10px; color: #6c6c6c"><strike>
                ${price}
                </strike></span>
        </div>
        <div class="card-btn">
            <button><a href="product-detail?product_id=${tmp.id}">Chi tiết</a>
            </button>
            <button onclick="addtocart(${tmp.id})">Thêm vào giỏ</button>
        </div>
    </div>
</div>
                            `
        })
        document.getElementById("products").innerHTML = rs
        document.querySelectorAll('.page-item').forEach(tmp => {
            tmp.classList.remove('active')
        })
        document.querySelector('.pageitem_' + i).classList.add('active')
    }
</script>
<script src="js/product.js"></script>

</html>
