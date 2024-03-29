<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.OrderAdmin" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.ProductAdmin" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.AdminDAO" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<head>
    <title>Danh sách đơn hàng | Quản trị Admin</title>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>
<% Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale); %>
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
        <li><a class="app-menu__item" href="ListProductAdminControl"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a>
        </li>
        <li><a class="app-menu__item active" href="ListOrderControl"><i class='app-menu__icon bx bx-task'></i><span
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
        <li><a class="app-menu__item" href="ListProductAdminControl"><i
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
        <li><a class="app-menu__item active" href="ListOrderControl"><i class='app-menu__icon bx bx-task'></i><span
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
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" href="form-add-don-hang.jsp" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới đơn hàng</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="writeExcelControl" title="In"><i
                                    class="fas fa-file-excel"></i> Xuất Excel</a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <%--                            <th width="10"><input type="checkbox" id="all"></th>--%>
                            <th>ID</th>
                            <th>Khách hàng</th>
                            <th>Địa chỉ</th>
                            <%--                            <th>Đơn hàng</th>--%>
                            <th>Số điện thoại</th>
                            <th>Tổng tiền</th>
                            <th>Tình trạng</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody id="bodyTable">
                        <%
                            List<OrderAdmin> list = (List<OrderAdmin>) request.getAttribute("listOrder");
                            for (OrderAdmin o : list) {
                        %>

                        <tr>
                            <td><%=o.getId()%>
                            </td>
                            <td><%=o.getFullName()%>
                            </td>
                            <td><%=o.getAddress()%>
                            </td>

                            <td><%=o.getPhone()%>
                            </td>
                            <td><%=numberFormat.format(o.getTotalMoney() + o.getShippingCost())%>
                            </td>
                            <td id="orderStatus">
                                <%if (o.getId_status() == 1) {%>
                                <span class="badge bg-warning">Chờ xác nhận</span>
                                <%}%>
                                <%if (o.getId_status() == 2) {%>
                                <span class="badge bg-info">Đang giao hàng</span>
                                <%}%>
                                <%if (o.getId_status() == 3) {%>
                                <span class="badge bg-success">Đã giao</span>
                                <%}%>
                                <%if (o.getId_status() == 4) {%>
                                <span class="badge bg-danger">Đã hủy</span>
                                <%}%>
                            </td>
                            <td id="buttonGroup">

                                <%if (o.getId_status() == 1 || o.getId_status() == 4) {%>
                                <button class="btn btn-primary btn-sm edit updateStatus" type="button"
                                        title="Cập nhật">
                                    <a href="/web_nhom41_war/admin/doc/ChangeStatusControl?productId=<%=o.getId() %>&status=<%=o.getId_status() %>"><i
                                            class="fa fa-edit"></i></a></button>
                                <a class="btn btn-primary btn-sm edit" type="button" title="Chi tiết"
                                   style="padding: 5px 15px;"
                                   href="loadDetailsOrder?oid=<%=o.getId()%>">
                                    <i class="fa-solid fa-info" style=""></i></a>
                                <%} else if ((o.getId_status() == 2 || o.getId_status() == 3)) {%>
                                <button class="btn btn-primary btn-sm edit updateStatus" type="button"
                                        title="Cập nhật"
                                        id="btn-confirm" data-orderid="<%=o.getId()%>"><i
                                        class="fa fa-edit"></i></button>
                                <a class="btn btn-primary btn-sm edit" type="button" title="Chi tiết"
                                   style="padding: 5px 15px;"
                                   href="loadDetailsOrder?oid=<%=o.getId()%>">
                                    <i class="fa-solid fa-info" style=""></i></a>
                                <%}%>

                            </td>
                            <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
                                 aria-hidden="true" id="mi-modal-<%=o.getId()%>">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title"
                                                id="myModalLabel"><%=o.getId_status() == 2 ? "Bạn có chắc là cập nhật đơn hàng\n" +
                                                    "                                                sang Đã giao trong khi đơn hàng chưa được người dùng xác nhận Đã nhận?" : "Bạn có chắc là cập nhật đơn hàng\n" +
                                                    "                                                sang Đã hủy trong khi đơn hàng Đã giao thành công?"%>
                                            </h4>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default btn-yes" id="modal-btn-si"><a
                                                    href="/web_nhom41_war/admin/doc/ChangeStatusControl?productId=<%=o.getId() %>&status=<%=o.getId_status() %>">Có</a>
                                            </button>
                                            <button type="button" class="btn btn-primary btn-no" id="modal-btn-no"
                                                    data-orderid="<%=o.getId()%>">Không
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <%--    --%>

</main>
<!-- Essential javascripts for application to work-->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="src/jquery.table2excel.js"></script>
<script src="js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script>
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }

    jQuery(function () {
        jQuery(".trash").click(function () {
            swal({
                title: "Cảnh báo",

                text: "Bạn có chắc chắn là muốn xóa đơn hàng này?",
                buttons: ["Hủy bỏ", "Đồng ý"],
            })
                .then((willDelete) => {
                    if (willDelete) {
                        swal("Đã xóa thành công.!", {});
                    }
                });
        });
    });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });

    //EXCEL
    // $(document).ready(function () {
    //   $('#').DataTable({

    //     dom: 'Bfrtip',
    //     "buttons": [
    //       'excel'
    //     ]
    //   });
    // });


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

    //In dữ liệu
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('sampleTable');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        }
    }
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


    //Modal
    $("#show-emp").on("click", function () {
        $("#ModalUP").modal({backdrop: false, keyboard: false})
    });
    $(".updateStatus").on("click", function () {
        var orderId = this.getAttribute('data-orderid');
        console.log(orderId)
        var modalId = 'mi-modal-' + orderId;
        console.log(modalId)
        $('#' + modalId).css({"display": "block", "opacity": "1"});
        $(".modal-header").css({"color": "black"});
    });
    $(".btn-no").on("click", function () {
        var orderId = this.getAttribute('data-orderid');
        console.log(orderId)
        var modalId = 'mi-modal-' + orderId;
        console.log(modalId)
        $('#' + modalId).css({"display": "none", "opacity": "0"});
    });
    $(".btn-yes").on("click", function () {
        $("#mi-modal").modal('hide');
    });


</script>
</body>

</html>