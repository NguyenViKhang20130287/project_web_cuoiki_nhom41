<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/17/2023
  Time: 7:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/lostpassword.css">
    <title>Nhập mã xác thực đăng ký</title>
</head>

<body>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Nhập mã xác thực đăng ký</h1>
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
            <li><a href="">Nhập mã xác thực đăng ký</a></li>
        </ul>
    </div>
    <!--        Lost Password Form-->
    <div class="body_page-main">
        <div class="lost-pass-container">
            <div class="text-header">
                <h3 style="border-bottom: none!important;">Nhập mã xác thực đăng ký</h3>
            </div>
            <form method="post" action="VerifyRegister">

                <input style="height: 60px; width: 100%; border:2px solid #eaedff;
                margin-bottom: 20px; line-height: inherit; padding: 0 20px ;
                font-size: 16px"
                       id="email" name="authcode" type="text" placeholder="Nhập mã xác thực...">
                <div>
                    <%String message = (String) request.getAttribute("errorVerify"); %>
                    <p style="color: red; margin-bottom: 20px;"><%=message != null ? message : ""%>
                    </p>
                </div>

                <button class="find-button" type="submit">Xác nhận</button>

                <button class="cancel-button"><a href="LoginControl">Hủy</a></button>

            </form>
        </div>
    </div>


</div>

<!-- footer page -->
<%@include file="foooter.jsp" %>
</body>
<script src="js/main.js"></script>
</html>
