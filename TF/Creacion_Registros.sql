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
(1, 1, 1, 'Juan', 'Perez', 'Lopez', 1, '12345678', 'Peru', 'M', '1985-01-01', 'Av. Siempre Viva 123', '987654321', '2010-01-01', NULL, 7, 1, 'CUSPP001', 3000.00),
(2, 2, 1, 'Maria', 'Gomez', 'Martinez', 1, '12345679', 'Peru', 'F', '1986-02-02', 'Av. Siempre Viva 124', '987654322', '2011-02-01', NULL, 7, 2, 'CUSPP002', 3200.00),
(3, 1, 2, 'Carlos', 'Lopez', 'Garcia', 1, '12345670', 'Peru', 'M', '1987-03-03', 'Av. Siempre Viva 125', '987654323', '2012-03-01', NULL, 7, 1, 'CUSPP003', 3400.00),
(4, 2, 2, 'Ana', 'Martinez', 'Rodriguez', 1, '12345671', 'Peru', 'F', '1988-04-04', 'Av. Siempre Viva 126', '987654324', '2013-04-01', NULL, 7, 2, 'CUSPP004', 3600.00),
(5, 1, 3, 'Luis', 'Garcia', 'Hernandez', 1, '12345672', 'Peru', 'M', '1989-05-05', 'Av. Siempre Viva 127', '987654325', '2014-05-01', NULL, 7, 1, 'CUSPP005', 3800.00),
(6, 2, 3, 'Elena', 'Rodriguez', 'Lopez', 1, '12345673', 'Peru', 'F', '1990-06-06', 'Av. Siempre Viva 128', '987654326', '2015-06-01', NULL, 7, 2, 'CUSPP006', 4000.00),
(7, 1, 4, 'Miguel', 'Hernandez', 'Martinez', 1, '12345674', 'Peru', 'M', '1991-07-07', 'Av. Siempre Viva 129', '987654327', '2016-07-01', NULL, 7, 1, 'CUSPP007', 4200.00),
(8, 2, 4, 'Laura', 'Fernandez', 'Garcia', 1, '12345675', 'Peru', 'F', '1992-08-08', 'Av. Siempre Viva 130', '987654328', '2017-08-01', NULL, 4, 2, 'CUSPP008', 4400.00),
(9, 1, 5, 'Jose', 'Sanchez', 'Rodriguez', 1, '12345676', 'Peru', 'M', '1993-09-09', 'Av. Siempre Viva 131', '987654329', '2018-09-01', NULL, 4, 1, 'CUSPP009', 4600.00),
(10, 2, 5, 'Lucia', 'Ramirez', 'Hernandez', 1, '12345677', 'Peru', 'F', '1994-10-10', 'Av. Siempre Viva 132', '987654330', '2019-10-01', NULL, 10, 2, 'CUSPP010', 4800.00),
(11, 1, 6, 'Pedro', 'Torres', 'Lopez', 1, '12345611', 'Peru', 'M', '1995-11-11', 'Av. Siempre Viva 133', '987654331', '2020-11-01', NULL, 8, 1, 'CUSPP011', 5000.00),
(12, 2, 6, 'Sofia', 'Flores', 'Martinez', 1, '12345622', 'Peru', 'F', '1996-12-12', 'Av. Siempre Viva 134', '987654332', '2021-12-01', NULL, 5, 2, 'CUSPP012', 5200.00),
(13, 1, 7, 'Diego', 'Rivera', 'Garcia', 1, '12345633', 'Peru', 'M', '1997-01-13', 'Av. Siempre Viva 135', '987654333', '2022-01-01', NULL, 3, 1, 'CUSPP013', 5400.00),
(14, 2, 7, 'Marta', 'Jimenez', 'Rodriguez', 1, '12345644', 'Peru', 'F', '1998-02-14', 'Av. Siempre Viva 136', '987654334', '2023-02-01', NULL, 3, 2, 'CUSPP014', 5600.00),
(15, 1, 8, 'Jorge Raúl', 'Ruiz', 'Hernandez', 1, '12345655', 'Peru', 'M', '1999-03-15', 'Av. Siempre Viva 137', '987654335', '2024-03-01', NULL, 2, 1, 'CUSPP015', 5800.00),
(16, 2, 8, 'Carmen', 'Ortiz', 'Lopez', 1, '12345666', 'Peru', 'F', '2000-04-16', 'Av. Siempre Viva 138', '987654336', '2025-04-01', NULL, 10, 2, 'CUSPP016', 6000.00),
(17, 1, 9, 'Raul', 'Morales', 'Martinez', 1, '12345677', 'Peru', 'M', '2001-05-17', 'Av. Siempre Viva 139', '987654337', '2026-05-01', NULL, 8, 1, 'CUSPP017', 6200.00),
(18, 2, 9, 'Isabel', 'Gutierrez', 'Garcia', 1, '12345688', 'Peru', 'F', '2002-06-18', 'Av. Siempre Viva 140', '987654338', '2027-06-01', NULL, 1, 2, 'CUSPP018', 6400.00),
(19, 1, 10, 'Alberto', 'Navarro', 'Rodriguez', 1, '12345699', 'Peru', 'M', '2003-07-19', 'Av. Siempre Viva 141', '987654339', '2028-07-01', NULL, 6, 1, 'CUSPP019', 6600.00),
(20, 2, 10, 'Patricia', 'Dominguez', 'Hernandez', 1, '12345111', 'Peru', 'F', '2004-08-20', 'Av. Siempre Viva 142', '987654340', '2029-08-01', NULL, 6, 2, 'CUSPP020', 6800.00);