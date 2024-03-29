<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.User" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<head>
    <title>Sửa thông tin khách hàng | Quản trị Admin</title>
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
                class="app-menu__label active">Quản lý khách hàng</span></a></li>
        <li><a class="app-menu__item" href="ListProductAdminControl"><i
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
<%--        <li><a class="app-menu__item active" href="UserAdminControl"><i class='app-menu__icon bx bx-id-card'></i> <span--%>
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
<%--        <li><a class="app-menu__item active" href="UserAdminControl"><i class='app-menu__icon bx bx-id-card'></i> <span--%>
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

    <!--
  MODAL
  -->
    <div class="" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
         data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
                          <span class="thong-tin-thanh-toan">
                            <h5>Chỉnh sửa thông tin khách hàng</h5>
                          </span>
                        </div>
                    </div>


                    <form method="post" action="EditUserAdminControl">
                        <div class="row">
                            <% List<User> list = (List<User>) request.getAttribute("listUser");
                                for (User u : list) {
                                    if (u.getId() == Integer.parseInt((String) request.getAttribute("uid"))) { %>
                            <div class="form-group col-md-6">
                                <label class="control-label">Mã khách hàng</label>
                                <input class="form-control" type="number" value="<%=u.getId()%>"
                                       name="uid">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Tên đăng nhập</label>
                                <input class="form-control" type="text" value="<%=u.getUserName()%>" readonly="readonly"
                                       name="uname">
                            </div>

<%--                            <div class="form-group col-md-6">--%>
<%--                                <label class="control-label">Mật khẩu</label>--%>
<%--                                <input class="form-control" type="text" name="password"--%>
<%--                                       value="<%=u.getPassword()%>">--%>
<%--                            </div>--%>

                            <div class="form-group col-md-6">
                                <label class="control-label">Họ và tên</label>
                                <input class="form-control" type="text" value="<%=u.getFullName()%>"
                                       name="fullName">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Email</label>
                                <input class="form-control" type="text" value="<%=u.getEmail()%>"
                                       name="email">
                            </div>

                            <div class="form-group col-md-6">
                                <label class="control-label">Số điện thoại</label>
                                <input class="form-control" type="text" name="phone"
                                       value="<%=u.getPhone()%>">
                            </div>

                            <div class="form-group col-md-6 ">
                                <label for="exampleSelect1" class="control-label">Vai trò</label>

                                <%if (u.getRole() == 0){%>
                                <select class="form-control role" id="exampleSelect1" name="role">
                                    <%String roleDes = u.getRoleDes();%>
<%--                                    <option value="<%=u.getRoleDes()%>"><%=roleDes%></option>--%>
                                    <option selected value="0">Quản trị viên</option>
                                    <option value="1">Nhân viên bán hàng</option>
                                    <option value="2">Nhân viên kiểm toán</option>
                                    <option value="3">Khách hàng</option>
                                </select>
                                <%}%>
                                <%if (u.getRole() == 1){%>
                                <select class="form-control role" id="exampleSelect1" name="role">
                                    <%String roleDes = u.getRoleDes();%>
                                    <%--                                    <option value="<%=u.getRoleDes()%>"><%=roleDes%></option>--%>
                                    <option value="0">Quản trị viên</option>
                                    <option selected value="1">Nhân viên bán hàng</option>
                                    <option value="2">Nhân viên kiểm toán</option>
                                    <option value="3">Khách hàng</option>
                                </select>
                                <%}%>
                                <%if (u.getRole() == 2){%>
                                <select class="form-control role" id="exampleSelect1" name="role">
                                    <%String roleDes = u.getRoleDes();%>
                                    <%--                                    <option value="<%=u.getRoleDes()%>"><%=roleDes%></option>--%>
                                    <option value="0">Quản trị viên</option>
                                    <option value="1">Nhân viên bán hàng</option>
                                    <option selected value="2">Nhân viên kiểm toán</option>
                                    <option value="3">Khách hàng</option>
                                </select>
                                <%}%>
                                <%if (u.getRole() == 3){%>
                                <select class="form-control role" id="exampleSelect1" name="role">
                                    <%String roleDes = u.getRoleDes();%>
                                    <%--                                    <option value="<%=u.getRoleDes()%>"><%=roleDes%></option>--%>
                                    <option value="0">Quản trị viên</option>
                                    <option value="1">Nhân viên bán hàng</option>
                                    <option value="2">Nhân viên kiểm toán</option>
                                    <option selected value="3">Khách hàng</option>
                                </select>
                                <%}%>
                            </div>

                            <BR>
                            <BR>
                            <BR>

                            <div class="form-group col-md-6">
                            </div>
                            <%
                                }%>
                            <%
                                }
                            %>
                        </div>
                        <button class="btn btn-save" type="submit">Lưu lại</button>
                        <a class="btn btn-cancel" href="UserAdminControl">Hủy bỏ</a>
                    </form>
                    <BR>

                </div>


                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

</main>


<!--
MODAL
-->

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
<%----%>
<script !src="">
    $(document).ready(function () {

    })
</script>
<%----%>
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
    function deleteRow(r) {
        var i = r.parentNode.parentNode.rowIndex;
        document.getElementById("myTable").deleteRow(i);
    }

    jQuery(function () {
        jQuery(".trash").click(function () {
            swal({
                title: "Cảnh báo",
                text: "Bạn có chắc chắn là muốn xóa sản phẩm này?",
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
</script>
</body>

</html>