<?php
$serverName = "163.178.173.148"; //serverName\instanceName
$connectionInfo = array( "Database"=>"DB_Licoreria_Principal", "UID"=>"info", "PWD"=>"info");
$conn = sqlsrv_connect($serverName, $connectionInfo);

$json = array();

if( $conn ) {
    $procedure = "EXEC sp_get_user_role @userName = ?, @password = ?";
    
    $parameters = array(
        array(&$_GET['userName'], SQLSRV_PARAM_IN),
        array(&$_GET['password'], SQLSRV_PARAM_IN),        
    );

    $stmt = sqlsrv_query($conn, $procedure, $parameters);
    
    while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC) ) {
        $json['Role'][]= $row['Role'];                
        echo json_encode($json);
    }    
    sqlsrv_close( $conn );
}else{
    echo "-1";
    die( print_r( sqlsrv_errors(), true));
}
?>