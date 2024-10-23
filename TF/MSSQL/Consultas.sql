--- 1.Muestre el codigo y nombre de todos los empleados que tengan un beneficio con un monto mayor al promedio

SELECT E.EMP_cod, E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m, B.BEN_mon
FROM Empleado E
JOIN Beneficios B ON E.EMP_cod = B.EMP_cod
WHERE B.BEN_mon > (SELECT AVG(BEN_mon) FROM Beneficios)

/* Faltan los registros de licencia
--- 2.Muestre la cantidad de empleados que tengan una licencia remunerada aprobada 

SELECT COUNT(DISTINCT L.EMP_cod) AS CantidadEmpleados
FROM Licencia L
JOIN Tipo_Licencia TL ON L.TLI_cod = TL.TLI_cod
WHERE TL.TLI_rem = 1 AND L.LIC_est = 1
*/

/* Faltan los registros de licencia
---3.Muestre el año en el que se han solicitado más licencias las cuales fueron aprobadas

SELECT Anio, CantidadLicencias
FROM (
    SELECT 
        YEAR(L.LIC_fec_sol) AS Anio,
        COUNT(*) AS CantidadLicencias
    FROM Licencia L
    WHERE L.LIC_est = 1  
    GROUP BY YEAR(L.LIC_fec_sol)
) AS LicenciasPorAnio
WHERE CantidadLicencias = (
    SELECT MAX(CantidadLicencias) 
    FROM (
        SELECT 
            YEAR(L.LIC_fec_sol) AS Anio,
            COUNT(*) AS CantidadLicencias
        FROM Licencia L
        WHERE L.LIC_est = 1
        GROUP BY YEAR(L.LIC_fec_sol)
    ) AS MaxLicencias
)
*/