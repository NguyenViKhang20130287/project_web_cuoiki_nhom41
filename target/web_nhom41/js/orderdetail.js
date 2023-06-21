var button = document.getElementById("cancelButton");
var cancelButtonStatus = 0;
function showConfirm() {
    if (cancelButtonStatus == 0) {
        document.querySelector(".confirmCancel").style.display = "flex";
        cancelButtonStatus = 1;
    } else {
        if (cancelButtonStatus == 1) {
            document.querySelector(".confirmCancel").style.display = "none";
            cancelButtonStatus = 0;
        }
    }
}
function payButton(orderId) {
    var status = document.querySelector(".orderStatus");
    var buttonContainer = document.querySelector(".buttonContainer");
    $.ajax({
        url: "/web_nhom41_war/PayButtonControl",
        type: "post",
        data: {
            orderId: orderId,
        },
        success: function (data) {
            status.innerHTML = data;
            $.ajax({
                url: "/web_nhom41_war/PayButtonControl",
                type: "get",
                data: {
                    orderId: orderId,
                },
                success: function (data) {
                    buttonContainer.innerHTML = data;

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
