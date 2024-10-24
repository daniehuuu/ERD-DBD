INSERT INTO Division (DIV_cod, DIV_Nom, DIV_Ubi_Fis)
VALUES
(1, 'Recursos humanos', 'Edificio A'),
(2, 'Finanzas', 'Edificio B'),
(3, 'Tecnología', 'Edificio C'),
(4, 'Marketing', 'Edificio D'),
(5, 'Ventas', 'Edificio E'),
(6, 'Investigación y Desarrollo', 'Edificio F'),
(7, 'Operaciones', 'Edificio G'),
(8, 'Legal', 'Edificio H'),
(9, 'Atención al cliente', 'Edificio I'),
(10, 'Compras', 'Edificio J');

INSERT INTO Sub_division (SDV_cod, SDV_nom, DIV_cod)
VALUES
(1, 'Selección de personal', 1),
(2, 'Capacitación y Desarrollo', 1),  
(3, 'Contabilidad', 2),  
(4, 'Tesorería', 2),  
(5, 'Desarrollo de software', 3), 
(6, 'Soporte Técnico', 3), 
(7, 'Publicidad', 4),  
(8, 'Investigación de mercados', 4),  
(9, 'Ventas internacionales', 5), 
(10, 'Ventas nacionales', 5);  

INSERT INTO Cargo (CAR_Cod, CAR_Desc)
VALUES
(1, 'Gerente general'),
(2, 'Analista financiero'),
(3, 'Desarrollador'),
(4, 'Asistente admin.'),
(5, 'Gerente marketing'),
(6, 'Coord. RRHH'),
(7, 'Técnico Soporte'),
(8, 'Rep. Ventas'),
(9, 'Inv. Mercado'),
(10, 'Abogado Corporativo');

INSERT INTO Tipo_Beneficio (TBE_cod, TBE_desc) VALUES 
(001, 'Seguro de vida'),
(002, 'Bono por desempeño'),
(003, 'Bono por trabajo en zonas remotas'),
(004, 'Plan de pension'),
(005, 'Bono por riesgo'),
(006, 'Bono por objetivo de sostenibilidad'),
(007, 'Bonos de productividad global'),
(008, 'Bonos por impacto social'),
(009, 'Bonos por antigüedad'),
(010, 'Bonos por eficiencia operativa');

INSERT INTO Tipo_Licencia (TLI_cod, TLI_desc, TLI_rem) VALUES 
(001, 'Licencia por asistencia medica', 1),
(002, 'Licencia por maternidad', 1),
(003, 'Licencia por enfermedad grave o terminal', 1),
(004, 'Licencia por fallecimiento de familiares', 0),
(005, 'Licencia por paternidad', 1),
(006, 'Licencia por asistencia médica a un familiar', 0),
(007, 'Licencia sindical', 1),
(008, 'Licencia por ser bombero voluntario', 0),
(009, 'Licencia por adopción', 1),
(010, 'Licencia por lactancia', 0);

INSERT INTO Banco (BAN_cod, BAN_desc) VALUES
(1, 'Banco Nacional'),
(2, 'Banco Popular'),
(3, 'Banco Central'),
(4, 'Banco del Estado'),
(5, 'Banco de la Ciudad'),
(6, 'Banco Internacional'),
(7, 'Banco de la Amistad'),
(8, 'Banco Financiero'),
(9, 'Banco Regional'),
(10, 'Banco Metropolitano');

INSERT INTO AFP (AFP_cod, AFP_desc, AFP_apor_obl, AFP_seg, AFP_com)
VALUES 
(1, 'AFP Horizonte', 10.5, 1.2, 0.3),
(2, 'AFP Integra', 11.0, 1.1, 0.35),
(3, 'AFP Prima', 10.8, 1.3, 0.32),
(4, 'AFP Profuturo', 10.9, 1.2, 0.33),
(5, 'AFP Habitat', 11.2, 1.4, 0.31),
(6, 'AFP Capital', 10.7, 1.5, 0.28),
(7, 'AFP Crecer', 11.1, 1.1, 0.34),
(8, 'AFP Futuro', 10.6, 1.3, 0.29),
(9, 'AFP Vida', 11.3, 1.2, 0.32),
(10, 'AFP Seguro', 10.5, 1.4, 0.3);

INSERT INTO Tipo_Identificacion (TID_cod, TID_abr, TID_desc) VALUES
(1, 'DNI', 'Documento Nacional de Identidad'),
(2, 'CE', 'Carné de Extranjería'),
(3, 'RUC', 'Registro Único de Contribuyente'),
(4, 'PAS', 'Pasaporte'),
(5, 'OTRO', 'Otro tipo de identificación');

INSERT INTO Condicion_Trabajo (CTB_cod, CTB_desc) VALUES
(1, 'Tiempo Completo'),
(2, 'Medio Tiempo'),
(3, 'Contrato'),
(4, 'Freelance'),
(5, 'Prácticas'),
(6, 'Remoto'),
(7, 'Presencial');

INSERT INTO Parentesco (PAR_cod, PAR_desc) VALUES
(1, 'Padre'),
(2, 'Madre'),
(3, 'Hermano'),
(4, 'Hermana'),
(5, 'Hijo'),
(6, 'Hija'),
(7, 'Tío'),
(8, 'Tía'),
(9, 'Primo'),
(10, 'Prima');


INSERT INTO Empleado (EMP_cod, CTB_cod, SDV_cod, EMP_nom, EMP_ape_p, EMP_ape_m, TID_cod, EMP_num_iden, EMP_nac, EMP_sex, EMP_fec_nac, EMP_dir, EMP_tel, EMP_fec_ing, EMP_fec_ces, CAR_cod, AFP_cod, EMP_CUSPP, EMP_sld_bsc) VALUES
(1, 1, 6, 'Juan', 'Perez', 'Lopez', 1, '12345678', 'Peru', 'M', '1985-01-01', 'Av. Siempre Viva 123', '987654321', '2010-01-01', NULL, 7, 1, 'CUSPP001', 3000.00),
(2, 2, 6, 'Maria', 'Gomez', 'Martinez', 1, '12345679', 'Peru', 'F', '1986-02-02', 'Av. Siempre Viva 124', '987654322', '2011-02-01', NULL, 7, 2, 'CUSPP002', 3200.00),
(3, 1, 6, 'Carlos', 'Lopez', 'Garcia', 1, '12345670', 'Peru', 'M', '1987-03-03', 'Av. Siempre Viva 125', '987654323', '2012-03-01', NULL, 7, 1, 'CUSPP003', 3400.00),
(4, 2, 6, 'Ana', 'Martinez', 'Rodriguez', 1, '12345671', 'Peru', 'F', '1988-04-04', 'Av. Siempre Viva 126', '987654324', '2013-04-01', NULL, 7, 2, 'CUSPP004', 3600.00),
(5, 1, 6, 'Luis', 'Garcia', 'Hernandez', 1, '12345672', 'Peru', 'M', '1989-05-05', 'Av. Siempre Viva 127', '987654325', '2014-05-01', NULL, 7, 1, 'CUSPP005', 3800.00),
(6, 2, 6, 'Elena', 'Rodriguez', 'Lopez', 1, '12345673', 'Peru', 'F', '1990-06-06', 'Av. Siempre Viva 128', '987654326', '2015-06-01', '2020-05-01', 7, 2, 'CUSPP006', 4000.00),
(7, 1, 6, 'Miguel', 'Hernandez', 'Martinez', 1, '12345674', 'Peru', 'M', '1991-07-07', 'Av. Siempre Viva 129', '987654327', '2016-07-01', '2020-08-01', 7, 1, 'CUSPP007', 4200.00),
(8, 2, 6, 'Laura', 'Fernandez', 'Garcia', 1, '12345675', 'Peru', 'F', '1992-08-08', 'Av. Siempre Viva 130', '987654328', '2017-08-01', NULL, 4, 2, 'CUSPP008', 4400.00),
(9, 1, 5, 'Jose', 'Sanchez', 'Rodriguez', 1, '12345676', 'Peru', 'M', '1993-09-09', 'Av. Siempre Viva 131', '987654329', '2018-09-01', NULL, 10, 1, 'CUSPP009', 4600.00),
(10, 2, 3, 'Lucia', 'Ramirez', 'Hernandez', 1, '12345677', 'Peru', 'F', '1994-10-10', 'Av. Siempre Viva 132', '987654330', '2019-10-01', NULL, 1, 2, 'CUSPP010', 4800.00),
(11, 1, 7, 'Pedro', 'Torres', 'Lopez', 1, '12345611', 'Peru', 'M', '1995-11-11', 'Av. Siempre Viva 133', '987654331', '2020-11-01', NULL, 5, 1, 'CUSPP011', 5000.00),
(12, 1, 7, 'Sofia', 'Flores', 'Martinez', 1, '12345622', 'Peru', 'F', '1996-12-12', 'Av. Siempre Viva 134', '987654332', '2021-12-01', NULL, 6, 2, 'CUSPP012', 5200.00),
(13, 1, 10, 'Diego', 'Rivera', 'Garcia', 1, '12345633', 'Peru', 'M', '1997-01-13', 'Av. Siempre Viva 135', '987654333', '2022-01-01', NULL, 3, 1, 'CUSPP013', 5400.00),
(14, 1, 9, 'Marta', 'Jimenez', 'Rodriguez', 1, '12345644', 'Peru', 'F', '1998-02-14', 'Av. Siempre Viva 136', '987654334', '2023-02-01', NULL, 3, 2, 'CUSPP014', 5600.00),
(15, 1, 8, 'Jorge Raúl', 'Ruiz', 'Hernandez', 1, '12345655', 'Peru', 'M', '1999-03-15', 'Av. Siempre Viva 137', '987654335', '2024-03-01', NULL, 3, 1, 'CUSPP015', 5800.00),
(16, 2, 3, 'Carmen', 'Ortiz', 'Lopez', 1, '12345666', 'Peru', 'F', '2000-04-16', 'Av. Siempre Viva 138', '987654336', '2025-04-01', NULL, 2, 2, 'CUSPP016', 6000.00),
(17, 1, 7, 'Raul', 'Morales', 'Martinez', 1, '12345677', 'Peru', 'M', '2001-05-17', 'Av. Siempre Viva 139', '987654337', '2026-05-01', NULL, 5, 1, 'CUSPP017', 6200.00),
(18, 2, 8, 'Isabel', 'Gutierrez', 'Garcia', 1, '12345688', 'Peru', 'F', '2002-06-18', 'Av. Siempre Viva 140', '987654338', '2027-06-01', NULL, 1, 2, 'CUSPP018', 6400.00),
(19, 1, 9, 'Alberto', 'Navarro', 'Rodriguez', 1, '12345699', 'Peru', 'M', '2003-07-19', 'Av. Siempre Viva 141', '987654339', '2028-07-01', NULL, 8, 1, 'CUSPP019', 6600.00),
(20, 2, 10, 'Patricia', 'Dominguez', 'Hernandez', 1, '12345111', 'Peru', 'F', '2004-08-20', 'Av. Siempre Viva 142', '987654340', '2029-08-01', NULL, 8, 2, 'CUSPP020', 6800.00);

INSERT INTO Beneficios (BEN_cod, EMP_cod,TBE_cod, BEN_fec, BEN_mon) VALUES
(1, 1, 001, '2023-01-15', 500.00),
(2, 2, 002, '2023-02-20', 1000.00),
(3, 3, 003, '2023-03-10', 200.00),
(4, 4, 004, '2023-04-25', 300.00),
(5, 5, 005, '2023-05-12', 150.00),
(6, 6, 006, '2023-06-01', 250.00),
(7, 7, 007, '2023-07-05', 1200.00),
(8, 8, 008, '2023-08-14', 800.00),
(9, 9, 009, '2023-09-23', 400.00),
(10, 10, 010, '2023-10-30', 700.00)

INSERT INTO Familiar (FAM_cod, PAR_cod, TID_cod, FAM_num_iden, FAM_nom, FAM_ape_p, FAM_ape_m, FAM_fec_nac, FAM_fec_fall, FAM_sex) VALUES
(1, 1, 1, '81234567', 'Carlos', 'Perez', 'Ramirez', '1960-01-01', NULL, 'M'),
(2, 2, 1, '98765432', 'Maria', 'Ramirez', 'Lopez', '1962-02-12', NULL, 'F'),
(3, 3, 1, '11122233', 'Jorge', 'Perez', 'Ramirez', '1990-05-15', NULL, 'M'),
(4, 4, 1, '44455566', 'Laura', 'Perez', 'Ramirez', '1992-08-30', NULL, 'F'),
(5, 5, 1, '77788899', 'David', 'Perez', 'Ramirez', '2010-12-22', NULL, 'M'),
(6, 6, 1, '11223344', 'Lucia', 'Perez', 'Ramirez', '2012-03-14', NULL, 'F'),
(7, 7, 1, '22334455', 'Juan', 'Ramirez', 'Lopez', '1975-07-09', NULL, 'M'),
(8, 8, 1, '33445566', 'Ana', 'Ramirez', 'Lopez', '1978-11-18', NULL, 'F'),
(9, 9, 1, '44556677', 'Luis', 'Lopez', 'Ramirez', '1985-06-05', NULL, 'M'),
(10, 10, 1, '55667788', 'Sofia', 'Lopez', 'Ramirez', '1987-09-25', NULL, 'F')

INSERT INTO FAM_EMP (FAM_cod, EMP_cod) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10)

INSERT INTO Licencia (LIC_cod, EMP_cod, TLI_cod, LIC_fec_sol, LIC_fec_ini, LIC_fic_fin, LIC_est)
VALUES
(1, 1, 1, '2024-08-01', '2024-08-05', '2024-08-15', 1),
(2, 2, 2, '2024-09-01', '2024-09-10', '2024-09-20', 0),
(3, 3, 3, '2024-10-01', '2024-10-05', '2024-10-15', 1),
(4, 1, 1, '2024-11-01', '2024-11-10', '2024-11-20', 1),
(5, 2, 2, '2024-12-01', '2024-12-10', '2024-12-20', 1),
(6, 3, 3, '2025-01-01', '2025-01-10', '2025-01-20', 1),
(7, 1, 1, '2025-02-01', '2025-02-10', '2025-02-20', 1),
(8, 2, 2, '2025-03-01', '2025-03-10', '2025-03-20', 1),
(9, 3, 3, '2025-04-01', '2025-04-10', '2025-04-20', 0),
(10, 1, 1, '2025-05-01', '2025-05-10', '2025-05-20', 1),
(11, 2, 2, '2025-06-01', '2025-06-10', '2025-06-20', 1),
(12, 3, 3, '2025-07-01', '2025-07-10', '2025-07-20', 1),
(13, 1, 1, '2025-08-01', '2025-08-10', '2025-08-20', 1),
(14, 2, 2, '2025-09-01', '2025-09-10', '2025-09-20', 0),
(15, 3, 3, '2025-10-01', '2025-10-10', '2025-10-20', 1),
(16, 1, 1, '2025-11-01', '2025-11-10', '2025-11-20', 1),
(17, 2, 2, '2025-12-01', '2025-12-10', '2025-12-20', 1),
(18, 3, 3, '2026-01-01', '2026-01-10', '2026-01-20', 0),
(19, 1, 1, '2026-02-01', '2026-02-10', '2026-02-20', 1),
(20, 2, 2, '2026-03-01', '2026-03-10', '2026-03-20', 1),
(21, 3, 3, '2026-04-01', '2026-04-10', '2026-04-20', 1),
(22, 1, 1, '2026-05-01', '2026-05-10', '2026-05-20', 1)

INSERT INTO Asistencia (AST_cod, EMP_cod, AST_fec_ent, AST_hora_ent, AST_fec_sal, AST_hora_sal)
VALUES
(1, 1, '2024-10-04', '08:00:00', '2024-10-04', '17:00:00'),
(2, 2, '2024-10-05', '09:00:00', '2024-10-05', '18:00:00'),
(3, 3, '2024-10-06', '08:30:00', '2024-10-06', '17:30:00'),
(4, 1, '2024-10-07', '08:00:00', '2024-10-07', '17:00:00'),
(5, 2, '2024-10-08', '09:00:00', '2024-10-08', '18:00:00'),
(6, 3, '2024-10-09', '08:30:00', '2024-10-09', '17:30:00'),
(7, 1, '2024-10-10', '08:00:00', '2024-10-10', '17:00:00'),
(8, 2, '2024-10-11', '09:00:00', '2024-10-11', '18:00:00'),
(9, 3, '2024-10-12', '08:30:00', '2024-10-12', '17:30:00'),
(10, 1, '2024-10-13', '08:00:00', '2024-10-13', '17:00:00'),
(11, 2, '2024-10-14', '09:00:00', '2024-10-14', '18:00:00'),
(12, 3, '2024-10-15', '08:30:00', '2024-10-15', '17:30:00'),
(13, 1, '2024-10-16', '08:00:00', '2024-10-16', '17:00:00'),
(14, 2, '2024-10-17', '09:00:00', '2024-10-17', '18:00:00'),
(15, 3, '2024-10-18', '08:30:00', '2024-10-18', '17:30:00'),
(16, 1, '2024-10-19', '08:00:00', '2024-10-19', '17:00:00'),
(17, 2, '2024-10-20', '09:00:00', '2024-10-20', '18:00:00'),
(18, 3, '2024-10-21', '08:30:00', '2024-10-21', '17:30:00'),
(19, 1, '2024-10-22', '08:00:00', '2024-10-22', '17:00:00'),
(20, 2, '2024-10-23', '09:00:00', '2024-10-23', '18:00:00'),
(21, 3, '2024-10-24', '08:30:00', '2024-10-24', '17:30:00'),
(22, 1, '2024-10-25', '08:00:00', '2024-10-25', '17:00:00')

INSERT INTO Vacaciones (VAC_cod, EMP_cod, VAC_fec_sol, VAC_fec_ini, VAC_fec_fin, VAC_est)
VALUES
(1, 1, '2024-10-29', '2024-11-07', '2024-11-21', 1), 
(2, 12, '2024-10-30', '2024-11-08', '2024-11-22', 0),  
(3, 17, '2024-10-31', '2024-11-09', '2024-11-23', 1),  
(4, 5, '2024-11-01', '2024-11-10', '2024-11-24', 1),  
(5, 3, '2024-11-02', '2024-11-11', '2024-11-25', 0), 
(6, 11, '2024-03-14', '2024-04-01', '2024-04-14', 1),
(7, 19, '2024-09-11', '2024-09-15', '2024-09-19', 0), 
(8, 12, '2024-01-02', '2024-04-10', '2024-04-20', 1), 
(9, 2, '2024-10-22', '2024-10-24', '2024-10-30', 1), 
(10, 3, '2024-07-20', '2024-07-29', '2024-07-30', 0), 
(11, 4, '2024-02-21', '2024-02-24', '2024-02-28', 0), 
(12, 16, '2024-12-23', '2024-12-31', '2024-12-31', 1) 

INSERT INTO Historial_Laboral (HIS_cod, EMP_cod, CAR_cod, HIS_fec_in, HIS_fec_fin, HIS_sld_bsc)
VALUES
(1, 6, 4, '2015-06-01', '2016-05-01', 3800.00),  
(2, 6, 7, '2016-06-01', '2018-05-01', 4000.00),   
(3, 7, 4, '2016-07-01', '2016-08-01', 4200.00),  
(4, 3, 7, '2012-03-01', '2014-03-01', 3400.00),  
(5, 3, 4, '2014-04-01', '2016-04-01', 3600.00),   
(6, 4, 3, '2013-04-01', '2015-04-01', 3600.00),  
(7, 9, 5, '2018-09-01', '2020-08-01', 4500.00),  
(8, 9, 2, '2020-09-01', '2022-08-01', 4600.00), 
(9, 7, 7, '2016-09-01', '2017-09-01', 4200.00),   
(10, 7, 8, '2017-10-01', '2019-09-01', 4400.00) 

--Inserción de registros de Calculo_Salario. Se considera únicamente el sueldo básico y las deducciones por AFP.
CREATE PROCEDURE InsertCalculoSalario
AS
BEGIN
    DECLARE @EMP_cod INT, 
            @EMP_sld_bsc DECIMAL(10, 2), 
            @AFP_apor_obl DECIMAL(4, 2), 
            @AFP_seg DECIMAL(4, 2), 
            @AFP_com DECIMAL(4, 2);
    
    DECLARE @AFP_obl_amount DECIMAL(10, 2), 
            @seguro_amount DECIMAL(10, 2), 
            @comision_amount DECIMAL(10, 2);

    -- Cursor to iterate through each employee
    DECLARE employee_cursor CURSOR FOR
    SELECT E.EMP_cod, E.EMP_sld_bsc, A.AFP_apor_obl, A.AFP_seg, A.AFP_com
    FROM Empleado E
    JOIN AFP A ON E.AFP_cod = A.AFP_cod
    WHERE E.EMP_fec_ces IS NULL;

    OPEN employee_cursor;

    FETCH NEXT FROM employee_cursor INTO @EMP_cod, @EMP_sld_bsc, @AFP_apor_obl, @AFP_seg, @AFP_com;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Insert basic salary record
        INSERT INTO Calculo_Salario (EMP_cod, CSA_mon, CSA_desc, CSA_fec_ini, CSA_fec_fin, CSA_tipo)
        VALUES (@EMP_cod, @EMP_sld_bsc, 'Sueldo básico', '2024-10-01', '2024-10-31', 1); 

        -- Calculate deductions
        SET @AFP_obl_amount = @EMP_sld_bsc * (@AFP_apor_obl / 100);
        SET @seguro_amount = @EMP_sld_bsc * (@AFP_seg / 100);
        SET @comision_amount = @EMP_sld_bsc * (@AFP_com / 100);

        -- Insert deduction records
        INSERT INTO Calculo_Salario (EMP_cod, CSA_mon, CSA_desc, CSA_fec_ini, CSA_fec_fin, CSA_tipo)
        VALUES (@EMP_cod, @AFP_obl_amount, 'Aporte obligatorio', '2024-10-01', '2024-10-31', 0); 

        INSERT INTO Calculo_Salario (EMP_cod, CSA_mon, CSA_desc, CSA_fec_ini, CSA_fec_fin, CSA_tipo)
        VALUES (@EMP_cod, @seguro_amount, 'Seguro', '2024-10-01', '2024-10-31', 0); 

        INSERT INTO Calculo_Salario (EMP_cod, CSA_mon, CSA_desc, CSA_fec_ini, CSA_fec_fin, CSA_tipo)
        VALUES (@EMP_cod, @comision_amount, 'Comisión', '2024-10-01', '2024-10-31', 0); 

        FETCH NEXT FROM employee_cursor INTO @EMP_cod, @EMP_sld_bsc, @AFP_apor_obl, @AFP_seg, @AFP_com;
    END;

    CLOSE employee_cursor;
    DEALLOCATE employee_cursor;
END

EXEC InsertCalculoSalario

INSERT INTO Contrato (CTR_cod, EMP_cod, CTR_tip_con, CTR_fec_ini, CTR_fec_fin, CTR_sld_bsc, CTR_per_prueb, CTR_mot_ter)
VALUES
(1, 1, 'Indefinido', '2024-01-01', '2025-01-01', 2500.00, 3, NULL),
(2, 2, 'Indefinido', '2024-01-01', '2025-01-01', 2800.00, 3, NULL),
(3, 3, 'Temporal', '2024-01-01', '2024-12-31', 3000.00, 2, NULL),
(4, 4, 'Indefinido', '2024-01-01', '2025-01-01', 2600.00, 3, NULL),
(5, 5, 'Indefinido', '2024-01-01', '2025-01-01', 3200.00, 3, NULL),
(6, 6, 'Temporal', '2024-01-01', '2024-11-30', 2900.00, 2, 'Necesidad de aumento de personal'),
(7, 7, 'Indefinido', '2024-01-01', '2025-01-01', 3100.00, 3, 'Irresponsabilidad laboral prolongada'),
(8, 8, 'Indefinido', '2024-01-01', '2025-01-01', 2700.00, 3, NULL),
(9, 9, 'Indefinido', '2024-01-01', '2025-01-01', 3400.00, 3, NULL),
(10, 10, 'Temporal', '2024-01-01', '2024-10-31', 3000.00, 2, NULL),
(11, 11, 'Indefinido', '2024-01-01', '2025-01-01', 3600.00, 3, NULL),
(12, 12, 'Temporal', '2024-02-01', '2024-12-31', 2800.00, 2, NULL),
(13, 13, 'Indefinido', '2024-03-01', '2025-03-01', 3300.00, 3, NULL),
(14, 14, 'Indefinido', '2024-04-01', '2025-04-01', 3700.00, 3, NULL),
(15, 15, 'Temporal', '2024-03-15', '2024-11-30', 2700.00, 2, NULL),
(16, 16, 'Indefinido', '2024-01-15', '2025-01-15', 3200.00, 3, NULL),
(17, 17, 'Indefinido', '2024-02-15', '2025-02-15', 3500.00, 3, NULL),
(18, 18, 'Temporal', '2024-05-01', '2024-09-30', 2500.00, 2, NULL),
(19, 19, 'Indefinido', '2024-06-01', '2025-06-01', 3400.00, 3, NULL),
(20, 20, 'Temporal', '2024-07-01', '2024-12-31', 3100.00, 2, NULL)