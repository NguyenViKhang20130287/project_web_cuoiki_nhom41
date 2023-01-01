function quantity(id, idProduct) {
    var value = document.getElementById(id).innerHTML;
    var browserWidth = window.innerWidth;
    var divId = "";
    if (browserWidth > 428) {
        divId = "productContainer";
    } else {
        divId = "productContainer2";
    }
    var price = document.getElementById(divId);
    $.ajax({
        url: "/web_nhom41_war/CartQuantityControl",
        type: "get",
        data: {
            operator: value,
            pid: idProduct,
            browserWidth: browserWidth
        },
        success: function (data) {
            price.innerHTML = data;
            $.ajax({
                url: "/web_nhom41_war/CartQuantityControl",
                type: "POST",
                success: function (data) {
                    var total = document.getElementById("CartTotalsID");
                    total.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function DeleteItem(idProduct) {
    var cartQuantity = document.getElementById("cartQuantity");
    var browserWidth = window.innerWidth;
    var divId = "";
    if (browserWidth > 428) {
        divId = "productContainer";
    } else {
        divId = "productContainer2";
    }
    var cartTable = document.getElementById(divId);

    $.ajax({
        url: "/web_nhom41_war/DeleteProductControl",
        type: "post",
        data: {
            productId: idProduct,
            browserWidth: browserWidth
        },
        success: function (data) {
            cartTable.innerHTML = data;
            $.ajax({
                url: "/web_nhom41_war/CartQuantityControl",
                type: "POST",
                success: function (data) {
                    var total = document.getElementById("CartTotalsID");
                    total.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
            $.ajax({
                url: "/web_nhom41_war/DeleteProductControl",
                type: "get",
                data: {},
                success: function (data) {
                    cartQuantity.innerHTML = data;
                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function DeleteAllItem() {
    var cartQuantity = document.getElementById("cartQuantity");
    var cartTable1 = document.getElementById("productContainer");
    var cartTable2 = document.getElementById("productContainer2");

    $.ajax({
        url: "/web_nhom41_war/DeleteAllItemCartControl",
        type: "post",
        success: function (data) {
            cartTable1.innerHTML = data;
            cartTable2.innerHTML = data;
            cartQuantity.innerHTML = "<a href=\"cart.jsp\"><i class=\"fa-solid fa-bag-shopping\"></i>Giỏ hàng(0)</a>";
            $.ajax({
                url: "/web_nhom41_war/DeleteAllItemCartControl",
                type: "get",
                success: function (data) {
                    var total = document.getElementById("CartTotalsID");
                    total.innerHTML = data;

                },
                error: function (xhr) {
                    //Do Something to handle error
                }
            });

        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}