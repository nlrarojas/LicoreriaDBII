exec [dbo].[consultaLicoresByName] 'chi', NULL

exec [dbo].[consultaLicoresByName] 'cac', NULL

exec [dbo].[consultaLicoresByName] 'tano', NULL

exec [dbo].[consultaLicoresByName] 'tano', 1

exec [dbo].[consultaLicoresByName] 'Cah', 1




/*Consulta de productos  y distancia de sucursales donde se encuentra*/
DECLARE @g geometry;   
SET @g = geometry::Point(47.65100, -122.34900, 0)
DECLARE @g2 geometry;   
SET @g2 = geometry::Point(2.65100, 2.34900, 0)

  
exec [dbo].[consultaDistanciaLicoresByName] 'c', @g 
exec [dbo].[consultaDistanciaLicoresByName] 'c', @g2     

