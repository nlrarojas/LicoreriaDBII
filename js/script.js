var webServiceRoot = "http://163.178.173.144:8080/estudiantes/licoreria/";

$(document).ready(function(){
    $('#errorLogin').hide();
});

function getUser(){
    var userName = document.getElementById("inputUserName").value;
    var password = document.getElementById("inputPassword").value;
    uriGetUserRole = webServiceRoot + "getUserType.php" + "?userName=" + userName + "&password=" + password;
    console.log(uriGetUserRole);
    $.getJSON(uriGetUserRole).done(function (data) {        
        var role = data.Role;        
        if (role == 1) {
            window.location = "administrador.html";
        } else if (role == 2) {
            window.location = "administrador.html";
        } else if (role == 3) {
            window.location = "administrador.html";
        } else {            
            
        }
    });
    $('#errorLogin').show();
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

function openPayments() {
    window.location = "paymentsStyle.html";
}

function openProducts() {
    window.location = "products.html";
}