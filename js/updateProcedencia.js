var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getProcedencia.php";
var id;

$(document).ready(function () {    
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    $.getJSON(uriGetUserRole).done(function (data) {              
        $('#idProce').val(data.Procedencia[0].idProcedencia);           
        $('#txtProcedenciaName').val(data.Procedencia[0].nombre);           
    });    
});

function updateProcedencia() {
    descripcion = $('#txtProcedenciaName').val();
    uriGetUserRole = webServiceRoot + "updateProcedencia.php?id=" + id + '&nombre=' + descripcion;    
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log(data);
        window.location = "procedencias.html";    
    });    
}

function canccelOperation() {
    window.location = "procedencias.html";
}