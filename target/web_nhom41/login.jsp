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

    <% String errorMessage = (String) request.getAttribute("error"); %>
    <% String errorMessageRegister = (String) request.getAttribute("message_regis"); %>

    <link rel="stylesheet" href="css/login.css">
    <title>Shop Bán Ngọc Quý</title>

    <style>
        .note {
            margin-bottom: 10px;
            margin-left: 10px;
            font-size: 15px;
            color: #5f6368;
        }

        .social-login a {
            text-decoration: none;
            position: relative;
            text-align: center;
            color: #fff;
            margin-bottom: 10px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: inline-block;
        }

        .social-login a.google {
            background: #ea4335;
        }

        .social-login a.facebook {
            background: #3b5998;
        }

        .social-login a.twitter {
            background: #1da1f2;
        }

        .social-login a span {
            position: absolute;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        .text-center {
            text-align: center !important;
            margin-top: 30px;
        }
    </style>

</head>

<body>
<%--header page--%>
<%@include file="header.jsp" %>
<!--banner-->
<div class="banner">
    <h1>Đăng nhập</h1>
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
            <li><a href="">Đăng nhập</a></li>
        </ul>
    </div>
    <!--        Login Form-->
    <div class="body_page-main">
        <div class="login-container">
            <div class="text-header">
                <h3>Đăng Nhập</h3>
            </div>

            <form action="LoginControl" method="post">
                <label for="email">Tên đăng nhập <span>*</span></label>
                <input id="email" type="text" placeholder="Nhập tên đăng nhập..." name="uname" required minlength="8" maxlength="30"
                    <%if(request.getAttribute("usernameCookie") == null) { %>
                       value=""
                    <%}%>
                       value="<%=request.getAttribute("usernameCookie")%>"
                >
                <% String errorPass = (String) request.getAttribute("errorPass"); %>
                <% String errorUsername = (String) request.getAttribute("errorUsername"); %>
                <p style="color: red; margin-bottom: 20px;">
                    <%= errorUsername != null ? errorUsername : "" %>
                </p>
                <label for="pass">Mật Khẩu <span>*</span></label>
                <input id="pass" type="password" placeholder="Nhập mật khẩu..." name="password" required minlength="8" maxlength="16"
                    <%if(request.getAttribute("passwordCookie") == null) { %>
                       value=""
                    <%}%>
                       value="<%=request.getAttribute("passwordCookie")%>"
                >
                <p style="color: red;">
                    <%= errorPass != null ? errorPass : "" %>
                </p>
                <div style="margin-bottom: 20px">
                    <p style="color: red;">
                        <%= errorMessage != null ? errorMessage : "" %>
                    </p>
                </div>


                <div class="save">
                    <div class="save-container">

                        <input id="save" type="checkbox" name="remember">
                        <label for="save">Nhớ Mật Khẩu!</label>
                    </div>
                    <div class="lost-pass">
                        <a href="lostpassword.jsp">Quên Mật Khẩu?</a>
                    </div>

                </div>
                <button class="login-button" type="submit">ĐĂNG NHẬP</button>
                <div class="or">
                    <span>HOẶC</span>
                </div>
                <button class="register-button" id="register-button-login">ĐĂNG KÝ</button>
                <div class="social-login text-center">
                    <a href="#" class="facebook">
                        <span class="icon-facebook mr-3"><i class="fa-brands fa-facebook"></i></span>
                    </a>
                    <a href="#" class="twitter">
                        <span class="icon-twitter mr-3"><i class="fa-brands fa-twitter"></i></span>
                    </a>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=profile+email&redirect_uri=https://redirectmeto.com/http://192.168.65.100:8080/web_nhom41_war/LoginGoogleControl&response_type=code
                        &client_id=221698755693-ir2i1mmqa9qkd406ucche62utjtf5l4v.apps.googleusercontent.com&approval_prompt=force" class="google">
                        <span class="icon-google mr-3"><i class="fa-brands fa-google"></i></span>
                    </a>
                </div>
            </form>
        </div>
    </div>
    <!--        Register Form-->
    <div class="modal" style="overflow-y: auto;">
        <div class="modal-content">

            <div class="register-container">
                <div class="close"><a href="" id="closeButton"><i class="fa-solid fa-xmark"></i></a></div>
                <div class="text-header">
                    <h3>Đăng Ký</h3>
                </div>
                <form action="RegisterControl" method="post">
                    <label for="uname">Tên Đăng Nhập <span>*</span></label>
                    <input id="uname" type="text" placeholder="Nhập Tên Đăng Nhập..." name="uname" required minlength="8" maxlength="30">
                    <div class="note"><span>Bạn có thể sử dụng chữ cái, số và dấu gạch dưới</span></div>
                    <label for="email-register">Địa Chỉ Email <span>*</span></label>
                    <input id="email-register" type="email" placeholder="Địa Chỉ Email..." name="email_register" required>
                    <label for="pass-register">Mật Khẩu <span>*</span></label>
                    <input id="pass-register" type="password" placeholder="Nhập Mật Khẩu..." name="pass_register" required minlength="8" maxlength="16">
                    <div class="note"><span>Sử dụng 8 ký tự trở lên với ít nhất một chữ cái viết hoa, một chữ cái viết thường, một số và một ký tự đặc biệt</span>
                    </div>
                    <div style="margin-bottom: 20px">
                        <p style="border-radius: 3px; color: #a90312;  font-weight: bold">
                            <%= errorMessageRegister != null ? errorMessageRegister : "" %>
                        </p>
                    </div>

                    <button class="register-button" id="register-button" type="submit">ĐĂNG KÝ</button>
                    <div class="or">
                        <span>HOẶC</span>
                    </div>
                    <button class="login-button" id="login-button-register">ĐĂNG NHẬP</button>
                </form>
            </div>
        </div>
    </div>


</div>

<!-- footer page -->
<%@include file="foooter.jsp" %>
</body>
<script src="js/main.js"></script>
<script src="js/login.js"></script>

</html>
