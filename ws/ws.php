<?php

    $hsotName = "163.178.173.144";
    $dataBase = "DB_REQUERIMIENTOS";
    $userName = "multi-paraiso";
    $password = "multimedios.rp.2017";

    $json = array();

    if (isset($_GET['id'])){
        $id = $_GET['id'];
        
        $conexion = mysqli_connect($hsotName, $userName, $password, $dataBase);
        mysqli_set_charset($conexion,'utf8');
        $procedimiento = "call sp_eliminar_analista('$id')";
        $query = mysqli_query($conexion, $procedimiento);
        mysqli_close($conexion);
    }
?>