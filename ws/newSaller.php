<?php

	include 'DBSucursal.php';	

	$json = array();

    $foto = $_GET['foto'];
    $userUserName = $_GET['userName'];
    $passwordUser = $_GET['password'];

	$conexion = mysqli_connect($hsotName, $userName, $password, $dataBase);
    mysqli_set_charset($conexion,'utf8');
    $procedimiento = "call addUserFactura('$foto', '$userUserName', '$passwordUser')";
    $query = mysqli_query($conexion, $procedimiento);
        
    while ($data = mysqli_fetch_assoc($query)) {
        $json['Response'][]=$data;                     
    }    
    mysqli_close($conexion);

    echo json_encode($json);
?>