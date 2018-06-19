<?php
	include 'DBSucursal.php';	

	$json = array();    

	$conexion = mysqli_connect($hsotName, $userName, $password, $dataBase);
    mysqli_set_charset($conexion,'utf8');
    $procedimiento = "call getIdSucursal";
    $query = mysqli_query($conexion, $procedimiento);
        
    while ($data = mysqli_fetch_assoc($query)) {
        $json['Sucursal'][]=$data;                     
    }    
    mysqli_close($conexion);

    echo json_encode($json);
?>