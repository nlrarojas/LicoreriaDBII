var webServiceRoot = "http://localhost:8080/webServiceDB/";
var uriGetUserRole = webServiceRoot + "getUsers.php";

$(document).ready( function() {    
    $.getJSON(uriGetUserRole).done(function (data) {                 
        console.log(data.User);
        writeTable(data.User);
    });
    $('#lblImage').hide();       
    $('#userFile').hide();
    $('#btnAdministrator').hide();       
    $('#btnSalesMan').hide();    
});

function writeTable(dataTable) {
    table = document.getElementById("tableUsers");
    var tableContent = "<thead class=thead-dark> <tr><th scope=col>Nombre de usuario</th><th scope=col>Role</th><th scope=col>Acciones</th></tr></thead>";    
    for (var i = 0; i < dataTable.length; i++){                
        tableContent += "<tbody><tr>"        
        tableContent += "<td>" + dataTable[i].userName + "</td>";         
        role = dataTable[i].Role == 1 ? 'Administrador' : dataTable[i].Role == 2 ? 'Vendedor': 'Cliente';
        tableContent += "<td>" + role + "</td>";         
        tableContent += "<td><a id=newUser onclick=deleteUser("+dataTable[i].idUser+","+dataTable[i].Role+")>Eliminar</a>&ensp;&ensp;&ensp;&ensp;<a id=newUser onclick=updateUser("+dataTable[i].idUser+","+dataTable[i].Role+")>Modificar</a></td></tr></tbody>"
    }
    table.innerHTML = tableContent;
}

function oepnNewUser() {
    window.location = "newUser.html";
}


function typeUserSelected (sel){
    if (sel.value == 1) {
        $('#userName').show();
        $('#userLastName').show();
        $('#userBirthDate').show();
        $('#userUserName').show();
        $('#userPWD').show(); 
        $('#lblImage').hide();       
        $('#userFile').hide();
        $('#btnAdministrator').hide();       
        $('#btnSalesMan').hide();  
        $('#btnSaveClient').show();    
    } else if (sel.value == 2) {
        $('#userName').hide();
        $('#userLastName').hide();
        $('#userBirthDate').hide();
        $('#userUserName').show();
        $('#userPWD').show();
        $('#userFile').show();
        $('#lblImage').show();  
        $('#btnAdministrator').hide();       
        $('#btnSalesMan').show();  
        $('#btnSaveClient').hide();    
    } else if (sel.value == 3) {
        $('#userName').hide();
        $('#userLastName').hide();
        $('#userBirthDate').hide();
        $('#userUserName').show();
        $('#userPWD').show();
        $('#userFile').hide();
        $('#lblImage').hide();  
        $('#btnAdministrator').show();       
        $('#btnSalesMan').hide();  
        $('#btnSaveClient').hide();    
    }
}

function saveNewUserAdministrator() {
    uriGetUserRole = webServiceRoot + "newAdministrator.php?" +
        "userName=" + $('#userUserName').val() + 
        "&password=" + $('#userPWD').val(); 
    console.log(uriGetUserRole);
    $.getJSON(uriGetUserRole).done(function (data) {         
        window.location = "administrador.html";
    });
}

function saveNewUserSaler() {
    file = $('#userFile')[0].files[0].name;
    uriGetUserRole = webServiceRoot + "newSaller.php?" +
        "foto=" + file + 
        "&userName=" + $('#userUserName').val() + 
        "&password=" + $('#userPWD').val(); 
    console.log(uriGetUserRole);
    $.getJSON(uriGetUserRole).done(function (data) {         
        window.location = "administrador.html";
    });
}

function saveNewUserClient() {
    uriGetUserRole = webServiceRoot + "getSucursal.php";
    $.getJSON(uriGetUserRole).done(function (data) {
        uriGetUserRole = webServiceRoot + "newClient.php?" +
            "nombre=" + $('#userName').val() + 
            "&apellidos=" + $('#userLastName').val() + 
            "&fechaNacimiento=" + $('#userBirthDate').val() + 
            "&userName=" + $('#userUserName').val() + 
            "&password=" + $('#userPWD').val() +
            "&sucursal=" + data.Sucursal[0].idSucursal;          
        $.getJSON(uriGetUserRole).done(function (data) {         
            window.location = "administrador.html";
        });
    });
}

function signClient() {
    uriGetUserRole = webServiceRoot + "getSucursal.php";
    $.getJSON(uriGetUserRole).done(function (data) {
        uriGetUserRole = webServiceRoot + "newClient.php?" +
            "nombre=" + $('#userName').val() + 
            "&apellidos=" + $('#userLastName').val() + 
            "&fechaNacimiento=" + $('#userBirthDate').val() + 
            "&userName=" + $('#userUserName').val() + 
            "&password=" + $('#userPWD').val() +
            "&sucursal=" + data.Sucursal[0].idSucursal;          
        $.getJSON(uriGetUserRole).done(function (data) {         
            window.location = "client.html";
        });
    });
}

function deleteUser(idUser, userRole) {
    alert(idUser + " " + userRole);
}

function updateUser(idUser, userRole) {
    alert(idUser + " " + userRole);
}