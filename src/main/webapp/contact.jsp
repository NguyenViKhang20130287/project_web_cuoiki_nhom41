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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/contact.css">
    <title>Shop Bán Ngọc Quý</title>
</head>

<body>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Liên hệ</h1>
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
            <li><a href="">Liên hệ</a></li>
        </ul>
    </div>

    <div class="body_page-main">
        <div class="body_page-main-address">
            <h1>Tìm kiếm tại đây</h1>
            <ul>
                <li>
                    <span><i class="fa-solid fa-location-dot"></i></span>
                    <p>Địa chỉ: <br>
                        <a href="https://www.google.com/maps/@10.8826482,106.7824544,13z?hl=vi">Đông hòa, Dĩ An,
                            Bình Dương</a></p>
                </li>
                <li>
                    <span><i class="fa-solid fa-envelope"></i></span>
                    <p>Email: <br>
                        <a href="mailto:vikhang17112002@gmail.com">vikhang17112002@gmail.com</a></p>
                </li>
                <li>
                    <span><i class="fa-solid fa-phone"></i></span>
                    <p>Điện thoại: <br>
                        <a href="tel:0943382248">0943382248</a></p>
                </li>

                <li>
                    <span><i class="fa-brands fa-facebook"></i></span>
                    <p>Fanpage: <br>
                        <a href="">GemStore</a></p>
                </li>
            </ul>
        </div>
        <div class="body_page-main-form">
            <h1>Liên hệ chúng tôi</h1>
            <ul>
                <li>
                    <label for="">Họ và tên</label>
                    <input type="text" name="name">
                </li>
                <li>
                    <label for="">Email</label>
                    <input type="email" name="email">
                </li>
                <li>
                    <label for="">Số điện thoại</label>
                    <input type="text" name="phone">
                </li>
                <li>
                    <label for="">Tin nhắn</label>
                    <textarea name="message" id="" cols="30" rows="10"></textarea>
                </li>

                <li>
                    <input type="submit" value="Gửi tin nhắn">
                </li>
            </ul>
        </div>
    </div>
    <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15672.858378257437!2d106.7917617!3d10.8712764!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1667027947435!5m2!1svi!2s"
            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"></iframe>
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

<!-- footer page -->
<%@include file="foooter.jsp"%>
</body>
<script src="js/main.js"></script>

</html>