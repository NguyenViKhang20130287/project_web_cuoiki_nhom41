<%@ page import="java.util.Objects" %>
<%@ page import="vn.edu.hcmuaf.fit.entity.CartItem" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="css/about.css">
    <title>Giới thiệu</title>

</head>

<body>
<%--header page--%>
<%@include file="header.jsp" %>

<!--banner-->
<div class="banner">
    <h1>Giới thiệu</h1>
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
            <li><a href="">Giới thiệu</a></li>
        </ul>
    </div>
    <div class="body_page-main">
        <div class="welcome_container">
            <div class="left_container">
                <h1>Chào mừng tới với GemStore!</h1>
                <p>GemStore là địa chỉ uy tín, tin cậy để khách hàng có thể an tâm chọn lựa được những viên đá
                    quý thật
                    mà đảm bảo 100% về tiêu chuẩn. Ngọc Gems luôn tâm niệm: Sản phẩm phải xuất phát từ tâm.
                    Không chỉ là người kinh doanh, chúng tôi còn là những người yêu thích và sưu tầm đá quý.

                    Từ những viên đá thô ráp, lẫn tạp chất đất mùn, qua các công đoạn chế tác thành vòng tay,
                    khuyên tai, nhẫn, mặt dây những sản phẩm về đá quý được đưa vào sử dụng rộng rãi. Hiểu được
                    điều đó Ngọc chế tác những viên đá thành trang sức sao cho phù hợp nhất với từng đối tượng
                    khách hàng. <br>
                    Không chỉ phát triển thị trường trong nước, thương hiệu của cô nàng sinh năm 1995 đang từng
                    ngày sải bước trên thương trường quốc tế.

                    Thừa hưởng nền tảng vững chắc, Ngọc sớm tiếp xúc, gặp gỡ với khách hàng nước ngoài rất
                    nhiều, và đưa thương hiệu Ngọc Gems đến các nước như Ấn Độ, Hồng Kông, Thái Lan, Trung
                    Quốc.... Năm nào Ngọc Gems cũng tham dự Hội chợ Đá quý thế giới tại Thái Lan. Tại đây, Ngọc
                    được trao đổi, học hỏi và làm việc với các đối tác nước ngoài, đưa những ý tưởng về dòng sản
                    phẩm của mình và đối tác rất thích thú với cách phát triển dự án của một cô gái trẻ trung,
                    năng động, vốn kiến thức rộng.
                </p>
                <button id="view"><a href="home">Tới cửa hàng</a></button>
            </div>
            <div class="right_container">
                <img src="img/about_page/about_pic.jpg" alt="">
            </div>
        </div>
        <div class="counter_container">
            <div class="counter">
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>2170</h2>
                        <p>KHÁCH HÀNG HÀI LÒNG</p>
                    </div>
                </div>
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count2.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>8080</h2>
                        <p>GIẢI THƯỞNG</p>
                    </div>
                </div>
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count3.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>2150</h2>
                        <p>SỐ GIỜ LÀM VIỆC</p>
                    </div>
                </div>
                <div class="counter_item">
                    <div class="counter_img">
                        <img src="img/about_page/count4.png" alt="">
                    </div>
                    <div class="counter_info">
                        <h2>2170</h2>
                        <p>DỰ ÁN ĐÃ HOÀN THIỆN</p>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<!-- footer page -->
<%@include file="foooter.jsp"%>
</body>
<script src="js/main.js"></script>

</html>