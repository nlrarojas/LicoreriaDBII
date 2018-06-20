/*Consulta de ventas por tipo de pago, x sucursalx fechas*/
call getVentasSucursal(NULL,NULL,NULL)

call getVentasSucursal('2000-01-01',CURDATE()+1,NULL)

	/*Ventas de hoy*/
call getVentasSucursal(CURDATE(),CURDATE(),NULL)


	/*Ventas de ayer*/
call getVentasSucursal(CURDATE()-1,CURDATE()-1,NULL)

	/*Ventas de hoy con tarjeta*/
call getVentasSucursal(CURDATE(),CURDATE(),2)




/*Consulta productos mas vendidos x sucursal x todo*/
call getProductosMasVendidos(NULL)

call getProductosMasVendidos(1)

call getProductosMasVendidos(2)


/*Consulta productos que no se venden x sucursal x todo*/
call getProductosMenosVendidos(NULL)

call getProductosMenosVendidos(1)

call getProductosMenosVendidos(2)




