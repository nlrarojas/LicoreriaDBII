//var webServiceRoot = "http://localhost:8080/webServiceDB/";
var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getCombination.php";
var uriGetProducts = webServiceRoot + "getProducts.php";
var id;

$(document).ready(function () {    
    var url = new URL(window.location.href);
    id = url.searchParams.get("id");
    uriGetUserRole += "?id=" + id;    
    $.getJSON(uriGetProducts).done(function (data) {                      
        fillDataProducts(data.Product);
        $.getJSON(uriGetUserRole).done(function (data1) {               
            fillCombination(data1.Combination[0]);
        });
    });     
});

function fillCombination(dataTable) {
    $('#idCombination').val(dataTable.IdCombinacion);
    $('#licor1').val(dataTable.Licor1);
    $('#licor2').val(dataTable.Licor2);
    $('#combinationName').val(dataTable.NombreCombinacion);
    $('#combinationDescription').val(dataTable.descripcion);
}

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

function deleteCombination() {    
    uriGetUserRole = webServiceRoot + "deleteCombination.php?id=" + id;     
    alert(uriGetUserRole);  
    $.getJSON(uriGetUserRole).done(function (data) {              
        console.log("a" + data);
        window.location = "combinations.html";             
    });
}

function cancelOperation() {
    window.location = "combinations.html";
}