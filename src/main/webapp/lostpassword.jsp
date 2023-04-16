<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <link rel="stylesheet" href="css/lostpassword.css">
    <title>Shop Bán Ngọc Quý</title>

    <style>

        .cancel-button a {
            color: #000;
            transition: all .3s;
        }

        .cancel-button:hover a {
            color: #fff;
        }

    </style>

</head>

<body>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Tìm lại tài khoản</h1>
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
            <li><a href="">Lấy lại mật khẩu</a></li>
        </ul>
    </div>
    <!--        Lost Password Form-->
    <div class="body_page-main">
        <div class="lost-pass-container">
            <div class="text-header">
                <h3>Tìm Tài Khoản Của Bạn</h3>
            </div>
            <div class="message">
                <%String message = (String) request.getAttribute("error"); %>
                <% if (message == null) { %>
                <p>Vui lòng nhập email để tìm kiếm tài khoản của bạn</p>
                <% } else { %>
                <p style="color: red"><%=message%>
                </p>
                <% } %>
            </div>
            <form action="ForgotPasswordControl" method="post">

                <input id="email" name="email" type="email" placeholder="Địa Chỉ Email...">

                <button class="find-button" type="submit">TÌM KIẾM</button>

                <button class="cancel-button"><a href="LoginControl">HỦY</a>
                </button>


            </form>
        </div>
    </div>


</div>

<!-- footer page -->
<%@include file="foooter.jsp"%>
</body>
<script src="js/main.js"></script>
<script src="js/login.js"></script>
</html>