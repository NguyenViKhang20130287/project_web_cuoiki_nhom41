// Hiển thị hình ảnh chi tiết của sản phẩm
const allHoverImages = document.querySelectorAll('.hover_container div img');
const imgContainer = document.querySelector('.img_container');
let quantityAdded = document.getElementById('added');
window.addEventListener('DOMContentLoaded', () => {
    allHoverImages[0].parentElement.classList.add('active');
});
allHoverImages.forEach((image) => {
    image.addEventListener('mouseover', () => {
        imgContainer.querySelector('img').src = image.src;
        resetActiveImg();
        image.parentElement.classList.add('active');
    });
});

function resetActiveImg() {
    allHoverImages.forEach((img) => {
        img.parentElement.classList.remove('active');
    });
}

// Số lượng sản phẩm
$(".button").on("click", function () {

    var $button = $(this);
    var oldValue = $button.parent().find("input").val();
    let remain = document.getElementById('remain');
    let message = document.getElementById('checkQuantity');
    message.innerHTML = "";
    if ($button.text() == "+") {
        if (parseFloat(oldValue) < remain.innerHTML) {
            var newVal = parseFloat(oldValue) + 1;
        } else {
            newVal = parseFloat(remain.innerHTML);
        }
    } else {
        if (oldValue > 1) {
            var newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 1;
        }
    }

    $button.parent().find("input").val(newVal);

});
// Chuyển đổi tab
$(document).ready(function () {
    $('.tab-content-item').hide();
    $('.tab-content-item:first-child').fadeIn();
    $('.nav-tabs li').click(function () {
        //active nav tabs
        $('.nav-tabs li').removeClass('active');
        $(this).addClass('active');
        //show tab-content item
        let id_tab_content = $(this).children('a').attr('href');
        //alert
        $('.tab-content-item').hide();
        $(id_tab_content).fadeIn();
        return false;

    });
});
// Hiển thị sản phẩm liên quan
$(document).ready(function () {
    $('#autoWidth').lightSlider({
        autoWidth: true,
        loop: true,
        onSliderLoad: function () {
            $('#autoWidth').removeClass('cS-hidden');
        }
    });
});
//
// Hiển thị hướng dẫn đo size cho sản phầm nhẫn
var modal = document.getElementById("myModal");
var btn = document.getElementById("myBtn");
var spans = document.getElementsByClassName("close")[0];


function showDiv(){
    modal.style.display = "block"
}

spans.onclick = function () {
    modal.style.display = "none";
}

window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

function addtocart(idProduct) {
    var cartQuantity = document.getElementById("cartQuantity");
    let addQuantity = document.getElementById('number').value;
    let message = document.getElementById('checkQuantity');
    let remain = document.getElementById('remain');
    $.ajax({
        url: "/web_nhom41_war/addtocart",
        type: "post",
        data: {
            inputId: idProduct,
            quantity: addQuantity
        },
        success: function (data) {
            cartQuantity.innerHTML = data;
            if (parseInt(quantityAdded.innerHTML) + parseInt(addQuantity) <= parseInt(remain.innerHTML)) {
                quantityAdded.innerHTML = parseInt(quantityAdded.innerHTML) + parseInt(addQuantity);
                message.innerHTML = "Đã thêm sản phẩm vào giỏ hàng!";
            } else {
                message.innerHTML = "Hàng còn lại " + remain.innerHTML + " sản phẩm nên chỉ thêm được " + (parseInt(remain.innerHTML) - parseInt(quantityAdded.innerHTML)) + " sản phẩm vào giỏ!";
                quantityAdded.innerHTML = parseInt(remain.innerHTML);
            }
            if (message.innerHTML.includes("0 sản phẩm vào giỏ!")) {
                message.innerHTML = "Đã thêm toàn bộ sản phẩm vào giỏ hàng!";
            }
            setTimeout(function () {
                message.innerHTML = "";
            }, 3000);
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function checkQuantity(productQuantity) {
    let quantity = document.getElementById('number');
    let message = document.getElementById('checkQuantity');
    message.innerHTML = "";
    if (!isNaN(quantity.value) && productQuantity > 0) {
        if (quantity.value > productQuantity) {
            quantity.value = productQuantity;
            message.innerHTML = "Số lượng tồn kho còn lại là " + productQuantity + "!";
        } else {
            if (quantity.value < 1) {
                quantity.value = 1;
                message.innerHTML = "Số lượng chọn phải lớn hơn 1!";

            }
        }
    } else {
        if (isNaN(quantity.value)) {
            quantity.value = 1;
            message.innerHTML = "Số lượng chọn phải là một con số!";
        }
        if (productQuantity == 0) {
            quantity.value = 0;
            message.innerHTML = "Sản phẩm này đã hết hàng!";
        }
    }
    setTimeout(function () {
        message.innerHTML = "";
    }, 3000)
}
