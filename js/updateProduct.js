var webServiceRoot = "http://localhost:8080/webServiceDB/";
var webServiceRootLocal = "http://localhost:8080/webServiceDB/";

var uriGetProcedencia = webServiceRoot + "getProcedencias.php";
var uriGetAnnejado = webServiceRoot + "getAnnejados.php";
var uriGetUserRole = webServiceRoot + "getProduct.php";
var id;

$(document).ready(function(){
    $.ajax({
        url: uriGetAnnejado,
        processData : true,
        data: {},
        dataType: "json",
        success: function(data) {            
            fillDataAnnejado(data.Annejados);
            var url = new URL(window.location.href);
            id = url.searchParams.get("id");
            uriGetUserRole += "?id=" + id;    
            $.getJSON(uriGetUserRole).done(function (data) {  
                console.log(data);            
                $('#annejadoLicor').val(data.Product[0].descripcion);                           
            });
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
            fillDataProcedencia(data.Procedencias);
            var url = new URL(window.location.href);
            id = url.searchParams.get("id");
            uriGetUserRole += "?id=" + id;    
            $.getJSON(uriGetUserRole).done(function (data) {                                                 
                $('#procedenciaLicor').val(data.Product[0].nombre);                           
            });
        },
        error: function(xhr) {            
        }
    });       
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    $.getJSON(uriGetUserRole).done(function (data) {  
        console.log(data);            
        $('#licorID').val(data.Product[0].idLicor);                   
        $('#licorName').val(data.Product[0].nombreLicor);           
        $('#licorPrice').val(data.Product[0].precio);           
        $('#licorOld').val(data.Product[0].annos);           
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

function updateProduct() {
    var uriNewProduct = webServiceRootLocal + "updateProduct.php?" + 
        "id=" + id + 
        "&idTipoAnnejado=" + $('#annejadoLicor').val() + 
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

function canccelOperation() {
    window.location = "products.html";    
}