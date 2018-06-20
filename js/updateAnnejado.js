var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getAnnjeado.php";
var id;

$(document).ready(function () {    
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    console.log(uriGetUserRole);
    $.getJSON(uriGetUserRole).done(function (data) {  
        console.log(data);            
        $('#idAnnejado').val(data.Annejado[0].idTipoAnejado);           
        $('#txtAnnejadoDescripcion').val(data.Annejado[0].descripcion);           
    });    
});

function updateAnnejado() {
    descripcion = $('#txtAnnejadoDescripcion').val();
    uriGetUserRole = webServiceRoot + "updateAnnejado.php?id=" + id + '&des=' + descripcion;    
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log(data);
        window.location = "annejados.html";    
    });    
}

function canccelOperation() {
    window.location = "annejados.html";
}