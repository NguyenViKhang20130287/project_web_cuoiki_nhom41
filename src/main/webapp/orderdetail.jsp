<%--
  Created by IntelliJ IDEA.
  User: Khanh
  Date: 3/31/2023
  Time: 10:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.PurchaseDAO" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.OrderUser" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Account" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.dao.orderdetailDAO" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/orderdetail.css">
    <title>Chi tiết đơn hàng</title>

</head>

<body>
<%
    PurchaseDAO purchaseDAO = new PurchaseDAO();
    orderdetailDAO orderdetailDAO = new orderdetailDAO();
    Account accSession = (Account) session.getAttribute("Account");
    String username = "";
    if (accSession != null) {
        username = accSession.getUsername();
    }
    int userId = purchaseDAO.getUserID(username);
    int orderId = (int) request.getAttribute("orderId");
    String status = orderdetailDAO.getStatusName(orderId).toUpperCase();
    String fullname = orderdetailDAO.getFullname(orderId);
    String phone = orderdetailDAO.getPhone(orderId);
    String address = orderdetailDAO.getAddress(orderId);
    String paymentMethod = orderdetailDAO.getPaymentMethod(orderId);
    String email = orderdetailDAO.getEmail(orderId);
    String orderDate = orderdetailDAO.getOrderDate(orderId);
    int total = orderdetailDAO.getTotal(orderId);
    int statusId = orderdetailDAO.getStatusId(orderId);
    List<Product> listProduct = purchaseDAO.getListItem(orderId);
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Chi tiết đơn hàng</h1>
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
            <li><a href="">Chi tiết đơn hàng</a></li>
        </ul>
    </div>
    <div class="body_page-main">
        <div class="detail">
            <div class="statusContainer">
                <button class="back">
                    <a href="purchase.jsp"> <i class="fa-solid fa-arrow-left"></i> BACK</a>
                </button>
                <div class="status">
                    <div class="orderId">
                        ORDER ID: <%=orderId %>
                    </div>
                    <div class="orderStatus">
                        | <%=status%>
                    </div>
                </div>
            </div>
            <div class="headerline"></div>
            <div class="addressInfo">
                <div class="addressContainer">
                    <h4 style="font-weight: bolder;margin-bottom: 30px;">ĐỊA CHỈ NHẬN HÀNG</h4>
                    <p style="color: black">Tên người nhận: <%=fullname%>
                    </p>
                    <%if (!email.equals("")) {%>
                    <p>Email: <%=email%>
                    </p>
                    <% }%>
                    <p>Số điện thoại: <%=phone %>
                    </p>
                    <p>Địa chỉ: <%=address%>
                    </p>
                    <p>Ngày đặt hàng: <%=orderDate %>
                    </p>
                </div>
                <div class="buttonContainer">
                    <% if (statusId == 1) {%>
                    <button onclick="payButton(<%=orderId%>)">Thanh toán</button>
                    <% }%>
                    <% if (statusId < 3) {%>
                    <button id="cancelButton" onclick="showConfirm()">Hủy đơn hàng</button>
                    <div class="confirmCancel">
                        Xác nhận hủy?
                        <button class="confirmButton" onclick="cancelButton(<%=orderId%>)">Hủy</button>
                    </div>
                    <% }%>
                </div>
            </div>
            <div class="items">
                <div class="lineGray"></div>
                <%
                    for (int i = 0; i < listProduct.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listProduct.get(i).getId() %>">
                                <img src="<%=listProduct.get(i).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listProduct.get(i).getId() %>">
                                <p><%= listProduct.get(i).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listProduct.get(i).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listProduct.get(i).getDiscount() != 0 ? numberFormat.format(listProduct.get(i).getPrice()) : ""%></s> <p
                                    class="itemDiscount"> <%=listProduct.get(i).getDiscount() != 0 ? numberFormat.format(listProduct.get(i).getDiscount()) : numberFormat.format(listProduct.get(i).getPrice())%></p></span>
                        </div>
                    </div>

                </div>
                <% }%>
                <div class="totalPrice">
                    <div class="totalRow">
                        <div class="totalLeft">
                            <span>Tổng tiền hàng</span>
                        </div>
                        <div class="totalRight">
                            <div><%=numberFormat.format(total)%>
                            </div>
                        </div>
                    </div>
                    <div class="totalRow">
                        <div class="totalLeft">
                            <span>Giảm giá</span>
                        </div>
                        <div class="totalRight">
                            <div>0</div>
                        </div>
                    </div>
                    <div class="totalRow">
                        <div class="totalLeft">
                            <span>Thành tiền</span>
                        </div>
                        <div class="totalRight">
                            <div><%=numberFormat.format(total)%>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="paymentMethod">
                    <div class="paymentContainer">
                        <div class="paymentLeft">
                            <i class="fa-solid fa-shield-halved" style="color: red"></i> Phương thức Thanh toán
                        </div>
                        <div class="paymentRight">
                            <%=paymentMethod%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- footer page -->
<%@include file="foooter.jsp"%>

<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<script src="js/orderdetail.js"></script>
</body>
</html>
