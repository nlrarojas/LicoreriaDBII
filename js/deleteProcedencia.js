var webServiceRoot = "http://localhost:8080/webServiceDB/";
var uriGetUserRole = webServiceRoot + "getProcedencia.php";
var id;

$(document).ready(function () {    
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    $.getJSON(uriGetUserRole).done(function (data) {  
        console.log(data);            
        $('#idProce').val(data.Procedencia[0].idProcedencia);           
        $('#txtProcedenciaName').val(data.Procedencia[0].nombre);           
    });    
});

function deleteProcedencia() {
    descripcion = $('#txtProcedenciaName').val();
    uriGetUserRole = webServiceRoot + "deleteProcedencia.php?id=" + id + '&nombre=' + descripcion;    
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log(data);
        window.location = "procedencias.html";    
    });    
}

function canccelOperation() {
    window.location = "procedencias.html";
}