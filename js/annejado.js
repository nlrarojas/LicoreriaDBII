var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getAnnejados.php";

$(document).ready( function() {      
    console.log(uriGetUserRole); 
    $.ajax({
        url: uriGetUserRole,
        processData : true,
        data: {},
        dataType: "json",
        success: function(data) {
            console.log(data);
            writeTable(data.Annejados);
        },
        error: function(xhr) {            
        }
    });
});

function writeTable(dataTable) {    
    table = document.getElementById("tableAnnejados");
    if (table) {
        var tableContent = "<thead class=thead-dark> <tr><th scope=col>Descripcion</th><th scope=col>Acciones</th></tr></thead>";    
        for (var i = 0; i < dataTable.length; i++){                
            tableContent += "<tbody><tr>"        
            tableContent += "<td>" + dataTable[i].descripcion + "</td>";                         
            tableContent += "<td><a id=newUser onclick=deleteAnnejado("+dataTable[i].idTipoAnejado+")>Eliminar</a>&ensp;&ensp;&ensp;&ensp;<a id=newUser onclick=updateAnnejado("+dataTable[i].idTipoAnejado+")>Modificar</a></td></tr></tbody>"
        }
        table.innerHTML = tableContent;
    }
}

function saveAnnejado() {
    var uriGetUserRole = webServiceRoot + "newAnnejado.php?des=" + 
    $('#txtAnnejadoDecription').val();        
    $.getJSON(uriGetUserRole).done(function (data) { 
        window.location = "annejados.html";
    });    
}

function openNewProcedencia() {
    window.location = "newAnnejado.html";
}

function cancelOperation() {
    window.location = "annejados.html";
}
 
function deleteAnnejado(idTipoAnejado) {
    window.location = "deleteAnnejado.html?id=" + idTipoAnejado;
}

function updateAnnejado(idTipoAnejado) {
    window.location = "updateAnnejado.html?id=" + idTipoAnejado;
}