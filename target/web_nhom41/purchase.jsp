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
    <link rel="stylesheet" href="css/purchase.css">
    <title>Đơn hàng của bạn</title>

</head>

<body>
<%
    PurchaseDAO purchaseDAO = new PurchaseDAO();
    Account accSession = (Account) session.getAttribute("Account");
    String username = "";
    if (accSession != null) {
        username = accSession.getUsername();
    }
    int userId = purchaseDAO.getUserID(username);
    List<OrderUser> listAll = purchaseDAO.getDataPurchase(userId);
    List<OrderUser> listToPay = purchaseDAO.getListStatus(userId, 1);
    List<OrderUser> listToReceive = purchaseDAO.getListStatus(userId, 2);
    List<OrderUser> listComplete = purchaseDAO.getListStatus(userId, 3);
    List<OrderUser> listCancel = purchaseDAO.getListStatus(userId, 4);
    Locale locale = new Locale("vi", "VN");
    NumberFormat numberFormat = NumberFormat.getCurrencyInstance(locale);
%>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Đơn hàng của bạn</h1>
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
            <li><a href="">Đơn hàng của bạn</a></li>
        </ul>
    </div>
    <div class="body_page-main">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#all">Tất cả(<%=listAll.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#toPay">Chờ thanh toán(<%=listToPay.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#toReceive">Đang giao hàng(<%=listToReceive.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#completed">Hoàn thành(<%=listComplete.size()%>)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#cancelled">Đã hủy(<%=listCancel.size()%>)</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane container active" id="all">
                <%
                    if (listAll.size() != 0) {
                        for (int i = 0; i < listAll.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p class="status"><%=new PurchaseDAO().getmessage(listAll.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listAll.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listAll.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listAll.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listAll.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listAll.get(i).getListItem().get(j).getId()%>">
                                <p><%=listAll.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listAll.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><% if (listAll.get(i).getListItem().get(j).getDiscount() != 0) {%>
                                <s class="price"><%=numberFormat.format(listAll.get(i).getListItem().get(j).getPrice()) %></s>
                                <% }%>
                                <p class="itemDiscount"> <%=listAll.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listAll.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listAll.get(i).getListItem().get(j).getPrice())%></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listAll.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listAll.get(i).getId()%>">Xem thêm</a>
                        </button>
                    </div>
                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>
            </div>
            <div class="tab-pane container fade" id="toPay">
                <%
                    if (listToPay.size() != 0) {
                        for (int i = 0; i < listToPay.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p class="status"><%=new PurchaseDAO().getmessage(listToPay.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listToPay.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listToPay.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listToPay.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listToPay.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listToPay.get(i).getListItem().get(j).getId()%>">
                                <p><%=listToPay.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listToPay.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listToPay.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToPay.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listToPay.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToPay.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listToPay.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listToPay.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listToPay.get(i).getId()%>">Xem thêm</a>
                        </button>
                    </div>
                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>
            </div>
            <div class="tab-pane container fade" id="toReceive">
                <%
                    if (listToReceive.size() != 0) {
                        for (int i = 0; i < listToReceive.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p
                                class="status"><%=new PurchaseDAO().getmessage(listToReceive.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listToReceive.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listToReceive.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listToReceive.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listToReceive.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listToReceive.get(i).getListItem().get(j).getId()%>">
                                <p><%=listToReceive.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listToReceive.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listToReceive.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToReceive.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listToReceive.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listToReceive.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listToReceive.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listToReceive.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listToReceive.get(i).getId()%>">Xem thêm</a>
                        </button>
                    </div>

                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>

            </div>
            <div class="tab-pane container fade" id="completed">
                <%--                đã hoàn thành--%>
                <%
                    if (listComplete.size() != 0) {
                        for (int i = 0; i < listComplete.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p
                                class="status"><%=new PurchaseDAO().getmessage(listComplete.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listComplete.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listComplete.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listComplete.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listComplete.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listComplete.get(i).getListItem().get(j).getId()%>">
                                <p><%=listComplete.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listComplete.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listComplete.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listComplete.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listComplete.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listComplete.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listComplete.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listComplete.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listComplete.get(i).getId()%>">Xem thêm</a>
                        </button>
                    </div>

                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>

            </div>
            <div class="tab-pane container fade" id="cancelled">
                <%--                đơn đã hủy--%>
                <%
                    if (listCancel.size() != 0) {
                        for (int i = 0; i < listCancel.size(); i++) {
                %>
                <div class="orderContainer">
                    <div class="orderStatus">
                        <span> <p
                                class="status"><%=new PurchaseDAO().getmessage(listCancel.get(i).getStatus()) %></p> | <p
                                id="orderStatus"><%=listCancel.get(i).getStatus() %></p></span>
                    </div>
                    <div class="line"></div>
                    <%
                        for (int j = 0; j < listCancel.get(i).getListItem().size(); j++) {

                    %>
                    <div class="orderInfo">
                        <div class="orderImg">
                            <a href="product-detail?product_id=<%=listCancel.get(i).getListItem().get(j).getId()%>">
                                <img src="<%=listCancel.get(i).getListItem().get(j).getThumbnail() %>" alt="">
                            </a>
                        </div>
                        <div class="orderTitle">
                            <a href="product-detail?product_id=<%=listCancel.get(i).getListItem().get(j).getId()%>">
                                <p><%=listCancel.get(i).getListItem().get(j).getTitle() %>
                                </p>
                            </a>
                            <p class="itemQuantity">x<%=listCancel.get(i).getListItem().get(j).getQuantity() %>
                            </p>
                        </div>
                        <div class="itemPrice">
                            <span><s
                                    class="price"><%=listCancel.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listCancel.get(i).getListItem().get(j).getPrice()) : "" %></s> <p
                                    class="itemDiscount"> <%=listCancel.get(i).getListItem().get(j).getDiscount() != 0 ? numberFormat.format(listCancel.get(i).getListItem().get(j).getDiscount()) : numberFormat.format(listCancel.get(i).getListItem().get(j).getPrice()) %></p></span>
                        </div>
                    </div>
                    <%
                        }
                    %>
                    <div class="orderPrice">
                        <span>
                        <i class="fa-solid fa-shield-halved"></i> Order Total: <p
                                class="orderTotal"><%=numberFormat.format(listCancel.get(i).getTotal()) %></p>
                        </span>
                    </div>
                    <div class="orderButtonGroup">
                        <button><a href="orderDetailControl?orderDetail=<%=listCancel.get(i).getId()%>">Xem thêm</a>
                        </button>
                    </div>

                </div>

                <%
                    }
                } else {
                %>
                <h1>BẠN CHƯA CÓ ĐƠN NÀO</h1>
                <% }%>

            </div>
        </div>

    </div>

</div>

<!-- footer page -->
<%@include file="foooter.jsp"%>
<script src="js/jquery-3.6.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
