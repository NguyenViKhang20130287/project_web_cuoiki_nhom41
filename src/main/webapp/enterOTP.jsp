<%--
  Created by IntelliJ IDEA.
  User: nguyenvikhang
  Date: 01/01/2023
  Time: 10:12 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <link rel="stylesheet" href="css/lostpassword.css">
    <title>Nhập mã xác thực</title>
</head>

<body>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Nhập mã xác thực</h1>
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
            <li><a href="">Nhập mã xác thực</a></li>
        </ul>
    </div>
    <!--        Lost Password Form-->
    <div class="body_page-main">
        <div class="lost-pass-container">
            <div class="text-header">
                <h3>Nhập mã xác thực</h3>
            </div>
            <div class="message">

                <%String message = (String) request.getAttribute("errorOTP"); %>
                <% if (message == null) { %>
                <p>Vui lòng nhập mã xác thực để tạo mật khẩu mới</p>
                <% } else { %>
                <p style="color: red"><%=message%>
                </p>
                <% } %>
                <%--                <p>Vui lòng nhập mã xác thực để tạo mật khẩu mới</p>--%>
            </div>
            <form action="enterOTPControl" method="post">

                <input style="height: 60px; width: 100%; border:2px solid #eaedff;
                margin-bottom: 20px; line-height: inherit; padding: 0 20px ;
                font-size: 16px"
                       id="email" name="otp" type="number" placeholder="Nhập mã xác thực...">

                <button class="find-button" type="submit">OK</button>

                <button class="cancel-button"><a href="LoginControl">HỦY</a></button>

            </form>
        </div>
    </div>


</div>

<!-- footer page -->
<%@include file="foooter.jsp" %>
</body>
<script src="js/main.js"></script>
<script src="js/login.js"></script>
</html>
