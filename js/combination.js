var webServiceRoot = "http://localhost:8080/webServiceDB/";
//var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getCombinations.php";
var id;

$(document).ready(function () {    
    $.getJSON(uriGetUserRole).done(function (data) {
        console.log(data.Combination);            
        fillCombination(data.Combination);
    });    
});

function fillCombination(dataTable) {
    table = document.getElementById("tableCombinations");
    if (table) {
        var tableContent = "<thead class=thead-dark> <tr><th scope=col>Nombre</th><th scope=col>Descripción</th><th scope=col>Licor 1</th><th scope=col>Licor 2</th><th scope=col>Acciones</th></tr></thead>";    
        for (var i = 0; i < dataTable.length; i++){                
            tableContent += "<tbody><tr>"                
            tableContent += "<td>" + dataTable[i].NombreCombinacion + "</td>";
            tableContent += "<td>" + dataTable[i].descripcion + "</td>";
            tableContent += "<td>" + dataTable[i].NombreLicor1 + "</td>";                                 
            tableContent += "<td>" + dataTable[i].NombreLicor2 + "</td>";            
            tableContent += "<td><a id=newUser onclick=deleteCombination("+dataTable[i].IdCombinacion+")>Eliminar</a>&ensp;&ensp;&ensp;&ensp;<a id=newUser onclick=updateCombination("+dataTable[i].IdCombinacion+")>Modificar</a></td></tr></tbody>"
        }
        table.innerHTML = tableContent;
    }
}

function openNewCombination() {
    window.location = "newCombination.html";
}

function deleteCombination(id) {
    window.location = "deleteCombination.html?id=" + id;
}

function updateCombination(id) {
    window.location = "updateCombination.html?id=" + id;
}