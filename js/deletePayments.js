var webServiceRoot = "http://localhost:8080/webServiceDB/";
var uriGetUserRole = webServiceRoot + "getPayment.php";
var id;

$(document).ready(function () {    
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    $.getJSON(uriGetUserRole).done(function (data) {              
        $('#idPay').val(data.Payment[0].idTipoPago);           
        $('#txtPaymentDescription').val(data.Payment[0].descripcion);           
    });    
});

function deletePayment() {
    uriGetUserRole = webServiceRoot + "deletePayment.php?id=" + id;
    $.getJSON(uriGetUserRole).done(function (data) {              
        window.location = "paymentsStyle.html";    
    });
}

function canccelOperation() {
    window.location = "paymentsStyle.html";
}