// Lọc theo giá
const rangeInput = document.querySelectorAll(".range-input input"),
    priceInput = document.querySelectorAll(".price-input input"),
    range = document.querySelector(".slider .progress");
let priceGap = 1000;
let priceFilter = 0;
priceInput.forEach(input => {
    input.addEventListener("input", e => {
        let minPrice = parseInt(priceInput[0].value),
            maxPrice = parseInt(priceInput[1].value);
        if ((maxPrice - minPrice >= priceGap) && maxPrice <= rangeInput[1].max && minPrice >= rangeInput[0].min) {
            if (e.target.className === "input-min") {
                rangeInput[0].value = minPrice;
                console.log(rangeInput[0].value)
                range.style.left = (((minPrice - rangeInput[0].min) / (rangeInput[0].max - rangeInput[0].min)) * 100) + "%";
            } else {
                rangeInput[1].value = maxPrice;
                range.style.right = 100 - ((maxPrice - rangeInput[1].min) / (rangeInput[1].max - rangeInput[1].min)) * 100 + "%";
            }
        }
    });
});
rangeInput.forEach(input => {
    input.addEventListener("mouseleave", e => {
        if (priceFilter != e.target.value) {
            $.ajax({
                url: "/web_nhom41_war/product?action=listProduct",
                type: "get",
                success: function (data) {
                    let min = rangeInput[0].value;
                    let max = rangeInput[1].value;
                    let rs = "";
                    let arrData = JSON.parse(data)
                    arrData.map((tmp) => {
                        // Kiểm tra điều kiện
                        if (tmp.discount <= max && tmp.discount >= min) {
                            let dis = tmp.discount.toLocaleString('vi-VN', {
                                style: 'currency',
                                currency: 'VND'
                            })
                            let price = tmp.price.toLocaleString('vi-VN', {
                                style: 'currency',
                                currency: 'VND'
                            })
                            rs += `
                                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
    <div class="body_page-trending-product-list-card">
        <div class="card-image">
            <a href="product-detail?product_id=${tmp.id}"><img src="${tmp.thumbnail}" alt=""></a>
        </div>
        <div class="card-title-price">
            <p>
                ${tmp.title}
            </p>
            <span>
            
                ${dis}
            </span>
            <span style="margin-left: 10px; color: #6c6c6c"><strike>
                ${price}
                </strike></span>
        </div>
        <div class="card-btn">
            <button><a href="product-detail?product_id=${tmp.id}">Chi tiết</a>
            </button>
            <button onclick="addtocart(${tmp.id})">Thêm vào giỏ</button>
        </div>
    </div>
</div>
                            `
                        }
                    })
                    document.getElementById("products").innerHTML = rs
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
            priceFilter = e.target.value
        }

    });
});

rangeInput.forEach(input => {
    input.addEventListener("input", e => {
        let minVal = parseInt(rangeInput[0].value),
            maxVal = parseInt(rangeInput[1].value);
        if ((maxVal - minVal) < priceGap) {
            if (e.target.className === "range-min") {
                rangeInput[0].value = maxVal - priceGap
            } else {
                rangeInput[1].value = minVal + priceGap;
            }
        } else {
            priceInput[0].value = minVal;
            priceInput[1].value = maxVal;
            range.style.left = (((minVal - rangeInput[0].min) / (rangeInput[0].max - rangeInput[0].min)) * 100) + "%";
            range.style.right = 100 - ((maxVal - rangeInput[1].min) / (rangeInput[1].max - rangeInput[1].min)) * 100 + "%";
        }
    });
});

// Hiển thị danh sách sản phẩm từng trang
$(document).ready(function () {
    $('.tab-content-item').hide();
    $('.tab-content-item:first-child').fadeIn();
    $('.pagination .page-item').click(function () {
        //active nav tabs
        $('.pagination .page-item').removeClass('active');
        $(this).addClass('active');
        //show tab-content item
        let id_tab_content = $(this).children('a').attr('href');
        //alert
        $('.tab-content-item').hide();
        $(id_tab_content).fadeIn();
        return false;

    });
});

function addtocart(idProduct) {
    var cartQuantity = document.getElementById("cartQuantity");
    console.log(idProduct);
    $.ajax({
        url: "/web_nhom41_war/addtocart",
        type: "post",
        data: {
            inputId: idProduct
        },
        success: function (data) {
            cartQuantity.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

//
const sortBy = document.querySelectorAll("#mySelect option")
var arr = new Array();
$('#mySelect option').each(function(){
    arr.push($(this).val());
});
console.log(arr)
sortBy.forEach(value=> {
    value.addEventListener("onclick", e => {
        if (val != e.target.value) {
            $.ajax({
                url: "/web_nhom41_war/product?action1=sortListProduct",
                type: "get",
                success: function (data) {
                    let rs = "";
                    let arrData = JSON.parse(data)
                    console.log(arrData)
                    arrData.map((tmp) => {
                        // Kiểm tra điều kiện
                        switch (value) {
                            case "atoz":
                                arrData.sort(function (tmp1, tmp2) {
                                    return tmp1.id - tmp2.id;
                                });
                                console.log(arrData)
                                break;
                            default:
                                break;
                        }
                        rs += `
                                <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
    <div class="body_page-trending-product-list-card">
        <div class="card-image">
            <a href="product-detail?product_id=${tmp.id}"><img src="${tmp.thumbnail}" alt=""></a>
        </div>
        <div class="card-title-price">
            <p>
                ${tmp.title}
            </p>
            <span>
            
                ${dis}
            </span>
            <span style="margin-left: 10px; color: #6c6c6c"><strike>
                ${price}
                </strike></span>
        </div>
        <div class="card-btn">
            <button><a href="product-detail?product_id=${tmp.id}">Chi tiết</a>
            </button>
            <button onclick="addtocart(${tmp.id})">Thêm vào giỏ</button>
        </div>
    </div>
</div>
                            `

                    })
                    document.getElementById("products").innerHTML = rs
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
            val = e.target.value;
            console.log(val)
        }
    })
});


