<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<!DOCTYPE html>
<html lang="en">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">


    <link rel="stylesheet" href="css/login.css">
    <title>Tạo mật khẩu mới</title>

    <style>

        .register-button a {
            color: #fff;
            transition: all .3s;
        }

        .register-button:hover a {
            color: #bc8247;
        }

    </style>

</head>
<body>

<%--header page--%>
<%@include file="header.jsp" %>
<!--banner-->
<div class="banner">
    <h1>Tạo mật khẩu mới</h1>
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
            <li><a href="">Tạo mật khẩu mới</a></li>
        </ul>
    </div>
    <!--        Login Form-->
    <div class="body_page-main">
        <div class="login-container">
            <div class="text-header">
                <h3>Tạo mật khẩu mới</h3>
            </div>

            <form action="NewPasswordControl" method="post">

                <label for="pass">Mật khẩu mới <span>*</span></label>
                <input id="pass" type="password" placeholder="Nhập mật khẩu mới..." name="newPass">

                <div>
                    <%String message = (String) request.getAttribute("oldPassMess"); %>
                    <p style="color: red; margin-bottom: 20px;"><%=message != null ? message : ""%>
                    </p>
                </div>
                <button class="login-button" type="submit">ĐỔI MẬT KHẨU</button>
                <br>
                <br>
                <button class="register-button" id="register-button-login">
                    <a href="LoginControl">HỦY</a></button>

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