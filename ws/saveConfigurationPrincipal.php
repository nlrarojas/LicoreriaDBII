<?php
$serverName = "163.178.173.148"; //serverName\instanceName
$connectionInfo = array( "Database"=>"DB_Licoreria_Principal", "UID"=>"info", "PWD"=>"info");
$conn = sqlsrv_connect($serverName, $connectionInfo);

$json = array();

if( $conn ) {
    $procedure = "EXEC updateSucursal @idSucursal = ?, @nombre = ?, @lat = ?, @lng = ?, 
        @direccion = ?, @horaApertura = ?, @horaCierre = ?";
    
    $parameters = array(
        array(&$_GET['idSucursal'], SQLSRV_PARAM_IN),
        array(&$_GET['nombre'], SQLSRV_PARAM_IN),
        array(&$_GET['latitude'], SQLSRV_PARAM_IN),
        array(&$_GET['longitude'], SQLSRV_PARAM_IN),
        array(&$_GET['direccion'], SQLSRV_PARAM_IN), 
        array(&$_GET['horaApertura'], SQLSRV_PARAM_IN), 
        array(&$_GET['horaCierre'], SQLSRV_PARAM_IN)
    );

    $stmt = sqlsrv_query($conn, $procedure, $parameters);
    
    while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
        $json['Response'][]= $row['Response'];                
        echo json_encode($json);
    }    
    sqlsrv_close( $conn );
}else{
    echo "-1";
    die( print_r( sqlsrv_errors(), true));
}
?>