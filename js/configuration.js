var webServiceRoot = "http://localhost:8080/webServiceDB/";
var uriGetUserRole = webServiceRoot + "configuration.php";

var latitude;
var longitude;

function openConfiguration(){  
    $(document).ready( function() {
        $.getJSON(uriGetUserRole).done(function (data) {                                       
            list = data.Configuration[0].ubicacion.split("(")[1].split(")")[0].split(" ")
            latitude = list[0]
            longitude = list[1]

            $("#sucursal").val(data.Configuration[0].idSucursal);
            $("#nombre").val(data.Configuration[0].nombre);        
            $("#direccion").val(data.Configuration[0].direccion);
            $("#horaApertura").val(data.Configuration[0].horaApertura);
            $("#horaCierre").val(data.Configuration[0].horaCierre);
            $("#latInput").val(latitude);
            $("#lngInput").val(longitude);
        });        
    });
}

openConfiguration();
var infoWindow;

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 12
    });
    infoWindow = new google.maps.InfoWindow({map: map});
    google.maps.event.addListener(map, 'click', function(e) {
        console.log(e.latLng.lat);
    });
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
        if (latitude == null && longitude == null) {              
            var pos = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
        } else {
            var pos = {
                lat: Number(latitude),
                lng: Number(longitude)
            };
        }        
        infoWindow.setPosition(pos);
        infoWindow.setContent('La sucursal está aquí.');
        map.setCenter(pos);
    }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
    });
    } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    }
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
    infoWindow.setPosition(pos);
    infoWindow.setContent(browserHasGeolocation ?
                        'Error: El servicio de geolocalización ha fallado.' :
                        'Error: Su explorador de internet no soporta geolocalizacion.');
}

function saveConfiguration() {    
    output =  
        'idSucursal=' + $("#sucursal").val() + 
        '&nombre=' + $("#nombre").val() + 
        '&latitude=' + $("#latInput").val() + 
        '&longitude=' + $("#lngInput").val() +
        '&direccion=' + $("#direccion").val() + 
        '&horaApertura=' + $("#horaApertura").val() + 
        '&horaCierre=' + $("#horaCierre").val();        
    uriGetUserRole = webServiceRoot + 'saveConfiguration.php?' + output;
    $.getJSON(uriGetUserRole).done(function (data) {
        uriGetUserRole = webServiceRoot + 'saveConfigurationPrincipal.php?' + output;
        $.getJSON(uriGetUserRole).done(function (data) {
            window.location = 'administrador.html'
        });
    });
}

$('#latInput').on('input', function(e){
    alert("a");
    var pos = {
        lat: Number($('#latInput').val()),
        lng: Number($('#lngInput').val())
    };     
    infoWindow.setPosition(pos);
    infoWindow.setContent('La sucursal está aquí.');
    map.setCenter(pos);
});

$("#lngInput").on('change keyup paste', function(){
    alert("a");
    var pos = {
        lat: Number($("#latInput").val()),
        lng: Number($("#lngInput").val())
    };     
    infoWindow.setPosition(pos);
    infoWindow.setContent("La sucursal está aquí.");
    map.setCenter(pos);
});