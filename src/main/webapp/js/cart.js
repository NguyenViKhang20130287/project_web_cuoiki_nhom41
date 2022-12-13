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