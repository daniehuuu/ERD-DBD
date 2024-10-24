--Calcular salario neto de los empleados
SELECT 
    E.EMP_cod,
    E.EMP_nom,
    E.EMP_ape_p,
    E.EMP_ape_m,
    E.EMP_sld_bsc AS Sueldo_Basico,
    ISNULL(SUM(CASE WHEN CS.CSA_tipo = 0 THEN CS.CSA_mon ELSE 0 END), 0) AS Total_Deducciones,
    E.EMP_sld_bsc - ISNULL(SUM(CASE WHEN CS.CSA_tipo = 0 THEN CS.CSA_mon ELSE 0 END), 0) AS Salario_Neto
FROM 
    Empleado E
LEFT JOIN 
    Calculo_Salario CS ON E.EMP_cod = CS.EMP_cod
WHERE 
    E.EMP_fec_ces IS NULL
GROUP BY 
    E.EMP_cod, E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m, E.EMP_sld_bsc
ORDER BY 
    E.EMP_cod;

--Calcular salario neto de los empleados más fácil
SELECT 
    E.EMP_cod,
    E.EMP_nom,
    E.EMP_ape_p,
    E.EMP_ape_m,
    E.EMP_sld_bsc AS Sueldo_Basico,
    ISNULL(SUM(CASE WHEN CS.CSA_tipo = 0 THEN CS.CSA_mon ELSE 0 END), 0) AS Total_Deducciones,
    E.EMP_sld_bsc - ISNULL(SUM(CASE WHEN CS.CSA_tipo = 0 THEN CS.CSA_mon ELSE 0 END), 0) AS Salario_Neto,
    A.AFP_desc AS Nombre_AFP,
    C.CAR_desc AS Nombre_Cargo
FROM 
    Empleado E
LEFT JOIN 
    Calculo_Salario CS ON E.EMP_cod = CS.EMP_cod
LEFT JOIN 
    AFP A ON E.AFP_cod = A.AFP_cod
LEFT JOIN 
    Cargo C ON E.CAR_cod = C.CAR_cod
WHERE 
    E.EMP_fec_ces IS NULL
GROUP BY 
    E.EMP_cod, E.EMP_nom, E.EMP_ape_p, E.EMP_ape_m, E.EMP_sld_bsc, A.AFP_desc, C.CAR_desc
ORDER BY 
    Nombre_AFP, Nombre_Cargo