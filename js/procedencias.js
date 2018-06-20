var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";
var uriGetUserRole = webServiceRoot + "getProcedencias.php";

$(document).ready( function() {      
    console.log(uriGetUserRole); 
    $.ajax({
        url: uriGetUserRole,
        processData : true,
        data: {},
        dataType: "json",
        success: function(data) {
            console.log(data);
            writeTable(data.Procedencias);
        },
        error: function(xhr) {            
        }
    });
});


function writeTable(dataTable) {    
    table = document.getElementById("tableProcedencias");
    if (table) {
        var tableContent = "<thead class=thead-dark> <tr><th scope=col>Lugar de procedencia</th><th scope=col>Acciones</th></tr></thead>";    
        for (var i = 0; i < dataTable.length; i++){                
            tableContent += "<tbody><tr>"        
            tableContent += "<td>" + dataTable[i].nombre + "</td>";                         
            tableContent += "<td><a id=newUser onclick=deleteProcedencia("+dataTable[i].idProcedencia+")>Eliminar</a>&ensp;&ensp;&ensp;&ensp;<a id=newUser onclick=updateProcedencia("+dataTable[i].idProcedencia+")>Modificar</a></td></tr></tbody>"
        }
        table.innerHTML = tableContent;
    }
}

function saveProcedencia() {
    var uriGetUserRole = webServiceRoot + "newProcedencia.php?name=" + 
    $('#txtProcedenciaName').val();        
    $.getJSON(uriGetUserRole).done(function (data) { 
        window.location = "procedencias.html";
    });
    window.location = "procedencias.html";
}

function openNewProcedencia() {
    window.location = "newProcedencia.html";
}

function cancelOperation() {
    window.location = "procedencias.html";
}
 
function deleteProcedencia(idProcedencia) {
    window.location = "deleteProcedencia.html?id=" + idProcedencia;
}

function updateProcedencia(idProcedencia) {
    window.location = "updateProcedencia.html?id=" + idProcedencia;
}