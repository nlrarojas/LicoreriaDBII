//var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var webServiceRoot = "http://localhost:8080/webServiceDB/";
var uriGetUserRole = webServiceRoot + "getProducts.php";

$(document).ready( function() {    
    $.getJSON(uriGetUserRole).done(function (data) {      
        console.log(data);           
        writeTable(data.Product);
    });    
});

function writeTable(dataTable) {
    table = document.getElementById("tableProducts");
    if (table) {
        var tableContent = "<thead class=thead-dark> <tr><th scope=col>Nombre</th><th scope=col>Tipo de añejado</th><th scope=col>Procedencia</th><th scope=col>Años</th><th scope=col>Precio</th><th scope=col>Acciones</th></tr></thead>";    
        for (var i = 0; i < dataTable.length; i++){                
            tableContent += "<tbody><tr>"                
            tableContent += "<td>" + dataTable[i].nombreLicor + "</td>";
            tableContent += "<td>" + dataTable[i].descripcion + "</td>";
            tableContent += "<td>" + dataTable[i].nombre + "</td>";                                 
            tableContent += "<td>" + dataTable[i].annos + "</td>";
            tableContent += "<td>" + dataTable[i].precio + "</td>";
            tableContent += "<td><a id=newUser onclick=deleteProduct("+dataTable[i].idLicor+")>Eliminar</a>&ensp;&ensp;&ensp;&ensp;<a id=newUser onclick=updateProduct("+dataTable[i].idLicor+")>Modificar</a></td></tr></tbody>"
        }
        table.innerHTML = tableContent;
    }
}

function savePaymentType() {
    var uriGetUserRole = webServiceRoot + "newPayment.php?descripcion=" + 
    $('#txtPaymentDescription').val();    
    $.getJSON(uriGetUserRole).done(function (data) { 
        window.location = "administrador.html";
    });
}

function openNewPayment() {
    window.location = "newProduct.html";
}

function openAnnejado() {
    window.location = "annejados.html";
}

function openProcedencia() {
    window.location = "procedencias.html";
}

function openCombinations() {
    window.location = "combinations.html";
}

function deleteProduct(idLicor) {
    window.location = "deleteProduct.html?id="+idLicor;
}

function updateProduct(idLicor) {
    window.location = "updateProduct.html?id="+idLicor;
}