var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getPayments.php";

$(document).ready( function() {    
    $.getJSON(uriGetUserRole).done(function (data) {      
        console.log(data);           
        writeTable(data.Payment);
    });    
});

function writeTable(dataTable) {
    table = document.getElementById("tablePayments");
    var tableContent = "<thead class=thead-dark> <tr><th scope=col>Descripcion</th><th scope=col>Acciones</th></tr></thead>";    
    for (var i = 0; i < dataTable.length; i++){                
        tableContent += "<tbody><tr>"        
        tableContent += "<td>" + dataTable[i].descripcion + "</td>";                         
        tableContent += "<td><a id=newUser onclick=deletePayment("+dataTable[i].idTipoPago+")>Eliminar</a>&ensp;&ensp;&ensp;&ensp;<a id=newUser onclick=updatePayment("+dataTable[i].idTipoPago+")>Modificar</a></td></tr></tbody>"
    }
    table.innerHTML = tableContent;
}

function savePaymentType() {
    var uriGetUserRole = webServiceRoot + "newPayment.php?descripcion=" + 
    $('#txtPaymentDescription').val();    
    $.getJSON(uriGetUserRole).done(function (data) { 
        window.location = "administrador.html";
    });
}

function openNewPayment() {
    window.location = "newPayment.html";
}

function deletePayment(idPayment) {
    window.location = "deletePayment.html?id="+idPayment;
}

function updatePayment(idPayment) {
    window.location = "updatePayment.html?id="+idPayment;
}