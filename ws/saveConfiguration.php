<?php

	include 'DBSucursal.php';	

	$json = array();

    $id = $_GET['idSucursal'];
    $nombre = $_GET['nombre'];
    $latitude = $_GET['latitude'];
    $longitude = $_GET['longitude'];
    $direccion = $_GET['direccion'];
    $horaApertura = $_GET['horaApertura'];
    $horaCierre = $_GET['horaCierre'];

	$conexion = mysqli_connect($hsotName, $userName, $password, $dataBase);
    mysqli_set_charset($conexion,'utf8');
    $procedimiento = "call updateSucursal('$id', '$nombre', '$latitude', '$longitude', '$direccion',
        '$horaApertura', '$horaCierre')";
    $query = mysqli_query($conexion, $procedimiento);
        
    while ($data = mysqli_fetch_assoc($query)) {
        $json['Configuration'][]=$data;                     
    }    
    mysqli_close($conexion);

    echo json_encode($json);
?>