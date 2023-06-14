<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Account" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/checkout.css">
    <title>Shop Bán Ngọc Quý</title>
</head>
<% HashMap<Integer, CartItem> cart = (HashMap<Integer, CartItem>) session.getAttribute("cart");
    Account accSession = (Account) session.getAttribute("Account");

    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>
<body>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Thanh toán</h1>
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
            <li><a href="">Thanh toán</a></li>
        </ul>
    </div>

    <div class="body_page-main">
        <div class="checkout-container">
            <div class="left-container">
                <div class="clickbox">
                    <i class="fa-solid fa-folder"></i>
                    <div class="text-inbox">
                        <p>Bạn đã có tài khoản? <a style="color: #6f7172; transition: all .3s"
                                                   id="login" href="LoginControl">Bấm vào đây để đăng nhập</a></p>
                    </div>
                </div>

            </div>
            <div class="right-container">
                <div class="clickbox">
                    <i class="fa-solid fa-folder"></i>
                    <div class="text-inbox">
                        <p>Có phiếu giảm giá?<span id="coupon">Bấm vào đây để nhập mã</span></p>
                    </div>

                </div>
                <form action="" id="useCoupon" style="display: none">
                    <div class="enter-Coupon">
                        <div class="item-1">
                            <div class="input-text">
                                <input type="text" id="couponCode" placeholder="Mã Giảm Giá">

                            </div>
                        </div>
                    </div>
                    <button class="apply-coupon">ÁP DỤNG MÃ</button>
                </form>
            </div>
        </div>
        <% if (session.getAttribute("buynow") == null) { %>
        <form action="CheckoutControl" method="get">
                <% }else{ %>
            <form action="CheckoutBuyNowControl" method="get">
                <% } %>
                <div class="checkout-container">
                    <div class="left-container">


                        <div class="checkout-area">
                            <h3>Chi Tiết Thanh Toán</h3>

                            <div class="item-1">
                                <div class="input-text">
                                    <label for="lastName">Họ Và Tên<span style="color: red">*</span></label>
                                    <input type="text" id="lastName" placeholder="Họ Và Tên" name="name"
                                           value="<%=accSession!=null?accSession.getFullName():""%>">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="streetAddress">Số Nhà, Tên Đường <span
                                            style="color: red">*</span></label>
                                    <input type="text" id="streetAddress" placeholder="Số Nhà, Tên Đường"
                                           name="streetAddress">
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="city">Tỉnh / Thành Phố <span style="color: red">*</span></label>
                                    <select id="city" name="city" onchange="getDistricts()">
                                        <option value="" selected disabled>Chọn Tỉnh / Thành Phố</option>
                                    </select>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="district">Quận / Huyện <span style="color: red">*</span></label>
                                    <select id="district" name="district" onchange="getWards()">
                                        <option value="" selected disabled>Chọn Quận / Huyện</option>
                                    </select>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <label for="ward">Phường / Xã <span style="color: red">*</span></label>
                                    <select id="ward" name="ward" onchange="getLeadTime()">
                                        <option value="" selected disabled>Chọn Phường / Xã</option>
                                    </select>
                                </div>
                            </div>

                            <div class="item-2">
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="mail">Địa Chỉ Email <span style="color: red">*</span></label>
                                        <input type="email" id="mail" placeholder="Địa Chỉ Email" name="mail"
                                               value="<%=accSession!=null?accSession.getEmail():""%>">
                                    </div>
                                </div>
                                <div class="item-1">
                                    <div class="input-text">
                                        <label for="phone">Số Điện Thoại <span style="color: red">*</span></label>
                                        <input type="tel" id="phone" placeholder="Số Điện Thoại" name="phone"
                                               value="<%=accSession!=null?accSession.getPhone():""%>">
                                    </div>
                                </div>
                            </div>
                            <div class="item-1">
                                <div class="input-text">
                                    <input type="checkbox" id="newAccount" name="newAccount" value="newAccount">
                                    <label for="newAccount" id="label-New-Account">Tạo Tài Khoản Mới?</label>
                                </div>
                            </div>
                            <div class="newAccount">

                                <div class="item-1">
                                    <p>Tạo tài khoản mới bằng cách nhập vào thông tin bên dưới. Nếu bạn đã có tài khoản,
                                        xin
                                        hãy đăng nhập ở phần đầu trang</p>
                                    <div class="input-text">
                                        <label for="pass">Mật Khẩu <span style="color: red">*</span></label>
                                        <input type="password" id="pass" placeholder="Nhập Mật Khẩu" name="pass">
                                    </div>
                                </div>
                            </div>

                            <div class="item-1">
                                <div class="input-text">
                                    <label for="note">Ghi Chú</label>
                                    <textarea name="note" id="note" cols="30" rows="10" name="note"
                                              placeholder="Ghi chú về đơn hàng của bạn, ví dụ: lưu ý đặc biệt về vận chuyển..."></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="right-container">


                        <div class="your-order">
                            <h3>Đơn Hàng Của Bạn</h3>
                            <div class="order-table">
                                <table>
                                    <thead>
                                    <tr>
                                        <th>Sản Phẩm</th>
                                        <th>Tổng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% int total = 0;
                                        int totalCart = 0;
                                        if (session.getAttribute("buynow") == null) {
                                            if (cart != null) {
                                                for (Map.Entry<Integer, CartItem> entry : cart.entrySet()) {
                                                    if (entry.getValue().getProduct().getDiscount() != 0) {
                                                        total = entry.getValue().getProduct().getDiscount() * entry.getValue().getQuantity();

                                                    } else {
                                                        total = entry.getValue().getProduct().getPrice() * entry.getValue().getQuantity();
                                                    }
                                                    totalCart += total;
                                    %>
                                    <tr>
                                        <td>
                                            <%= entry.getValue().getProduct().getTitle() %>
                                            <strong>x <%= entry.getValue().getQuantity() %>
                                            </strong>
                                        </td>
                                        <td>
                                            <%= numberFormat.format(total)%>
                                        </td>
                                    </tr>
                                    <%
                                            }
                                        }
                                    } else {
                                        CartItem cartItem = (CartItem) session.getAttribute("buynow");
                                        if (cartItem.getProduct().getDiscount() != 0) {
                                            total = cartItem.getProduct().getDiscount() * cartItem.getQuantity();

                                        } else {
                                            total = cartItem.getProduct().getPrice() * cartItem.getQuantity();
                                        }
                                        totalCart += total;
                                    %>
                                    <tr>
                                        <td>
                                            <%= cartItem.getProduct().getTitle() %>
                                            <strong>x <%= cartItem.getQuantity() %>
                                            </strong>
                                        </td>
                                        <td>
                                            <%= numberFormat.format(total)%>
                                        </td>
                                    </tr>
                                    <% }
                                    %>
                                    </tbody>
                                    <tfoot>
                                    <tr class="cartSubtotal">
                                        <th>Tổng Giỏ Hàng</th>
                                        <td><span class="amount"><%= numberFormat.format(totalCart)%></span></td>
                                    </tr>
                                    <tr class="cartSubtotal">
                                        <th>Vận Chuyển Tới</th>
                                        <td><span class="amount" id="transit_to"></span></td>
                                    </tr>
                                    <tr class="cartSubtotal">
                                        <th>Nhận Hàng Dự Kiến Vào</th>
                                        <td><span class="amount" id="transit_time"></span></td>
                                    </tr>
                                    <tr class="cartSubtotal">
                                        <th>Phí Vận Chuyển</th>
                                        <td><span class="amount" id="costs"><%= numberFormat.format(0)%></span></td>
                                        <input type="hidden" name="costs" id="shipping_costs">
                                    </tr>
                                    <tr class="order-total">
                                        <th style="border-bottom: none;">Tổng Đơn Hàng</th>
                                        <td style="border-bottom: none;"><strong><span
                                                class="amount"
                                                id="total"><%= numberFormat.format(totalCart)%></span></strong>
                                        </td>
                                    </tr>
                                    </tfoot>
                                </table>

                                <div class="collapsible_set">
                                    <label for="payment">Hình thức thanh toán: </label>
                                    <select name="payment" id="payment">
                                        <option value="" disabled selected> Vui lòng chọn hình thức thanh toán</option>
                                        <option value="1"> Tiền mặt</option>
                                        <% if (accSession != null) { %>
                                        <option value="2"> Internet banking</option>
                                        <option value="3"> Ví điện tử</option>
                                        <% } %>
                                    </select>
                                </div>
                                <% if (request.getAttribute("message") != null) {

                                %>
                                <p style="color: red;text-align: center"><%=request.getAttribute("message") %>
                                </p>
                                <%
                                    }
                                %>
                                <button type="submit" class="place-order">ĐẶT HÀNG
                                </button>
                            </div>

                        </div>
                    </div>
                </div>

            </form>


    </div>

</div>
<!-- footer page -->
<%@include file="foooter.jsp" %>
</body>

<script src="js/jquery-3.6.1.min.js"></script>
<script>

    function getAccessTokenFromStorage() {
        // Lấy access_token từ localStorage
        return localStorage.getItem('access_token');
    }

    function saveAccessTokenToStorage(access_token) {
        // Lưu access_token vào localStorage
        localStorage.setItem('access_token', access_token);
    }

    let access_token = getAccessTokenFromStorage();

    function checkAccessTokenValidity() {
        if (access_token) {
            console.log(access_token);

            const expiration_time = parseFloat(localStorage.getItem('expires_in'));
            const current_time = Math.floor(Date.now() / 1000);

            if (current_time >= expiration_time) {
                console.log('Access_token đã hết hạn');
                login();
            } else {
                console.log('Access_token còn hiệu lực');
                getProvinces();
            }
        } else {
            login();
        }
    }

    function login() {
        fetch('./api/login', {
            method: 'POST',
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                const access_token = data.access_token;
                const expires_in = data.expires_in;

                if (access_token && expires_in) {

                    saveAccessTokenToStorage(access_token);

                    const current_time = Math.floor(Date.now() / 1000);
                    const expiration_time = current_time + expires_in;

                    localStorage.setItem('expires_in', expiration_time.toString());

                    // Gọi hàm getProvinces() sau khi đăng nhập thành công
                    getProvinces();
                }
                // // Xử lý phản hồi
                checkAccessTokenValidity();
            });
    }

    // Kiểm tra và sử dụng access_token
    checkAccessTokenValidity();

    function getProvinces() {
        fetch('./api?action=getProvinces', {
            headers: {
                Authorization: 'Bearer ' + access_token,
            },
            method: 'GET',
        })
            .then(response => response.json())
            .then(data => {
                // Xử lý phản hồi
                console.log(data);
                const provinces = data.original.data;

                // Lấy thẻ select từ DOM
                const selectElement = document.getElementById('city');

                // Xóa các phần tử <option> hiện tại trong thẻ select
                selectElement.innerHTML = '';

                const defaultOption = document.createElement('option');
                defaultOption.value = '';
                defaultOption.textContent = 'Chọn Tỉnh / Thành Phố';
                defaultOption.selected = true;
                defaultOption.disabled = true;
                selectElement.appendChild(defaultOption);

                // Tạo và thêm các phần tử <option> dựa trên dữ liệu từ API
                provinces.forEach(province => {
                    const optionElement = document.createElement('option');
                    optionElement.value = `${province.ProvinceID}-${province.ProvinceName}`;
                    optionElement.textContent = province.ProvinceName;
                    selectElement.appendChild(optionElement);
                });
            })
            .catch(error => {
                console.error(error);
            });
    }

    function getDistricts() {
        // Lấy giá trị provinceId từ thẻ tỉnh/thành phố
        const selectedProvince = document.getElementById('city').value;
        console.log(selectedProvince)
        const [provinceID, provinceName] = selectedProvince.split('-');

        // Kiểm tra nếu không có tỉnh được chọn, không làm gì cả
        if (!selectedProvince) {
            return;
        }
        fetch('./api?action=getDistricts', {
            headers: {
                Authorization: 'Bearer ' + access_token,
                ProvinceID: provinceID
            },
            method: 'GET',
        })
            .then(response => response.json())
            .then(data => {
                // Xử lý phản hồi
                console.log(data);
                const districts = data.original.data;

                // Lấy thẻ select từ DOM
                const selectElement = document.getElementById('district');

                // Xóa các phần tử <option> hiện tại trong thẻ select
                selectElement.innerHTML = '';

                const defaultOption = document.createElement('option');
                defaultOption.value = '';
                defaultOption.textContent = 'Chọn Quận / Huyện';
                defaultOption.selected = true;
                defaultOption.disabled = true;
                selectElement.appendChild(defaultOption);

                // Tạo và thêm các phần tử <option> dựa trên dữ liệu từ API
                districts.forEach(district => {
                    const optionElement = document.createElement('option');
                    optionElement.value = `${district.DistrictID}-${district.DistrictName}`;
                    optionElement.textContent = district.DistrictName;
                    selectElement.appendChild(optionElement);
                });
            })
            .catch(error => {
                console.error(error);
            });
    }

    function getWards() {
        // Lấy giá trị provinceId từ thẻ tỉnh/thành phố
        const selectedDistrict = document.getElementById('district').value;
        console.log(selectedDistrict)
        const [districtID, districtName] = selectedDistrict.split('-');

        // Kiểm tra nếu không có tỉnh được chọn, không làm gì cả
        if (!selectedDistrict) {
            return;
        }
        fetch('./api?action=getWards', {
            headers: {
                Authorization: 'Bearer ' + access_token,
                DistrictID: districtID
            },
            method: 'GET',
        })
            .then(response => response.json())
            .then(data => {
                // Xử lý phản hồi
                console.log(data);
                const wards = data.original.data;

                // Lấy thẻ select từ DOM
                const selectElement = document.getElementById('ward');

                // Xóa các phần tử <option> hiện tại trong thẻ select
                selectElement.innerHTML = '';

                const defaultOption = document.createElement('option');
                defaultOption.value = '';
                defaultOption.textContent = 'Chọn Phường / Xã';
                defaultOption.selected = true;
                defaultOption.disabled = true;
                selectElement.appendChild(defaultOption);

                // Tạo và thêm các phần tử <option> dựa trên dữ liệu từ API
                wards.forEach(ward => {
                    const optionElement = document.createElement('option');
                    optionElement.value = `${ward.WardCode}-${ward.WardName}`;
                    optionElement.textContent = ward.WardName;
                    selectElement.appendChild(optionElement);
                });
            })
            .catch(error => {
                console.error(error);
            });
    }

    function getMonthName(monthIndex) {
        var monthNames = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];
        return monthNames[monthIndex];
    }

    function address() {
        const province = $("#city option:selected").text();
        const district = $("#district option:selected").text();
        const ward = $("#ward option:selected").text();
        const address = ward + ", " + district + ", " + province;
        const element = document.getElementById("transit_to");
        element.innerHTML = address;
    }

    function getLeadTime() {
        const selectedDistrict = document.getElementById('district').value;
        const selectedWard = document.getElementById('ward').value;
        const [districtID, districtName] = selectedDistrict.split('-');
        const [wardID, wardName] = selectedWard.split('-');
        console.log(selectedWard)
        const requestData = {
            DistrictID: districtID,
            WardID: wardID,
        };
        fetch('./api?action=getLeadTime', {
            method: 'POST',
            headers: {
                Authorization: 'Bearer ' + access_token,
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                address();
                const leadTime = data.data
                const element = document.getElementById("transit_time");

                leadTime.forEach(time => {
                    var date = new Date(time.formattedDate);
                    console.log(date)
                    var dayIndex = date.getDay();
                    console.log(dayIndex)
                    var formattedDate = "";

                    if (dayIndex === 0) {
                        formattedDate = "CN, " + date.getDate() + " Tháng " + (date.getMonth() + 1) + " " + date.getFullYear();
                    } else {
                        formattedDate = "T" + (dayIndex + 1) + ", " + date.getDate() + " Tháng " + (date.getMonth() + 1) + " " + date.getFullYear();
                    }
                    element.innerHTML = formattedDate;
                })
                getShippingCosts();
            })
            .catch(error => {
                console.error(error);
            });
    }

    function getShippingCosts() {
        const selectedDistrict = document.getElementById('district').value;
        const selectedWard = document.getElementById('ward').value;
        const [districtID, districtName] = selectedDistrict.split('-');
        const [wardID, wardName] = selectedWard.split('-');
        console.log(selectedWard)
        const requestData = {
            DistrictID: districtID,
            WardID: wardID,
        };
        fetch('./api?action=getShippingCosts', {
            method: 'POST',
            headers: {
                Authorization: 'Bearer ' + access_token,
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                console.log(data)
                const costs = data.data;
                const element = document.getElementById("costs");
                let dong = Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'});
                costs.forEach(item => {
                    element.innerHTML = dong.format(item.service_fee);
                })
                let total = document.getElementById("total");
                let totalAmount = parseInt(total.textContent.replace(/[.,₫]/g, ""));

                let transit_cost = document.getElementById("costs");
                let costAmount = parseInt(transit_cost.textContent.replace(/[.,₫]/g, ""));

                let newTotalAmount = totalAmount + costAmount;

                total.innerHTML = dong.format(newTotalAmount);

                let inputElement = document.getElementById("shipping_costs");
                inputElement.value = costAmount;
            })
            .catch(error => {
                console.error(error);
            });
    }

    function registerTransports() {
        const selectedDistrict = document.getElementById('district').value;
        const selectedWard = document.getElementById('ward').value;
        const [districtID, districtName] = selectedDistrict.split('-');
        const [wardID, wardName] = selectedWard.split('-');
        console.log(selectedWard)
        const requestData = {
            DistrictID: districtID,
            WardID: districtName,
        };
        fetch('./api?action=registerTransports', {
            method: 'POST',
            headers: {
                Authorization: 'Bearer ' + access_token,
                'Content-Type': 'application/json',
                'Accept': 'application/json'
            },
            body: JSON.stringify(requestData)
        })
            .then(response => response.json())
            .then(data => {
                console.log(data);
            })
            .catch(error => {
                console.error(error);
            });
    }

</script>
<script src="js/main.js"></script>
<script src="js/checkout.js"></script>
</html>
