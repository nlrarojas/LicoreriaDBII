//var webServiceRoot = "http://localhost:8080/webServiceDB/";
var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getAnnjeado.php";
var id;

$(document).ready(function () {    
    $("#alertDiv").hide();
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    $.getJSON(uriGetUserRole).done(function (data) {  
        console.log(data);            
        $('#idAnnejado').val(data.Annejado[0].idTipoAnejado);           
        $('#txtAnnejadoDescripcion').val(data.Annejado[0].descripcion);           
    });    
});

function deleteAnnejado() {
    descripcion = $('#txtAnnejadoDescripcion').val();
    uriGetUserRole = webServiceRoot + "deleteAnnejado.php?id=" + id;       
    $.getJSON(uriGetUserRole).done(function (data) {              
        if (data.length == 0){
            $("#alertDiv").show();
        } else {
            window.location = "annejados.html";     
        }        
    });    
}

function canccelOperation() {
    window.location = "annejados.html";    
}