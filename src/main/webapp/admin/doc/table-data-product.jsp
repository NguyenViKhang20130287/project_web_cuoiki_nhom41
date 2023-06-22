<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.ProductAdmin" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<head>
    <title>Danh sách nhân viên | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

    <style>
        /* The snackbar - position it at the bottom and in the middle of the screen */
        #snackbar {
            visibility: hidden; /* Hidden by default. Visible on click */
            min-width: 250px; /* Set a default minimum width */
            margin-left: -125px; /* Divide value of min-width by 2 */
            background-color: #333; /* Black background color */
            color: #fff; /* White text color */
            text-align: center; /* Centered text */
            border-radius: 2px; /* Rounded borders */
            padding: 16px; /* Padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1; /* Add a z-index if needed */
            left: 50%; /* Center the snackbar */
            bottom: 30px; /* 30px from the bottom */
        }

        /* Show the snackbar when clicking on a button (class added with JavaScript) */
        #snackbar.show {
            visibility: visible; /* Show the snackbar */
            /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
      However, delay the fade out process for 2.5 seconds */
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        /* Animations to fade the snackbar in and out */
        @-webkit-keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @keyframes fadein {
            from {
                bottom: 0;
                opacity: 0;
            }
            to {
                bottom: 30px;
                opacity: 1;
            }
        }

        @-webkit-keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }
            to {
                bottom: 0;
                opacity: 0;
            }
        }

        @keyframes fadeout {
            from {
                bottom: 30px;
                opacity: 1;
            }
            to {
                bottom: 0;
                opacity: 0;
            }
        }
    </style>

</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
        <!-- User Menu-->
        <li><a class="app-nav__item" href="../../LogoutControl"><i class='bx bx-log-out bx-rotate-180'></i> </a></li>
    </ul>
</header>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="../images/admin.png" width="50px"
                                        alt="User Image">
        <div>
            <% if (session.getAttribute("Account") != null) { %>
            <p class="app-sidebar__user-name">
                <%= session.getAttribute("fullName")%>
            </p>
            <% } else if (session.getAttribute("Account") == null) { %>
            <% response.sendRedirect("../../home"); %>
            <% } %>
            <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
        </div>
    </div>
    <hr>
    <% if (session.getAttribute("Account") != null) { %>
    <% if ((Objects.equals(session.getAttribute("role"), "0"))) { %>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="index-admin.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item" href="LoadListBannerControl"><i class="app-menu__icon fa-solid fa-sliders"></i>
            <span class="app-menu__label">Quản lý banner</span></a></li>
        <li><a class="app-menu__item " href="UserAdminControl"><i class='app-menu__icon bx bx-id-card'></i> <span
                class="app-menu__label">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item active" href="ListProductAdminControl"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
        </li>
        <li><a class="app-menu__item" href="ListOrderControl"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>
        <li><a class="app-menu__item" href="quan-ly-bao-cao.jsp"><i
                class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
        </li>
        <li><a class="app-menu__item" href="../../home"><i class='app-menu__icon bx bx-user-circle'></i><span
                class="app-menu__label">Về trang chủ</span></a>
        </li>
    </ul>
    <%}%>

    <%if ((Objects.equals(session.getAttribute("role"), "1"))) {%>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="index-admin.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item" href="LoadListBannerControl"><i class="app-menu__icon fa-solid fa-sliders"></i>
            <span class="app-menu__label">Quản lý banner</span></a></li>
<%--        <li><a class="app-menu__item " href="UserAdminControl"><i class='app-menu__icon bx bx-id-card'></i> <span--%>
<%--                class="app-menu__label">Quản lý khách hàng</span></a></li>--%>
        <li><a class="app-menu__item active" href="ListProductAdminControl"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
        </li>
        <%--        <li><a class="app-menu__item" href="ListOrderControl"><i class='app-menu__icon bx bx-task'></i><span--%>
        <%--                class="app-menu__label">Quản lý đơn hàng</span></a></li>--%>
        <%--        <li><a class="app-menu__item" href="quan-ly-bao-cao.jsp"><i--%>
        <%--                class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>--%>
        <%--        </li>--%>
        <li><a class="app-menu__item" href="../../home"><i class='app-menu__icon bx bx-user-circle'></i><span
                class="app-menu__label">Về trang chủ</span></a>
        </li>
    </ul>
    <%}%>

    <%if ((Objects.equals(session.getAttribute("role"), "2"))) {%>
    <ul class="app-menu">
        <li><a class="app-menu__item" href="index-admin.jsp"><i class='app-menu__icon bx bx-tachometer'></i><span
                class="app-menu__label">Bảng điều khiển</span></a></li>
        <li><a class="app-menu__item" href="LoadListBannerControl"><i class="app-menu__icon fa-solid fa-sliders"></i>
            <span class="app-menu__label">Quản lý banner</span></a></li>
<%--        <li><a class="app-menu__item " href="UserAdminControl"><i class='app-menu__icon bx bx-id-card'></i> <span--%>
<%--                class="app-menu__label">Quản lý khách hàng</span></a></li>--%>
        <%--        <li><a class="app-menu__item" href="ListProductAdminControl"><i--%>
        <%--                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>--%>
        <%--        </li>--%>
        <li><a class="app-menu__item" href="ListOrderControl"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>
        <li><a class="app-menu__item" href="quan-ly-bao-cao.jsp"><i
                class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">Báo cáo doanh thu</span></a>
        </li>
        <li><a class="app-menu__item" href="../../home"><i class='app-menu__icon bx bx-user-circle'></i><span
                class="app-menu__label">Về trang chủ</span></a>
        </li>
    </ul>
    <%}%>
    <%}%>

</aside>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">

                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="form-add-san-pham.jsp" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới sản phẩm</a>
                        </div>
                    </div>

                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Tình trạng</th>
                            <th>Giá tiền</th>
                            <th>Danh mục</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% List<ProductAdmin> list = (List<ProductAdmin>) request.getAttribute("listProduct");
                            for (ProductAdmin pa : list) { %>
                        <tr>
                            <td><%= pa.getId()%>
                            </td>
                            <td><%= pa.getName()%>
                            </td>
                            <td><img src="<%= pa.getImageLink()%>" alt="" width="100px" height="70px" style="object-fit: cover"></td>
                            <td><%= pa.getQuantity()%>
                            </td>

                            <td><span class="badge bg-<%=pa.getQuantity() >0 ? "success" : "danger" %>"> <%= pa.getStatus()%> </span></td>

                            <%if (pa.getDiscount() == 0) {%>
                            <td><%= pa.getPrice()%></td>
                            <%} else {%>
                            <td><%= pa.getDiscount()%></td>
                            <%}%>

                            <td><%= pa.getCategory()%>
                            </td>
                            <td>
                                <button class="btn btn-primary btn-sm trash" title="Xóa" type="button"
                                   onclick="deleteProduct(id=<%=pa.getId()%>)">
                                    <i class="fas fa-trash-alt"></i></button>
                                <a class="btn btn-primary btn-sm edit" title="Sửa" id="show-emp"
                                   href="DetailsProductAdminControl?edit_pid=<%=pa.getId()%>"><i class="fas fa-edit"></i></a>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>

                    <!-- The actual snackbar -->
                    <div id="snackbar"></div>

                </div>
            </div>
        </div>
    </div>
</main>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://rawgit.com/unconditional/jquery-table2excel/master/src/jquery.table2excel.js"></script>
<script src="js/plugins/pace.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $('#sampleTable').DataTable();

    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
</script>
<script>
    $('#sampleTable').DataTable();

    function toastsMessage(message) {
        // Get the snackbar DIV
        var x = document.getElementById("snackbar");

        x.innerHTML = message

        // Add the "show" class to DIV
        x.className = "show";

        // After 3 seconds, remove the show class from DIV
        setTimeout(function () {
            x.className = x.className.replace("show", "");
        }, 3000);
    }
</script>

<script>

    function deleteProduct(id) {
        $.ajax({
            url: "/web_nhom41_war/admin/doc/DeleteProductAdminControl",
            type: "post",
            data: {
                id: id
            },
            success: function (data) {
                console.log(data)
                let tables = document.querySelector('#sampleTable')
                tables.innerHTML = `<thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Tình trạng</th>
                            <th>Giá tiền</th>
                            <th>Danh mục</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>` + data;

                $('#sampleTable').DataTable();
                toastsMessage("Xóa thành công")

            },
            error: function (error) {
                alert("error")
            }
        })
    }

</script>
</body>

</html>