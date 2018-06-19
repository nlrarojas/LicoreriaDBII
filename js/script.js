var webServiceRoot = "http://localhost:8080/webServiceDB/";

var uriGetUserRole = webServiceRoot + "getUserType.php";

function getUser(){
    var userName = document.getElementById("inputUserName").value;
    var password = document.getElementById("inputPassword").value;
    uriGetUserRole = uriGetUserRole + "?userName=" + userName + "&password=" + password;
    
    $.getJSON(uriGetUserRole).done(function (data) {        
        var role = data.Role;
        if (role == 1) {
            window.location = "administrador.html";
        } else if (role == 2) {
            window.location = "administrador.html";
        } else if (role == 3) {
            window.location = "administrador.html";
        } else {
            window.location = "administrador.html";
        }
    });
}

function openConfiguration(){    
    window.location = "configuracion.html";
}

function openUsers() {
    window.location = "users.html";
}

function signIn(){
    window.location = "signIn.html";
}