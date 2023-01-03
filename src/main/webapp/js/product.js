// Thanh kéo lọc theo giá
var arrProduct = []
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
const render = () => {
    let rs = ``
    arrProduct.map((tmp) => {
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
    })
    document.getElementById("products").innerHTML = rs

}
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
                    arrProduct = []
                    arrData.map((tmp) => {
                        // Kiểm tra điều kiện
                        if (tmp.discount <= max && tmp.discount >= min) {
                            arrProduct.push(tmp);

                        }
                    })
                    render()
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

// Tìm kiếm sản phẩm
const searchByName = (param) => {
    var txtSearch = param.value;

    search(txtSearch)
}
const search = (txtSearch) => {
    $.ajax({
        url: "/web_nhom41_war/product?action=listProduct",
        type: "get",
        success: function (data) {

            let rs = "";
            let arrData = JSON.parse(data)
            console.log(arrData)
            arrProduct = []
            arrData.map((tmp) => {
                // Kiểm tra điều kiện
                let title = tmp.title
                if (title.toLowerCase().includes(txtSearch.trim().toLowerCase())) {
                    arrProduct.push(tmp)
                }
            })
            render()
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}
const sort = (id)=>{
    console.log(id.value)
    switch(id.value) {
        case "atoz":
            arrProduct.sort(function(a, b){
                if (a.title.toLowerCase() < b.title.toLowerCase()) {return -1;}
                if (a.title.toLowerCase() > b.title.toLowerCase()) {return 1;}
                return 0;
            });
            break;
        case "ztoa":
            // code block
            arrProduct.sort(function(a, b){
                if (a.title.toLowerCase() > b.title.toLowerCase()) {return -1;}
                if (a.title.toLowerCase() < b.title.toLowerCase()) {return 1;}
                return 0;
            });
            break;
        case "increase":
            arrProduct.sort(function(a, b){
                return a.discount - b.discount
            });
            break
        case "descrease":
            arrProduct.sort(function(a, b){
                return b.discount - a.discount
            });
            break;
        case "newest":
            arrProduct.sort(function(a, b){
                return b.id - a.id
            });
            break;
        case "oldest":
            arrProduct.sort(function(a, b){
                return a.id - b.id
            });
            break;
        default:
        // code block
            arrProduct.sort(function(a, b){
                return a.id - b.id
            });

    }

    render()

}






