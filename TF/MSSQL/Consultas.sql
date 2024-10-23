--- 1.Muestre el codigo y nombre de todos los empleados que tengan un beneficio con un monto mayor al promedio
SELECT E.EMP_cod, E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m, B.BEN_mon
FROM Empleado E
JOIN Beneficios B ON E.EMP_cod = B.EMP_cod
WHERE B.BEN_mon > (SELECT AVG(BEN_mon) FROM Beneficios)

--- 2.Muestre la cantidad de empleados que tengan una licencia remunerada aprobada 
SELECT COUNT(DISTINCT L.EMP_cod) AS CantidadEmpleados
FROM Licencia L
JOIN Tipo_Licencia TL ON L.TLI_cod = TL.TLI_cod
WHERE TL.TLI_rem = 1 AND L.LIC_est = 1

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

--4.Muestra todos los tipos de relacion de hermandad (hermano o hermana)
SELECT P.PAR_cod AS 'Código de Parentesco', P.PAR_desc AS 'Descripción del Parentesco', COUNT(F.FAM_cod) AS 'Cantidad de Familiares'
FROM Parentesco P
LEFT JOIN Familiar F ON P.PAR_cod = F.PAR_cod
WHERE P.PAR_desc IN ('Hermano', 'Hermana')
GROUP BY P.PAR_cod, P.PAR_desc

--5.Muestra los familiares que nacieron despues de 1990 y son hombres
SELECT F.FAM_cod AS 'Código de Familiar', F.FAM_nom AS 'Nombre', F.FAM_ape_p AS 'Apellido Paterno', F.FAM_ape_m AS 'Apellido Materno', F.FAM_num_iden AS 'Número de Identificación', F.FAM_fec_nac AS 'Fecha de Nacimiento', F.FAM_sex AS 'Sexo', P.PAR_desc AS 'Parentesco'
FROM Familiar F
JOIN Parentesco P ON F.PAR_cod = P.PAR_cod
WHERE F.FAM_sex = 'M' AND F.FAM_fec_nac > '1990-01-01'

--6.Ordena los familiares por apellido en orden alfabetico
--Falta mostrar el nombre y apellido del empleado
SELECT FE.FAM_cod AS 'Código de Familiar', F.FAM_nom AS 'Nombre del Familiar', F.FAM_ape_p AS 'Apellido Paterno', FE.EMP_cod AS 'Código de Empleado'
FROM FAM_EMP FE
JOIN Familiar F ON FE.FAM_cod = F.FAM_cod
ORDER BY F.FAM_ape_p, F.FAM_nom