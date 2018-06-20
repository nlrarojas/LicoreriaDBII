var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
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

function updatePayment() {
    descripcion = $('#txtPaymentDescription').val();
    uriGetUserRole = webServiceRoot + "updatePayment.php?id=" + id + '&des=' + descripcion;    
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log(data);
        window.location = "paymentsStyle.html";    
    });
    window.location = "paymentsStyle.html";
}

function canccelOperation() {
    window.location = "paymentsStyle.html";
}