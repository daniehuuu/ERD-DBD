
CREATE TABLE AFP
(
  AFP_cod      int          NOT NULL,
  AFP_desc     nvarchar(15) NOT NULL,
  AFP_apor_obl decimal(4,2) NOT NULL,
  AFP_seg      decimal(4,2) NOT NULL,
  AFP_com      decimal(4,2) NOT NULL,
  CONSTRAINT PK_AFP PRIMARY KEY (AFP_cod)
)
GO

EXECUTE sys.sp_addextendedproperty 'MS_Description',
  'seguro', 'user', dbo, 'table', 'AFP', 'column', 'AFP_seg'
GO

EXECUTE sys.sp_addextendedproperty 'MS_Description',
  'comisión', 'user', dbo, 'table', 'AFP', 'column', 'AFP_com'
GO

CREATE TABLE Asistencia
(
  AST_cod      INT  NOT NULL,
  EMP_cod      int  NOT NULL,
  AST_fec_ent  date NOT NULL,
  AST_hora_ent time NOT NULL,
  AST_fec_sal  date NOT NULL,
  AST_hora_sal time NOT NULL,
  CONSTRAINT PK_Asistencia PRIMARY KEY (AST_cod)
)
GO

CREATE TABLE Banco
(
  BAN_cod  int         NOT NULL,
  BAN_desc varchar(30) NOT NULL,
  CONSTRAINT PK_Banco PRIMARY KEY (BAN_cod)
)
GO

CREATE TABLE Beneficios
(
  BEN_cod INT           NOT NULL,
  EMP_cod int           NOT NULL,
  TBE_cod int           NOT NULL,
  BEN_fec DATE          NOT NULL,
  BEN_mon DECIMAL(10,2) NOT NULL,
  CONSTRAINT PK_Beneficios PRIMARY KEY (BEN_cod)
)
GO

CREATE TABLE Calculo_Salario
(
  CSA_cod     int           NOT NULL,
  EMP_cod     int           NOT NULL,
  CSA_tipo    bit           NOT NULL,
  CSA_mon     decimal(10,2) NOT NULL,
   CSA_desc   nvarchar(35)  NOT NULL,
  CSA_fec_ini date          NOT NULL,
  CSA_fec_fin date         ,
  CONSTRAINT PK_Calculo_Salario PRIMARY KEY (CSA_cod)
)
GO

EXECUTE sys.sp_addextendedproperty 'MS_Description',
  'Ingreso/descuento', 'user', dbo, 'table', 'Calculo_Salario', 'column', 'CSA_tipo'
GO

CREATE TABLE Cargo
(
  CAR_cod  int          NOT NULL,
  CAR_desc nvarchar(25) NOT NULL,
  CONSTRAINT PK_Cargo PRIMARY KEY (CAR_cod)
)
GO

CREATE TABLE Condicion_Trabajo
(
  CTB_cod  int          NOT NULL,
  CTB_desc nvarchar(30) NOT NULL,
  CONSTRAINT PK_Condicion_Trabajo PRIMARY KEY (CTB_cod)
)
GO

CREATE TABLE Contrato
(
  CTR_cod       INT           NOT NULL,
  EMP_cod       int           NOT NULL,
  CTR_tip_con   VARCHAR(100)  NOT NULL,
  CTR_fec_ini   DATE          NOT NULL,
  CTR_fec_fin   DATE          NOT NULL,
  CTR_sld_bsc   decimal(10,2) NOT NULL,
  CTR_per_prueb int          ,
  CTR_mot_ter   ntext        ,
  CONSTRAINT PK_Contrato PRIMARY KEY (CTR_cod)
)
GO

CREATE TABLE Cuenta_Bancaria
(
  CBC_cod     int NOT NULL,
  EMP_cod     int NOT NULL,
  BAN_cod     int NOT NULL,
  CBC_num_cta int NOT NULL,
  CBC_CTS     bit NOT NULL,
  CONSTRAINT PK_Cuenta_Bancaria PRIMARY KEY (CBC_cod)
)
GO

CREATE TABLE Division
(
  DIV_cod     INT           NOT NULL,
  DIV_nom     nvarchar(100) NOT NULL,
  DIV_ubi_fis ntext         NOT NULL,
  CONSTRAINT PK_Division PRIMARY KEY (DIV_cod)
)
GO

CREATE TABLE Empleado
(
  EMP_cod      int           NOT NULL,
  CTB_cod      int           NOT NULL,
  SDV_cod      int           NOT NULL,
  EMP_nom      nvarchar(35)  NOT NULL,
  EMP_ape_p    nvarchar(15)  NOT NULL,
  EMP_ape_m    nvarchar(15)  NOT NULL,
  TID_cod      int           NOT NULL,
  EMP_num_iden varchar(12)   NOT NULL,
  EMP_nac      varchar(25)   NOT NULL,
  EMP_sex      char(1)       NOT NULL,
  EMP_fec_nac  date          NOT NULL,
  EMP_dir      nvarchar(50)  NOT NULL,
  EMP_tel      VARCHAR(15)   NOT NULL,
  EMP_fec_ing  DATE          NOT NULL,
  EMP_fec_ces  date         ,
  CAR_cod      int           NOT NULL,
  AFP_cod      int           NOT NULL,
  EMP_CUSPP    char(12)      NOT NULL,
  EMP_sld_bsc  decimal(10,2) NOT NULL,
  CONSTRAINT PK_Empleado PRIMARY KEY (EMP_cod)
)
GO

EXECUTE sys.sp_addextendedproperty 'MS_Description',
  'index', 'user', dbo, 'table', 'Empleado', 'column', 'EMP_num_iden'
GO

CREATE TABLE FAM_EMP
(
  FAM_cod int NOT NULL,
  EMP_cod int NOT NULL
)
GO

CREATE TABLE Familiar
(
  FAM_cod      int          NOT NULL,
  PAR_cod      int          NOT NULL,
  TID_cod      int          NOT NULL,
  FAM_num_iden varchar(12)  NOT NULL,
  FAM_nom      nvarchar(35) NOT NULL,
  FAM_ape_p    nvarchar(15) NOT NULL,
  FAM_ape_m    nvarchar(15) NOT NULL,
  FAM_fec_nac  date         NOT NULL,
  FAM_fec_fall date        ,
  FAM_sex      char(1)      NOT NULL,
  CONSTRAINT PK_Familiar PRIMARY KEY (FAM_cod)
)
GO

CREATE TABLE Historial_Laboral
(
  HIS_cod     int           NOT NULL,
  EMP_cod     int           NOT NULL,
  CAR_cod     int           NOT NULL,
  HIS_fec_in  date          NOT NULL,
  HIS_fec_fin date          NOT NULL,
  HIS_sld_bsc decimal(10,2) NOT NULL,
  CONSTRAINT PK_Historial_Laboral PRIMARY KEY (HIS_cod)
)
GO

CREATE TABLE Licencia
(
  LIC_cod     int  NOT NULL,
  EMP_cod     int  NOT NULL,
  TLI_cod     int  NOT NULL,
  LIC_fec_sol date NOT NULL,
  LIC_fec_ini date,
  LIC_fic_fin date,
  LIC_est     bit ,
  CONSTRAINT PK_Licencia PRIMARY KEY (LIC_cod)
)
GO

EXECUTE sys.sp_addextendedproperty 'MS_Description',
  'aprobado o no', 'user', dbo, 'table', 'Licencia', 'column', 'LIC_est'
GO

CREATE TABLE Parentesco
(
  PAR_cod  int          NOT NULL,
  PAR_desc nvarchar(12) NOT NULL,
  CONSTRAINT PK_Parentesco PRIMARY KEY (PAR_cod)
)
GO

CREATE TABLE Sub_division
(
  SDV_cod int           NOT NULL,
  SDV_nom nvarchar(100) NOT NULL,
  DIV_cod INT           NOT NULL,
  CONSTRAINT PK_Sub_division PRIMARY KEY (SDV_cod)
)
GO

CREATE TABLE Tipo_Beneficio
(
  TBE_cod  int         NOT NULL,
  TBE_desc varchar(30) NOT NULL,
  CONSTRAINT PK_Tipo_Beneficio PRIMARY KEY (TBE_cod)
)
GO

CREATE TABLE Tipo_Identificacion
(
  TID_cod  int          NOT NULL,
  TID_abr  nvarchar(5)  NOT NULL,
  TID_desc nvarchar(32) NOT NULL,
  CONSTRAINT PK_Tipo_Identificacion PRIMARY KEY (TID_cod)
)
GO

CREATE TABLE Tipo_Licencia
(
  TLI_cod  int          NOT NULL,
  TLI_desc nvarchar(30) NOT NULL,
  TLI_rem  bit          NOT NULL,
  CONSTRAINT PK_Tipo_Licencia PRIMARY KEY (TLI_cod)
)
GO

CREATE TABLE Vacaciones
(
  VAC_cod     INT  NOT NULL,
  EMP_cod     int  NOT NULL,
  VAC_fec_sol DATE NOT NULL,
  VAC_fec_ini DATE NOT NULL,
  VAC_fec_fin DATE NOT NULL,
  VAC_est     bit  NOT NULL,
  CONSTRAINT PK_Vacaciones PRIMARY KEY (VAC_cod)
)
GO

EXECUTE sys.sp_addextendedproperty 'MS_Description',
  'aprobado o no', 'user', dbo, 'table', 'Vacaciones', 'column', 'VAC_est'
GO

ALTER TABLE Asistencia
  ADD CONSTRAINT FK_Empleado_TO_Asistencia
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Contrato
  ADD CONSTRAINT FK_Empleado_TO_Contrato
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Beneficios
  ADD CONSTRAINT FK_Empleado_TO_Beneficios
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Empleado
  ADD CONSTRAINT FK_AFP_TO_Empleado
    FOREIGN KEY (AFP_cod)
    REFERENCES AFP (AFP_cod)
GO

ALTER TABLE Empleado
  ADD CONSTRAINT FK_Condicion_Trabajo_TO_Empleado
    FOREIGN KEY (CTB_cod)
    REFERENCES Condicion_Trabajo (CTB_cod)
GO

ALTER TABLE Sub_division
  ADD CONSTRAINT FK_Division_TO_Sub_division
    FOREIGN KEY (DIV_cod)
    REFERENCES Division (DIV_cod)
GO

ALTER TABLE Empleado
  ADD CONSTRAINT FK_Sub_division_TO_Empleado
    FOREIGN KEY (SDV_cod)
    REFERENCES Sub_division (SDV_cod)
GO

ALTER TABLE Empleado
  ADD CONSTRAINT FK_Tipo_Identificacion_TO_Empleado
    FOREIGN KEY (TID_cod)
    REFERENCES Tipo_Identificacion (TID_cod)
GO

ALTER TABLE Vacaciones
  ADD CONSTRAINT FK_Empleado_TO_Vacaciones
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Licencia
  ADD CONSTRAINT FK_Tipo_Licencia_TO_Licencia
    FOREIGN KEY (TLI_cod)
    REFERENCES Tipo_Licencia (TLI_cod)
GO

ALTER TABLE Licencia
  ADD CONSTRAINT FK_Empleado_TO_Licencia
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Familiar
  ADD CONSTRAINT FK_Parentesco_TO_Familiar
    FOREIGN KEY (PAR_cod)
    REFERENCES Parentesco (PAR_cod)
GO

ALTER TABLE Familiar
  ADD CONSTRAINT FK_Tipo_Identificacion_TO_Familiar
    FOREIGN KEY (TID_cod)
    REFERENCES Tipo_Identificacion (TID_cod)
GO

ALTER TABLE FAM_EMP
  ADD CONSTRAINT FK_Familiar_TO_FAM_EMP
    FOREIGN KEY (FAM_cod)
    REFERENCES Familiar (FAM_cod)
GO

ALTER TABLE FAM_EMP
  ADD CONSTRAINT FK_Empleado_TO_FAM_EMP
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Empleado
  ADD CONSTRAINT FK_Cargo_TO_Empleado
    FOREIGN KEY (CAR_cod)
    REFERENCES Cargo (CAR_cod)
GO

ALTER TABLE Cuenta_Bancaria
  ADD CONSTRAINT FK_Banco_TO_Cuenta_Bancaria
    FOREIGN KEY (BAN_cod)
    REFERENCES Banco (BAN_cod)
GO

ALTER TABLE Cuenta_Bancaria
  ADD CONSTRAINT FK_Empleado_TO_Cuenta_Bancaria
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Historial_Laboral
  ADD CONSTRAINT FK_Empleado_TO_Historial_Laboral
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO

ALTER TABLE Historial_Laboral
  ADD CONSTRAINT FK_Cargo_TO_Historial_Laboral
    FOREIGN KEY (CAR_cod)
    REFERENCES Cargo (CAR_cod)
GO

ALTER TABLE Beneficios
  ADD CONSTRAINT FK_Tipo_Beneficio_TO_Beneficios
    FOREIGN KEY (TBE_cod)
    REFERENCES Tipo_Beneficio (TBE_cod)
GO

ALTER TABLE Calculo_Salario
  ADD CONSTRAINT FK_Empleado_TO_Calculo_Salario
    FOREIGN KEY (EMP_cod)
    REFERENCES Empleado (EMP_cod)
GO
