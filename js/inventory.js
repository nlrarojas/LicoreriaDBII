//var webServiceRoot = "http://localhost:8080/webServiceDB/";
var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getProducts.php";
var uriIdSucursal = webServiceRoot + "configuration.php";
var idSucursal;

$(document).ready(function () {    
    $.getJSON(uriIdSucursal).done(function (data){
        idSucursal = data.Configuration[0].idSucursal;        
    });
    $.getJSON(uriGetUserRole).done(function (data) {  
        console.log(data.Product);            
        fillDataProducts(data.Product);
    });    
});

function fillDataProducts(dataTable) {
    selectLicor = document.getElementById("licor");    
    if (selectLicor) {
        var selectContent = "";    
        for (var i = 0; i < dataTable.length; i++){                
            selectContent += "<option value="+dataTable[i].idLicor+">"+dataTable[i].nombreLicor+"</option>"
        }
        selectLicor.innerHTML = selectContent;        
    }
}

function saveDataInventory() {    
    uriGetUserRole = webServiceRoot + "newInventoryDetail.php?" + 
    "idLicor=" + $('#licor').val() +
    "&cantidad=" + $('#quantity').val() + 
    "&idSucursal=" + idSucursal;    
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log("a" + data);
        window.location = "combinations.html";             
    });    
}

function cancelOperation() {
    window.location = "combinations.html";    
}