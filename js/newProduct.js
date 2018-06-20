var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var webServiceRootLocal = "http://163.178.173.144:8080/estudiantes/licoreria/";
//var webServiceRootLocal = "http://localhost:8080/webServiceDB/";

var uriGetProcedencia = webServiceRoot + "getProcedencias.php";
var uriGetAnnejado = webServiceRoot + "getAnnejados.php";

$(document).ready(function(){
    $.ajax({
        url: uriGetAnnejado,
        processData : true,
        data: {},
        dataType: "json",
        success: function(data) {
            console.log(data);
            fillDataAnnejado(data.Annejados);
        },
        error: function(xhr) {            
        }
    });
    $.ajax({
        url: uriGetProcedencia,
        processData : true,
        data: {},
        dataType: "json",
        success: function(data) {
            console.log(data);
            fillDataProcedencia(data.Procedencias);
        },
        error: function(xhr) {            
        }
    });    
});

function fillDataProcedencia(dataTable) {
    select = document.getElementById("procedenciaLicor");
    if (select) {
        var selectContent = "";    
        for (var i = 0; i < dataTable.length; i++){                
            selectContent += "<option value="+dataTable[i].idProcedencia+">"+dataTable[i].nombre+"</option>"
        }
        select.innerHTML = selectContent;
    }
}

function fillDataAnnejado(dataTable) {
    select = document.getElementById("annejadoLicor");
    if (select) {
        var selectContent = "";    
        for (var i = 0; i < dataTable.length; i++){                
            selectContent += "<option value="+dataTable[i].idTipoAnejado+">"+dataTable[i].descripcion+"</option>"
        }
        select.innerHTML = selectContent;
    }
}

function saveProduct() {
    var uriNewProduct = webServiceRootLocal + "newProduct.php?" + 
        "idTipoAnnejado=" + $('#annejadoLicor').val() + 
        "&idProcedencia=" + $('#procedenciaLicor').val() + 
        "&nombre=" + $('#licorName').val() + 
        "&precio=" + $('#licorPrice').val() + 
        "&annos=" + $('#licorOld').val();
        alert(uriNewProduct);
    $.ajax({
        url: uriNewProduct,
        processData : true,
        data: {},
        dataType: "json",
        success: function(data) {
            console.log(data);
            window.location = "products.html";           
        },
        error: function(xhr) {    
            console.log(xhr.responseText);        
        }
    });
}

function cancelOperation() {
    window.location = "products.html";
}