<?php

	include 'DBSucursal.php';	

	$json = array();

    $userUserName = $_GET['userName'];
    $passwordUser = $_GET['password'];

	$conexion = mysqli_connect($hsotName, $userName, $password, $dataBase);
    mysqli_set_charset($conexion,'utf8');
    $procedimiento = "call addUserAdmin('$userUserName', '$passwordUser')";
    $query = mysqli_query($conexion, $procedimiento);
        
    while ($data = mysqli_fetch_assoc($query)) {
        $json['Response'][]=$data;                     
    }    
    mysqli_close($conexion);

    echo json_encode($json);

    $serverName = "163.178.173.148"; //serverName\instanceName
    $connectionInfo = array( "Database"=>"DB_Licoreria_Principal", "UID"=>"info", "PWD"=>"info");
    $conn = sqlsrv_connect($serverName, $connectionInfo);

    $json = array();

    if( $conn ) {
        $procedure = "EXEC addUserAdmin @username = ?, @password = ?, @sucursal = ?";
        
        $parameters = array(
            array(&$userUserName, SQLSRV_PARAM_IN),
            array(&$passwordUser, SQLSRV_PARAM_IN),         
            array(&$_GET['sucursal'], SQLSRV_PARAM_IN)
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