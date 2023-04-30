<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Account" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Objects" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/14/2023
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Shop Bán Ngọc Quý</title>

    <style>
        html a:hover {
            text-decoration: none !important;
        }

        .header_page {
            background-color: #E4E4E4;
            width: 100%;
        }

        .header_page-main {
            width: 80%;
            margin: 0 auto;
            background-color: #E4E4E4;
        }

        .header_page-category-main-menu {
            margin-bottom: 0;
        }

        .sticky {
            width: 100%;
            background: #fff;
        }

        .body_page-menu {
            padding: 15px;
            background: #b2bec3;
        }

        .body_page-menu ul {
            width: 80%;
            margin: 0 auto;
            display: flex;
        }

        .body_page-menu ul li {
            margin-right: 10px;
        }

        .body_page-menu span {
            margin-right: 10px;
        }

        .body_page-menu ul li:first-child:hover a {
            color: #bc8247;
        }

        .body_page-menu ul li a {
            color: #000;
            transition: all 0.2s;
        }

        .body_page-menu ul li a i {
            margin-right: 3px;
            font-size: 14px;
        }

        .shadow {
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1) !important;
        }

        .profile-tab-nav {
            min-width: 250px;
        }

        .tab-content {
            flex: 1;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .nav-pills a.nav-link {
            padding: 15px 20px;
            border-bottom: 1px solid #ddd;
            border-radius: 0;
            color: #333;
        }

        .nav-pills a.nav-link i {
            width: 20px;
        }

        .img-circle img {
            height: 100px;
            width: 100px;
            border-radius: 100%;
            border: 5px solid #fff;
        }


    </style>

</head>
<% HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
    Account accSession = (Account) session.getAttribute("Account");

    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>
<body onload="validateForm()">
<%--header page--%>
<%@include file="header.jsp" %>
<!--banner-->
<div class="banner">
    <h1>Thông tin cá nhân</h1>
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
            <li><a href="">Thông tin cá nhân</a></li>
        </ul>
    </div>
    <section class="py-5 my-5">
        <div class="container">
            <div class="bg-white shadow rounded-lg d-block d-sm-flex">
                <div class="profile-tab-nav border-right">
                    <div class="p-4">
                        <% if (session.getAttribute("Account") != null) { %>
                        <h4 class="text-center"><%=session.getAttribute("full_name") != null ? session.getAttribute("full_name") : session.getAttribute("fullName")%>
                        </h4>
                        <% } else if (session.getAttribute("Account") == null) { %>
                        <% response.sendRedirect("../../home"); %>
                        <% } %>
                        <h4 class="text-center"></h4>
                    </div>
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab"
                           aria-controls="account" aria-selected="true">
                            <i class="fa fa-home text-center mr-1"></i>
                            Tài khoản
                        </a>
                        <a class="nav-link" id="password-tab" data-toggle="pill" href="#password" role="tab"
                           aria-controls="password" aria-selected="false">
                            <i class="fa fa-key text-center mr-1"></i>
                            Mật khẩu
                        </a>
                    </div>
                </div>
                <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="account" role="tabpanel"
                         aria-labelledby="account-tab">
                        <h3 class="mb-4">Cài đặt tài khoản</h3>
                        <form id="information-form" action="/web_nhom41_war/AccountSettingControl" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Họ tên</label>
                                        <input id="name" name="full_name" type="text" class="form-control"
                                               onchange="validateForm()"
                                               value="<%=session.getAttribute("full_name")!=null?session.getAttribute("full_name"):session.getAttribute("fullName")%>">
                                        <input type="hidden" name="currentName" id="currentName"
                                               value="<%=session.getAttribute("full_name")!=null?session.getAttribute("full_name"):session.getAttribute("fullName")%>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input id="email" name="email_update" type="text" class="form-control"
                                               onchange="validateForm()"
                                               value="<%=session.getAttribute("email_update")!=null?session.getAttribute("email_update"):session.getAttribute("email")%>">
                                        <input type="hidden" name="currentEmail" id="currentEmail"
                                               value="<%=session.getAttribute("email_update")!=null?session.getAttribute("email_update"):session.getAttribute("email")%>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Số điện thoại</label>
                                        <input id="phone_number" name="phone_number" type="text" class="form-control"
                                               onchange="validateForm()"
                                               value="<%=session.getAttribute("phone_number")!=null?session.getAttribute("phone_number"):session.getAttribute("phoneNumber")%>">
                                        <input type="hidden" name="currentPhoneNumber" id="currentPhoneNumber"
                                               value="<%=session.getAttribute("phone_number")!=null?session.getAttribute("phone_number"):session.getAttribute("phoneNumber")%>">
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button id="updateBtn" type="submit" class="btn btn-primary">Cập nhật</button>
                                <button id="cancelBtn" class="btn btn-light" onclick="resetForm()">Hủy</button>
                            </div>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                        <h3 class="mb-4">Cài đặt mặt khẩu</h3>
                        <form id="password-form" action="/web_nhom41_war/UpdatePasswordControl" method="post">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Mật khẩu cũ</label>
                                        <input type="password" class="form-control" name="old_password"
                                               id="old_password" onchange="validateForm()" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <p style="color: red"><%=request.getAttribute("errorOldPass") != null ? request.getAttribute("errorOldPass") : ""%>
                                    </p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Mật khẩu mới</label>
                                        <input type="password" class="form-control" name="new_password"
                                               id="new_password" onchange="validateForm()" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <p style="color: red"><%=request.getAttribute("error") != null ? request.getAttribute("error") : ""%>
                                    </p>
                                </div>
                            </div>
                            <div>
                                <button id="updatePassBtn" type="submit" class="btn btn-primary">Cập nhật</button>
                                <button id="cancelPassBtn" class="btn btn-light" onclick="resetForm()">Hủy</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!-- footer page -->
<%@include file="foooter.jsp" %>


<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function validateForm() {
        var name = document.getElementById("name").value;
        var email = document.getElementById("email").value;
        var phone_number = document.getElementById("phone_number").value;
        var currentName = document.getElementById("currentName").value;
        var currentEmail = document.getElementById("currentEmail").value;
        var currentPhoneNumber = document.getElementById("currentPhoneNumber").value;
        var oldPassword = document.getElementById("old_password").value;
        var newPassword = document.getElementById("new_password").value;
        if (name === "" || email === "" || phone_number === "" || (name === currentName && email === currentEmail && phone_number === currentPhoneNumber)) {
            document.getElementById("updateBtn").disabled = true;
            document.getElementById("cancelBtn").disabled = true;
        } else {
            document.getElementById("updateBtn").disabled = false;
            document.getElementById("cancelBtn").disabled = false;
        }
        if (oldPassword === "" || newPassword === "") {
            document.getElementById("updatePassBtn").disabled = true;
            document.getElementById("cancelPassBtn").disabled = true;
        } else {
            document.getElementById("updatePassBtn").disabled = false;
            document.getElementById("cancelPassBtn").disabled = false;
        }
    }

    function resetForm() {
        var cancelBtn = document.getElementById("cancelBtn");
        var informationForm = document.getElementById("information-form");
        var cancelPassBtn = document.getElementById("cancelPassBtn");
        var passwordForm = document.getElementById("password-form");
        if (cancelBtn) {
            informationForm.reset();
        } else if (cancelPassBtn) {
            passwordForm.reset();
        }
    }


</script>
</body>
</html>
