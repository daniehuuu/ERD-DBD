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
SELECT FE.FAM_cod AS 'Código del Familiar', F.FAM_nom AS 'Nombre del Familiar', F.FAM_ape_p AS 'Apellido Paterno del Familiar', FE.EMP_cod AS 'Código de Empleado', E.EMP_nom AS 'Nombre del Empleado', E.EMP_ape_p AS 'Apellido Paterno del Empleado'
FROM FAM_EMP FE
JOIN Familiar F ON FE.FAM_cod = F.FAM_cod
JOIN Empleado E ON FE.EMP_cod = E.EMP_cod
ORDER BY F.FAM_ape_p, F.FAM_nom;

--7.Muestra el cargo y salario actual, y el cargo y salario inmediato anterior de todos los empleados.
SELECT 
    E.EMP_cod AS Codigo_Empleado, 
    E.EMP_nom AS Nombre, 
    E.EMP_ape_p AS Apellido_Paterno, 
    C.CAR_Desc AS Cargo_Actual, 
    E.EMP_sld_bsc AS Salario_Base_Actual,
    E.EMP_fec_ces AS Fecha_Cese_Actual,

    -- Subconsulta para obtener los datos del cargo anterior y fechas
    HL2.CAR_Desc AS Cargo_Anterior,
    HL2.HIS_sld_bsc AS Salario_Base_Anterior,
    HL2.HIS_fec_in AS Fecha_Inicio_Anterior,
    HL2.HIS_fec_fin AS Fecha_Cese_Anterior
FROM Empleado E
INNER JOIN Cargo C ON E.CAR_cod = C.CAR_cod
LEFT JOIN (
    SELECT HL2.EMP_cod, 
           C2.CAR_Desc, 
           HL2.HIS_sld_bsc, 
           HL2.HIS_fec_in, 
           HL2.HIS_fec_fin
    FROM Historial_Laboral HL2
    INNER JOIN Cargo C2 ON HL2.CAR_cod = C2.CAR_cod
    WHERE HL2.HIS_fec_fin = (
        SELECT MAX(HIS_fec_fin) 
        FROM Historial_Laboral 
        WHERE EMP_cod = HL2.EMP_cod
    )
) AS HL2 ON E.EMP_cod = HL2.EMP_cod
ORDER BY Cargo_Anterior DESC

--8.Muestra el primer cargo de cada empleado
SELECT 
    E.EMP_cod AS Codigo_Empleado, 
    E.EMP_nom AS Nombre, 
    E.EMP_ape_p AS Apellido_Paterno, 

    -- Subconsulta para el primer cargo
    CASE 
        WHEN HL.HIS_fec_in IS NOT NULL THEN C2.CAR_Desc
        ELSE C.CAR_Desc -- Si no existe historial, se toma el cargo actual
    END AS Primer_Cargo

FROM Empleado E
INNER JOIN Cargo C ON E.CAR_cod = C.CAR_cod
-- Se hace un LEFT JOIN para incluir el historial laboral si existe
LEFT JOIN (
    SELECT EMP_cod, HIS_fec_in, CAR_cod
    FROM Historial_Laboral HL1
    WHERE HIS_fec_in = (
        SELECT MIN(HIS_fec_in)
        FROM Historial_Laboral HL2
        WHERE HL2.EMP_cod = HL1.EMP_cod
    )
) HL ON E.EMP_cod = HL.EMP_cod
LEFT JOIN Cargo C2 ON HL.CAR_cod = C2.CAR_cod
ORDER BY Primer_Cargo

--9.Muestra el total de deducciones, salario neto, AFP Y Cargo de los empleados
SELECT 
    E.EMP_cod,
    E.EMP_nom,
    E.EMP_ape_p,
    E.EMP_ape_m,
    E.EMP_sld_bsc AS Sueldo_Basico,
    (SELECT SUM(CS.CSA_mon) 
     FROM Calculo_Salario CS 
     WHERE CS.EMP_cod = E.EMP_cod AND CS.CSA_tipo = 0) AS Total_Deducciones,
    E.EMP_sld_bsc - (SELECT SUM(CS.CSA_mon) 
                      FROM Calculo_Salario CS 
                      WHERE CS.EMP_cod = E.EMP_cod AND CS.CSA_tipo = 0) AS Salario_Neto,
    A.AFP_desc AS Nombre_AFP,
    C.CAR_desc AS Nombre_Cargo
FROM 
    Empleado E
LEFT JOIN 
    AFP A ON E.AFP_cod = A.AFP_cod
LEFT JOIN 
    Cargo C ON E.CAR_cod = C.CAR_cod
WHERE 
    E.EMP_fec_ces IS NULL
ORDER BY 
    Nombre_AFP, Nombre_Cargo

/*10
Consulta para obtener empleados y detalles de licencias y asistencias en conflicto.
Se busca identificar a los empleados que tienen registros de asistencia durante el período en que estaban de licencia.
Se realiza un JOIN entre las tablas Empleado, Licencia y Asistencia, y se aplican condiciones para verificar si
las fechas de asistencia (entrada o salida) coinciden con las fechas de una licencia.
*/
SELECT E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m, L.LIC_fec_ini, L.LIC_fic_fin, A.AST_fec_ent, A.AST_fec_sal
FROM Empleado E
JOIN Licencia L ON E.EMP_cod = L.EMP_cod
JOIN Asistencia A ON E.EMP_cod = A.EMP_cod
WHERE (A.AST_fec_ent BETWEEN L.LIC_fec_ini AND L.LIC_fic_fin)
   OR (A.AST_fec_sal BETWEEN L.LIC_fec_ini AND L.LIC_fic_fin)

/*11
Consulta de resumen de licencias y asistencias en un año específico (2024).
Esta consulta cuenta el número de licencias y asistencias que tuvo cada empleado en el año 2024.
Se realiza un LEFT JOIN para incluir empleados que podrían no tener licencias o asistencias, y se filtra por año.
El resultado agrupa por empleado y año, mostrando aquellos con al menos una licencia o asistencia.
*/
SELECT E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m,
       COUNT(DISTINCT L.LIC_cod) AS num_licencias,
       COUNT(DISTINCT A.AST_cod) AS num_asistencias,
       YEAR(L.LIC_fec_ini) AS año
FROM Empleado E
LEFT JOIN Licencia L ON E.EMP_cod = L.EMP_cod AND YEAR(L.LIC_fec_ini) = 2024
LEFT JOIN Asistencia A ON E.EMP_cod = A.EMP_cod AND YEAR(A.AST_fec_ent) = 2024
GROUP BY E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m, YEAR(L.LIC_fec_ini)
HAVING COUNT(DISTINCT L.LIC_cod) > 0 OR COUNT(DISTINCT A.AST_cod) > 0

/*12
Consulta para obtener empleados que asistieron durante sus licencias.
Se busca a aquellos empleados que tienen registros de asistencia dentro del rango de fechas de alguna licencia.
Se realiza un JOIN entre las tablas Empleado, Licencia y Asistencia, y se aplican filtros en base a la fecha de asistencia.
*/
SELECT E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m, L.LIC_fec_ini, L.LIC_fic_fin, A.AST_fec_ent
FROM Empleado E
JOIN Licencia L ON E.EMP_cod = L.EMP_cod
JOIN Asistencia A ON E.EMP_cod = A.EMP_cod
WHERE A.AST_fec_ent BETWEEN L.LIC_fec_ini AND L.LIC_fic_fin

--13.Selecciona empleados con fecha de cese y muestra el motivo 
SELECT 
    E.EMP_cod AS ID_Emp,
    E.EMP_nom AS Nombre,
    E.EMP_ape_p AS Apellido_Paterno,
    E.EMP_ape_m AS Apellido_Materno,
    E.EMP_tel AS Numero_Celular,
    E.EMP_fec_ing AS Fecha_Ingreso,
    E.EMP_fec_ces AS Fecha_Cese,
    C.CAR_desc AS Cargo,
    CN.CTR_mot_ter AS Motivo_Termino
FROM 
    Empleado E
JOIN 
    Cargo C ON E.CAR_cod = C.CAR_cod
JOIN 
    Contrato CN ON E.EMP_cod = CN.EMP_cod
WHERE 
    E.EMP_fec_ces IS NOT NULL -- Filtra los empleados con fecha de cese
    AND CN.CTR_mot_ter IS NOT NULL -- Asegura que tengan un motivo de término
ORDER BY 
    E.EMP_fec_ces DESC

--14.Mostrar contratos donde los empleados tienen una condición de tiempo completo y contar cuántos hay por tipo de contrato
SELECT 
    C.CTR_tip_con, 
    COUNT(*) AS Total_Contratos,
    SUM(C.CTR_sld_bsc) AS Sueldo_Total
FROM 
    Contrato C
JOIN 
    Empleado E ON C.EMP_cod = E.EMP_cod
JOIN 
    Condicion_Trabajo CT ON E.CTB_cod = CT.CTB_cod
WHERE 
    CT.CTB_desc = 'Tiempo Completo'
GROUP BY 
    C.CTR_tip_con
HAVING 
    COUNT(*) > 1
ORDER BY 
    Sueldo_Total DESC

--15.Mostrar todos los contratos y el nombre del empleado, incluyendo una indicación si el contrato está activo
SELECT 
    C.CTR_cod, 
    E.EMP_nom, 
    C.CTR_tip_con, 
    CASE 
        WHEN GETDATE() BETWEEN C.CTR_fec_ini AND C.CTR_fec_fin THEN 'Activo'
        ELSE 'Inactivo' 
    END AS Estado_Contrato
FROM 
    Contrato C
JOIN 
    Empleado E ON C.EMP_cod = E.EMP_cod
ORDER BY 
    Estado_Contrato DESC, 
    E.EMP_nom ASC