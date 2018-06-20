var webServiceRoot = "http://localhost:8080/webServiceDB/";
//var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getProducts.php";
var id;

$(document).ready(function () {    
    $.getJSON(uriGetUserRole).done(function (data) {  
        console.log(data.Product);            
        fillDataProducts(data.Product);
    });    
});

function fillDataProducts(dataTable) {
    selectLicor1 = document.getElementById("licor1");
    selectLicor2 = document.getElementById("licor2");
    if (selectLicor1 && selectLicor2) {
        var selectContent = "";    
        for (var i = 0; i < dataTable.length; i++){                
            selectContent += "<option value="+dataTable[i].idLicor+">"+dataTable[i].nombreLicor+"</option>"
        }
        selectLicor1.innerHTML = selectContent;
        selectLicor2.innerHTML = selectContent;
    }
}

function saveCombination() {    
    uriGetUserRole = webServiceRoot + "newCombination.php?" + 
    "licor1=" + $('#licor1').val() +
    "&licor2=" + $('#licor2').val() + 
    "&name=" + $('#combinationName').val() + 
    "&descrip=" + $('#combinationDescription').val();
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log("a" + data);
        window.location = "products.html";             
    });    
}

function canccelOperation() {
    window.location = "products.html";    
}