<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Favorite" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 6/16/2023
  Time: 9:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

        .card-title-price p {
            height: 50px;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            overflow: hidden;
            margin-bottom: 4px;
        }

        .delete-icon-circle {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: #757575;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            position: absolute;
            top: 10px;
            left: 25px;
        }

        .delete-icon-circle i {
            color: white;
            font-size: 16px;
        }

    </style>

</head>
<body>
<% List<Favorite> favoriteList = (List<Favorite>) session.getAttribute("favorite");
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);%>
<%--header page--%>
<%@include file="header.jsp" %>
<!--banner-->
<div class="banner">
    <h1>Sản phẩm yêu thích</h1>
</div>
<div class="body_page-menu">
    <ul>
        <li><a href="home">
            <i class="fa-solid fa-house"></i>
            Trang chủ</a>
        </li>
        <span><i class="fa-solid fa-chevron-right"></i></span>
        <li><a href="">Sản phẩm yêu thích</a></li>
    </ul>
</div>
<!--Product Categories-->
<section class="product_categories">
    <div class="container">
        <div class="row">
            <!--Products List-->
            <div class="col-xl-12 col-lg-12 col-md-8">
                <div class="product_content-area">
                    <div class="product_header">
                        <div class="product_header-left" style="font-size: 20px">Các sản phẩm yêu thích</div>
                    </div>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-content-item fade active show" id="pills-grid-1" role="tabpanel"
                             aria-labelledby="pills-grid">
                            <div class="row " id="products">
                                <%if (session.getAttribute("Account") != null) {%>
                                <%for (Favorite favorite : favoriteList) {%>
                                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                                    <div class="body_page-trending-product-list-card">
                                        <div class="card-image">
                                            <a href="product-detail?product_id=<%=favorite.getProduct().getId()%>">
                                                <img src=<%=favorite.getProduct().getThumbnail()%>
                                                             alt="">
                                            </a>
                                        </div>
                                        <div class="card-title-price">
                                            <div onclick="deleteFavorites(<%=favorite.getProduct().getId()%>)" class="delete-icon-circle">
                                                <i class="fas fa-trash"></i>
                                            </div>
                                            <p>
                                                <%=favorite.getProduct().getTitle()%>
                                            </p>
                                            <span><%=numberFormat.format(favorite.getProduct().getDiscount())%></span>
                                            <span style="margin-left: 10px; color: #6c6c6c"><strike><%=numberFormat.format(favorite.getProduct().getPrice())%></strike></span>
                                        </div>
                                        <div class="card-btn">
                                            <button><a href="product-detail?product_id=1">Chi tiết</a></button>
                                            <button onclick="addtocart(<%=favorite.getProduct().getId()%>)">Thêm vào
                                                giỏ
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                                <%} else {%>
                                <div class="m-auto">Bạn chưa đăng nhập tài khoản.</div>
                                <%}%>
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
    function addtocart(idProduct) {
        var cartQuantity = document.getElementById("cartQuantity");
        console.log(idProduct);
        $.ajax({
            url: "/web_nhom41_war/addtocart",
            type: "post",
            data: {
                inputId: idProduct
            },
            success: function (data) {
                cartQuantity.innerHTML = data;
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        });
    }

    function deleteFavorites(productId) {
        console.log(productId);
        $.ajax({
            url: "/web_nhom41_war/deletefavorites",
            type: "post",
            data: {
                product_id: productId
            },
            success: function (data) {
                $("#products").html(data);
                $.ajax({
                    url: "/web_nhom41_war/deletefavorites",
                    type: "get",
                    data:{},
                    success: function (data){
                        $("#favoriteQuantity").html(data);
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                })
            },
            error: function (xhr) {
                //Do Something to handle error
            }
        })
    }

</script>
</html>
