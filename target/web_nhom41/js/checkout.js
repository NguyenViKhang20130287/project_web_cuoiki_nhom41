//register
var checkBox_newAcc = document.querySelector('#newAccount');
var div_newAcc = document.querySelector('.newAccount');

checkBox_newAcc.addEventListener('click', function () {
    if (checkBox_newAcc.checked == true) {

        div_newAcc.style.display = 'block';
    } else {
        div_newAcc.style.display = 'none';
    }
})

function resetDistrict() {
    document.querySelector("select#district").innerHTML = "<option value=\"\" selected disabled>Chọn Quận / Huyện</option>";
}

document.querySelector('#district').addEventListener('mousedown', function () {
    document.querySelector("select#district").innerHTML = "<option value=\"\" selected disabled>Chọn Quận / Huyện</option>";
    resetWard();
});
document.querySelector('#district').addEventListener('mouseup', function () {
    var city = document.querySelector("select#city").value;
    fetch("https://provinces.open-api.vn/api/p/search/?q=" + city)
        .then((data) => data.json())
        .then(data => {
            var code = data[0].code;
            fetch("https://provinces.open-api.vn/api/p/" + code + "?depth=2")
                .then((data2) => data2.json())
                .then(data2 => {
                    for (let i = 0; i < data2.districts.length; i++) {
                        const district = `<option value="${data2.districts[i].name}">${data2.districts[i].name}</option>`;
                        document.querySelector("select#district").insertAdjacentHTML('beforeend', district);
                    }
                })
        })
});

function resetWard() {
    document.querySelector("select#ward").innerHTML = " <option value=\"\" selected disabled>Chọn Phường / Xã</option>";
}

document.querySelector('#ward').addEventListener('mousedown', function () {
    document.querySelector("select#ward").innerHTML = " <option value=\"\" selected disabled>Chọn Phường / Xã</option>";
});
document.querySelector('#ward').addEventListener('mouseup', function () {
    var district = document.querySelector("select#district").value;
    fetch("https://provinces.open-api.vn/api/d/search/?q=" + district)
        .then((data) => data.json())
        .then(data => {
            var code = data[0].code;
            fetch("https://provinces.open-api.vn/api/d/" + code + "?depth=2")
                .then((data2) => data2.json())
                .then(data2 => {
                    for (let i = 0; i < data2.wards.length; i++) {
                        const ward = `<option value="${data2.wards[i].name}">${data2.wards[i].name}</option>`;
                        document.querySelector("select#ward").insertAdjacentHTML('beforeend', ward);
                    }
                })
        })
});
// login
var login_span = document.querySelector('#login');
var div_login = document.querySelector('.checkout-login');

login_span.addEventListener('click', function (event) {

    if (div_login.style.display === 'none') {

        div_login.style.display = 'block';

    } else {
        div_login.style.display = 'none';
    }
})
// coupon
var coupon_span = document.querySelector('#coupon')
var coupon = document.querySelector('#useCoupon')

coupon_span.addEventListener('click', function () {
    if (coupon.style.display === 'none') {

        coupon.style.display = 'block';

    } else {
        coupon.style.display = 'none';
    }
})
// collapsible

if (content.style.display === "block") {
    content.style.display = "none";
} else {
    content.style.display = "block";
}

function payment(id) {
    var cliked = document.getElementById(id);
    var a = document.querySelector('.content' + cliked.id.substring(cliked.id.length - 1))
    var count = document.getElementsByClassName('show').length


    if (count > 0) {
        document.querySelector('.content1').classList.remove('show');
        document.querySelector('.content2').classList.remove('show');
        document.querySelector('.content3').classList.remove('show');
    }
    if (a.classList.contains('show')) {
        a.classList.remove('show')

    } else {
        a.classList.add('show')
    }

}

function checkout() {

    $.ajax({
        url: "/web_nhom41_war/CheckoutControl",
        type: "get",
        data: {},
        success: function (data) {
            document.body.innerHTML += data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}




