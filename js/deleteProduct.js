//var webServiceRoot = "http://localhost:8080/webServiceDB/";
var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getProduct.php";
var id;

$(document).ready(function () {    
    $("#alertDiv").hide();
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    $.getJSON(uriGetUserRole).done(function (data) {  
        console.log(data);            
        $('#licorID').val(data.Product[0].idLicor);           
        $('#annejadoLicor').val(data.Product[0].nombreLicor);           
        $('#procedenciaLicor').val(data.Product[0].descripcion);           
        $('#licorName').val(data.Product[0].nombre);           
        $('#licorPrice').val(data.Product[0].annos);           
        $('#licorOld').val(data.Product[0].precio);           
    });    
});

function deleteProduct() {
    descripcion = $('#txtAnnejadoDescripcion').val();
    uriGetUserRole = webServiceRoot + "deleteProduct.php?id=" + id;       
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log("a" + data);
        window.location = "products.html";             
    });    
}

function canccelOperation() {
    window.location = "products.html";    
}