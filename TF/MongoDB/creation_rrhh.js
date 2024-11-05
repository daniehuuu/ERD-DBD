const { MongoClient } = require('mongodb');

async function main() {
    // Connection URI and Database name
    const uri = 'mongodb://localhost:27017'; // Change this to your connection string if needed
    const client = new MongoClient(uri);

    try {
        // Connect to the MongoDB cluster
        await client.connect();

        // Specify the database and collection
        const db = client.db('RRHH'); // Replace 'myDatabase' with your DB name

        /*
        CREACIÓN DE COLECCIONES
        */

        await db.createCollection("Licencia", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Licencia",
                    required: ["_id", "EMP_id", "TLI_id", "LIC_fec_sol", "LIC_fec_ini", "LIC_fic_fin"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                        "TLI_id": { bsonType: "objectId" },
                        "LIC_fec_sol": { bsonType: "date" },
                        "LIC_fec_ini": { bsonType: "date" },
                        "LIC_fic_fin": { bsonType: "date" },
                        "LIC_est": { bsonType: "int" },
                    },
                },
            },
        });

        await db.createCollection("Empleado", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Empleado",
                    required: ["_id", "CTB_id", "SDV_id", "EMP_cta", "EMP_nom", "EMP_ape_p", "EMP_ape_m", "EMP_ident", "EMP_nac", "EMP_sex", "EMP_fec_nac", "EMP_dir", "EMP_tel", "EMP_fec_ing", "EMP_fec_ces", "CAR_id", "AFP_id", "EMP_sld_bsc"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "CTB_id": { bsonType: "string" },
                        "SDV_id": { bsonType: "string" },
                        "EMP_cta": {
                            bsonType: "array",
                            items: {
                                bsonType: "object",
                                required: ["EMP_banc", "EMP_num", "EMP_es_CTS"],
                                properties: {
                                    "EMP_banc": { bsonType: "string" },
                                    "EMP_num": { bsonType: "string" },
                                    "EMP_es_CTS": { bsonType: "bool" },
                                },
                            },
                        },
                        "EMP_nom": { bsonType: "string" },
                        "EMP_ape_p": { bsonType: "string" },
                        "EMP_ape_m": { bsonType: "string" },
                        "EMP_ident": {
                            bsonType: "object",
                            title: "EMP_ident",
                            required: ["EMP_tipo", "EMP_num"],
                            properties: {
                                "EMP_tipo": { bsonType: "string" },
                                "EMP_num": { bsonType: "string" },
                            },
                        },
                        "EMP_nac": { bsonType: "date" },
                        "EMP_sex": { bsonType: "string" },
                        "EMP_fec_nac": { bsonType: "date" },
                        "EMP_dir": { bsonType: "string" },
                        "EMP_tel": { bsonType: "string" },
                        "EMP_fec_ing": { bsonType: "date" },
                        "EMP_fec_ces": { bsonType: "date" },
                        "CAR_id": { bsonType: "string" },
                        "AFP_id": { bsonType: "string" },
                        "EMP_sld_bsc": { bsonType: "decimal" },
                    },
                },
            },
        });

        await db.createCollection("Condicion_Trabajo", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Condicion_Trabajo",
                    required: ["_id", "CTB_desc"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "CTB_desc": { bsonType: "string" },
                    },
                },
            },
        });

        await db.createCollection("Cargo", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Cargo",
                    required: ["_id", "CAR_desc"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "CAR_desc": { bsonType: "string" },
                    },
                },
            },
        });

        await db.createCollection("Calculo_Salario", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Calculo_Salario",
                    required: ["_id", "EMP_id", "CSA_tipo", "CSA_mon", "CSA_desc", "CSA_fec_ini", "CSA_fec_fin"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                        "CSA_tipo": { bsonType: "int" },
                        "CSA_mon": { bsonType: "decimal" },
                        "CSA_desc": { bsonType: "string" },
                        "CSA_fec_ini": { bsonType: "date" },
                        "CSA_fec_fin": { bsonType: "date" },
                    },
                },
            },
        });

        await db.createCollection("Asistencia", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Asistencia",
                    required: ["_id", "EMP_id", "AST_fec_ent", "AST_hora_ent", "AST_fec_sal", "AST_hora_sal"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                        "AST_fec_ent": { bsonType: "date" },
                        "AST_hora_ent": { bsonType: "timestamp" },
                        "AST_fec_sal": { bsonType: "date" },
                        "AST_hora_sal": { bsonType: "timestamp" },
                    },
                },
            },
        });

        await db.createCollection("AFP", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "AFP",
                    required: ["_id", "AFP_desc", "AFP_apor_obl", "AFP_seg", "AFP_com"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "AFP_desc": { bsonType: "string" },
                        "AFP_apor_obl": { bsonType: "decimal" },
                        "AFP_seg": { bsonType: "decimal" },
                        "AFP_com": { bsonType: "decimal" },
                    },
                },
            },
        });

        await db.createCollection("Contrato", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Contrato",
                    required: ["_id", "EMP_id", "CTR_tip_con", "CTR_fec_ini", "CTR_fec_fin", "CTR_sld_bsc"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                        "CTR_tip_con": { bsonType: "string" },
                        "CTR_fec_ini": { bsonType: "date" },
                        "CTR_fec_fin": { bsonType: "date" },
                        "CTR_sld_bsc": { bsonType: "decimal" },
                        "CTR_per_prueb": { bsonType: "int" },
                        "CTR_mot_ter": { bsonType: "string" },
                    },
                },
            },
        });

        await db.createCollection("Vacaciones", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Vacaciones",
                    required: ["_id", "EMP_id", "VAC_fec_sol", "VAC_fec_ini", "VAC_fec_fin"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                        "VAC_fec_sol": { bsonType: "date" },
                        "VAC_fec_ini": { bsonType: "date" },
                        "VAC_fec_fin": { bsonType: "date" },
                        "VAC_est": { bsonType: "int" },
                    },
                },
            },
        });

        await db.createCollection("Tipo_Licencia", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Tipo_Licencia",
                    required: ["_id", "TLI_desc", "TLI_rem"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "TLI_desc": { bsonType: "string" },
                        "TLI_rem": { bsonType: "int" },
                    },
                },
            },
        });

        await db.createCollection("Sub_division", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Sub_division",
                    required: ["_id", "SDV_nom", "DIV_id"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "SDV_nom": { bsonType: "string" },
                        "DIV_id": { bsonType: "objectId" },
                    },
                },
            },
        });

        await db.createCollection("Division", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Division",
                    required: ["_id", "DIV_nom", "DIV_ubi_fis"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "DIV_nom": { bsonType: "string" },
                        "DIV_ubi_fis": { bsonType: "string" },
                    },
                },
            },
        });

        await db.createCollection("Beneficios", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Beneficios",
                    required: ["_id", "EMP_id", "TBE_id", "BEN_fec", "BEN_mon"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                        "TBE_id": { bsonType: "objectId" },
                        "BEN_fec": { bsonType: "date" },
                        "BEN_mon": { bsonType: "decimal" },
                    },
                },
            },
        });

        await db.createCollection("Tipo_Beneficio", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Tipo_Beneficio",
                    required: ["_id", "TBE_desc"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "TBE_desc": { bsonType: "string" },
                    },
                },
            },
        });

        await db.createCollection("Parentesco", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Parentesco",
                    required: ["_id", "PAR_desc"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "PAR_desc": { bsonType: "string" },
                    },
                },
            },
        });

        await db.createCollection("FAM_EMP", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "FAM_EMP",
                    required: ["_id", "FAM_id", "EMP_id"],
                    properties: {
                        "_id": { bsonType: "string" },
                        "FAM_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                    },
                },
            },
        });

        await db.createCollection("Familiar", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Familiar",
                    required: ["_id", "PAR_id", "FAM_ident", "FAM_nom", "FAM_ape_p", "FAM_ape_m", "FAM_fec_nac", "FAM_sex"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "PAR_id": { bsonType: "objectId" },
                        "FAM_ident": {
                            bsonType: "object",
                            title: "FAM_ident",
                            required: ["FAM_tipo", "FAM_num"],
                            properties: {
                                "FAM_tipo": { bsonType: "string" },
                                "FAM_num": { bsonType: "string" },
                            },
                        },
                        "FAM_nom": { bsonType: "string" },
                        "FAM_ape_p": { bsonType: "string" },
                        "FAM_ape_m": { bsonType: "string" },
                        "FAM_fec_nac": { bsonType: "date" },
                        "FAM_fec_fall": { bsonType: "date" },
                        "FAM_sex": { bsonType: "string" },
                    },
                },
            },
        });

        await db.createCollection("Historial_Laboral", {
            validator: {
                $jsonSchema: {
                    bsonType: "object",
                    title: "Historial_Laboral",
                    required: ["_id", "EMP_id", "CAR_id", "HIS_fec_in", "HIS_fec_fin", "HIS_sld_bsc"],
                    properties: {
                        "_id": { bsonType: "objectId" },
                        "EMP_id": { bsonType: "objectId" },
                        "CAR_id": { bsonType: "objectId" },
                        "HIS_fec_in": { bsonType: "date" },
                        "HIS_fec_fin": { bsonType: "date" },
                        "HIS_sld_bsc": { bsonType: "decimal" },
                    },
                },
            },
        });
        
        /*
        CREACIÓN DE DOCUMENTOS
        */

        await db.collection('Division').coll.insertMany([
            { _id: 1, DIV_nom: 'Recursos humanos', DIV_ubi_fis: 'Edificio A' },
            { _id: 2, DIV_nom: 'Finanzas', DIV_ubi_fis: 'Edificio B' },
            { _id: 3, DIV_nom: 'Tecnología', DIV_ubi_fis: 'Edificio C' },
            { _id: 4, DIV_nom: 'Marketing', DIV_ubi_fis: 'Edificio D' },
            { _id: 5, DIV_nom: 'Ventas', DIV_ubi_fis: 'Edificio E' },
            { _id: 6, DIV_nom: 'Investigación y Desarrollo', DIV_ubi_fis: 'Edificio F' },
            { _id: 7, DIV_nom: 'Operaciones', DIV_ubi_fis: 'Edificio G' },
            { _id: 8, DIV_nom: 'Legal', DIV_ubi_fis: 'Edificio H' },
            { _id: 9, DIV_nom: 'Atención al cliente', DIV_ubi_fis: 'Edificio I' },
            { _id: 10, DIV_nom: 'Compras', DIV_ubi_fis: 'Edificio J' }
        ]);

        await db.collection('Sub_division').insertMany([
            { _id: 1, SDV_nom: 'Selección de personal', DIV_id: 1 },
            { _id: 2, SDV_nom: 'Capacitación y Desarrollo', DIV_id: 1 },
            { _id: 3, SDV_nom: 'Contabilidad', DIV_id: 2 },
            { _id: 4, SDV_nom: 'Tesorería', DIV_id: 2 },
            { _id: 5, SDV_nom: 'Desarrollo de software', DIV_id: 3 },
            { _id: 6, SDV_nom: 'Soporte Técnico', DIV_id: 3 },
            { _id: 7, SDV_nom: 'Publicidad', DIV_id: 4 },
            { _id: 8, SDV_nom: 'Investigación de mercados', DIV_id: 4 },
            { _id: 9, SDV_nom: 'Ventas internacionales', DIV_id: 5 },
            { _id: 10, SDV_nom: 'Ventas nacionales', DIV_id: 5 }
        ]);

        await db.collection('Cargo').insertMany([
            { _id: 1, CAR_desc: 'Gerente general' },
            { _id: 2, CAR_desc: 'Analista financiero' },
            { _id: 3, CAR_desc: 'Desarrollador' },
            { _id: 4, CAR_desc: 'Asistente admin.' },
            { _id: 5, CAR_desc: 'Gerente marketing' },
            { _id: 6, CAR_desc: 'Coord. RRHH' },
            { _id: 7, CAR_desc: 'Técnico Soporte' },
            { _id: 8, CAR_desc: 'Rep. Ventas' },
            { _id: 9, CAR_desc: 'Inv. Mercado' },
            { _id: 10, CAR_desc: 'Abogado Corporativo' }
        ]);

        await db.collection('Tipo_Beneficio').insertMany([
            { _id: 1, TBE_desc: 'Seguro de vida' },
            { _id: 2, TBE_desc: 'Bono por desempeño' },
            { _id: 3, TBE_desc: 'Bono por trabajo en zonas remotas' },
            { _id: 4, TBE_desc: 'Plan de pension' },
            { _id: 5, TBE_desc: 'Bono por riesgo' },
            { _id: 6, TBE_desc: 'Bono por objetivo de sostenibilidad' },
            { _id: 7, TBE_desc: 'Bonos de productividad global' },
            { _id: 8, TBE_desc: 'Bonos por impacto social' },
            { _id: 9, TBE_desc: 'Bonos por antigüedad' },
            { _id: 10, TBE_desc: 'Bonos por eficiencia operativa' }
        ]);

        await db.collection('Tipo_Licencia').insertMany([
            { _id: 1, TLI_desc: 'Licencia por asistencia medica', TLI_rem: 1 },
            { _id: 2, TLI_desc: 'Licencia por maternidad', TLI_rem: 1 },
            { _id: 3, TLI_desc: 'Licencia por enfermedad grave o terminal', TLI_rem: 1 },
            { _id: 4, TLI_desc: 'Licencia por fallecimiento de familiares', TLI_rem: 0 },
            { _id: 5, TLI_desc: 'Licencia por paternidad', TLI_rem: 1 },
            { _id: 6, TLI_desc: 'Licencia por asistencia médica a un familiar', TLI_rem: 0 },
            { _id: 7, TLI_desc: 'Licencia sindical', TLI_rem: 1 },
            { _id: 8, TLI_desc: 'Licencia por ser bombero voluntario', TLI_rem: 0 },
            { _id: 9, TLI_desc: 'Licencia por adopción', TLI_rem: 1 },
            { _id: 10, TLI_desc: 'Licencia por lactancia', TLI_rem: 0 }
        ]);

        await db.collection('AFP').insertMany([
            { _id: 1, AFP_desc: 'AFP Horizonte', AFP_apor_obl: 10.5, AFP_seg: 1.2, AFP_com: 0.3 },
            { _id: 2, AFP_desc: 'AFP Integra', AFP_apor_obl: 11.0, AFP_seg: 1.1, AFP_com: 0.35 },
            { _id: 3, AFP_desc: 'AFP Prima', AFP_apor_obl: 10.8, AFP_seg: 1.3, AFP_com: 0.32 },
            { _id: 4, AFP_desc: 'AFP Profuturo', AFP_apor_obl: 10.9, AFP_seg: 1.2, AFP_com: 0.33 },
            { _id: 5, AFP_desc: 'AFP Habitat', AFP_apor_obl: 11.2, AFP_seg: 1.4, AFP_com: 0.31 },
            { _id: 6, AFP_desc: 'AFP Capital', AFP_apor_obl: 10.7, AFP_seg: 1.5, AFP_com: 0.28 },
            { _id: 7, AFP_desc: 'AFP Crecer', AFP_apor_obl: 11.1, AFP_seg: 1.1, AFP_com: 0.34 },
            { _id: 8, AFP_desc: 'AFP Futuro', AFP_apor_obl: 10.6, AFP_seg: 1.3, AFP_com: 0.29 },
            { _id: 9, AFP_desc: 'AFP Vida', AFP_apor_obl: 11.3, AFP_seg: 1.2, AFP_com: 0.32 },
            { _id: 10, AFP_desc: 'AFP Seguro', AFP_apor_obl: 10.5, AFP_seg: 1.4, AFP_com: 0.3 }
        ]);

        await db.collection('Condicion_Trabajo').insertMany([
            { _id: 1, CTB_desc: 'Tiempo Completo' },
            { _id: 2, CTB_desc: 'Medio Tiempo' },
            { _id: 3, CTB_desc: 'Contrato' },
            { _id: 4, CTB_desc: 'Freelance' },
            { _id: 5, CTB_desc: 'Prácticas' },
            { _id: 6, CTB_desc: 'Remoto' },
            { _id: 7, CTB_desc: 'Presencial' }
        ]);

        await db.collection('Parentesco').insertMany([
            { _id: 1, PAR_desc: 'Padre' },
            { _id: 2, PAR_desc: 'Madre' },
            { _id: 3, PAR_desc: 'Hermano' },
            { _id: 4, PAR_desc: 'Hermana' },
            { _id: 5, PAR_desc: 'Hijo' },
            { _id: 6, PAR_desc: 'Hija' },
            { _id: 7, PAR_desc: 'Tío' },
            { _id: 8, PAR_desc: 'Tía' },
            { _id: 9, PAR_desc: 'Primo' },
            { _id: 10, PAR_desc: 'Prima' }
        ]);

        //faltan las cuentas bancarias 
        await db.collection('Empleado').insertMany([
            { _id: 1, CTB_id: 1, SDV_id: 6, EMP_nom: 'Juan', EMP_ape_p: 'Perez', EMP_ape_m: 'Lopez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345678' }, EMP_nac: new Date('1985-01-01'), EMP_sex: 'M', EMP_fec_nac: new Date('1985-01-01'), EMP_dir: 'Av. Siempre Viva 123', EMP_tel: '987654321', EMP_fec_ing: new Date('2010-01-01'), EMP_fec_ces: null, CAR_id: 7, AFP_id: 1, EMP_sld_bsc: 3000.00 },
            { _id: 2, CTB_id: 2, SDV_id: 6, EMP_nom: 'Maria', EMP_ape_p: 'Gomez', EMP_ape_m: 'Martinez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345679' }, EMP_nac: new Date('1986-02-02'), EMP_sex: 'F', EMP_fec_nac: new Date('1986-02-02'), EMP_dir: 'Av. Siempre Viva 124', EMP_tel: '987654322', EMP_fec_ing: new Date('2011-02-01'), EMP_fec_ces: null, CAR_id: 7, AFP_id: 2, EMP_sld_bsc: 3200.00 },
            { _id: 3, CTB_id: 1, SDV_id: 6, EMP_nom: 'Carlos', EMP_ape_p: 'Lopez', EMP_ape_m: 'Garcia', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345670' }, EMP_nac: new Date('1987-03-03'), EMP_sex: 'M', EMP_fec_nac: new Date('1987-03-03'), EMP_dir: 'Av. Siempre Viva 125', EMP_tel: '987654323', EMP_fec_ing: new Date('2012-03-01'), EMP_fec_ces: null, CAR_id: 7, AFP_id: 1, EMP_sld_bsc: 3400.00 },
            { _id: 4, CTB_id: 2, SDV_id: 6, EMP_nom: 'Ana', EMP_ape_p: 'Martinez', EMP_ape_m: 'Rodriguez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345671' }, EMP_nac: new Date('1988-04-04'), EMP_sex: 'F', EMP_fec_nac: new Date('1988-04-04'), EMP_dir: 'Av. Siempre Viva 126', EMP_tel: '987654324', EMP_fec_ing: new Date('2013-04-01'), EMP_fec_ces: null, CAR_id: 7, AFP_id: 2, EMP_sld_bsc: 3600.00 },
            { _id: 5, CTB_id: 1, SDV_id: 6, EMP_nom: 'Luis', EMP_ape_p: 'Garcia', EMP_ape_m: 'Hernandez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345672' }, EMP_nac: new Date('1989-05-05'), EMP_sex: 'M', EMP_fec_nac: new Date('1989-05-05'), EMP_dir: 'Av. Siempre Viva 127', EMP_tel: '987654325', EMP_fec_ing: new Date('2014-05-01'), EMP_fec_ces: null, CAR_id: 7, AFP_id: 1, EMP_sld_bsc: 3800.00 },
            { _id: 6, CTB_id: 2, SDV_id: 6, EMP_nom: 'Elena', EMP_ape_p: 'Rodriguez', EMP_ape_m: 'Lopez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345673' }, EMP_nac: new Date('1990-06-06'), EMP_sex: 'F', EMP_fec_nac: new Date('1990-06-06'), EMP_dir: 'Av. Siempre Viva 128', EMP_tel: '987654326', EMP_fec_ing: new Date('2015-06-01'), EMP_fec_ces: new Date('2020-05-01'), CAR_id: 7, AFP_id: 2, EMP_sld_bsc: 4000.00 },
            { _id: 7, CTB_id: 1, SDV_id: 6, EMP_nom: 'Miguel', EMP_ape_p: 'Hernandez', EMP_ape_m: 'Martinez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345674' }, EMP_nac: new Date('1991-07-07'), EMP_sex: 'M', EMP_fec_nac: new Date('1991-07-07'), EMP_dir: 'Av. Siempre Viva 129', EMP_tel: '987654327', EMP_fec_ing: new Date('2016-07-01'), EMP_fec_ces: new Date('2020-08-01'), CAR_id: 7, AFP_id: 1, EMP_sld_bsc: 4200.00 },
            { _id: 8, CTB_id: 2, SDV_id: 6, EMP_nom: 'Laura', EMP_ape_p: 'Fernandez', EMP_ape_m: 'Garcia', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345675' }, EMP_nac: new Date('1992-08-08'), EMP_sex: 'F', EMP_fec_nac: new Date('1992-08-08'), EMP_dir: 'Av. Siempre Viva 130', EMP_tel: '987654328', EMP_fec_ing: new Date('2017-08-01'), EMP_fec_ces: null, CAR_id: 4, AFP_id: 2, EMP_sld_bsc: 4400.00 },
            { _id: 9, CTB_id: 1, SDV_id: 5, EMP_nom: 'Jose', EMP_ape_p: 'Sanchez', EMP_ape_m: 'Rodriguez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345676' }, EMP_nac: new Date('1993-09-09'), EMP_sex: 'M', EMP_fec_nac: new Date('1993-09-09'), EMP_dir: 'Av. Siempre Viva 131', EMP_tel: '987654329', EMP_fec_ing: new Date('2018-09-01'), EMP_fec_ces: null, CAR_id: 10, AFP_id: 1, EMP_sld_bsc: 4600.00 },
            { _id: 10, CTB_id: 2, SDV_id: 3, EMP_nom: 'Lucia', EMP_ape_p: 'Ramirez', EMP_ape_m: 'Hernandez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345677' }, EMP_nac: new Date('1994-10-10'), EMP_sex: 'F', EMP_fec_nac: new Date('1994-10-10'), EMP_dir: 'Av. Siempre Viva 132', EMP_tel: '987654330', EMP_fec_ing: new Date('2019-10-01'), EMP_fec_ces: null, CAR_id: 1, AFP_id: 2, EMP_sld_bsc: 4800.00 },
            { _id: 11, CTB_id: 1, SDV_id: 7, EMP_nom: 'Pedro', EMP_ape_p: 'Torres', EMP_ape_m: 'Lopez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345611' }, EMP_nac: new Date('1995-11-11'), EMP_sex: 'M', EMP_fec_nac: new Date('1995-11-11'), EMP_dir: 'Av. Siempre Viva 133', EMP_tel: '987654331', EMP_fec_ing: new Date('2020-11-01'), EMP_fec_ces: null, CAR_id: 5, AFP_id: 1, EMP_sld_bsc: 5000.00 },
            { _id: 12, CTB_id: 1, SDV_id: 7, EMP_nom: 'Sofia', EMP_ape_p: 'Flores', EMP_ape_m: 'Martinez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345622' }, EMP_nac: new Date('1996-12-12'), EMP_sex: 'F', EMP_fec_nac: new Date('1996-12-12'), EMP_dir: 'Av. Siempre Viva 134', EMP_tel: '987654332', EMP_fec_ing: new Date('2021-12-01'), EMP_fec_ces: null, CAR_id: 6, AFP_id: 2, EMP_sld_bsc: 5200.00 },
            { _id: 13, CTB_id: 1, SDV_id: 10, EMP_nom: 'Diego', EMP_ape_p: 'Rivera', EMP_ape_m: 'Garcia', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345633' }, EMP_nac: new Date('1997-01-13'), EMP_sex: 'M', EMP_fec_nac: new Date('1997-01-13'), EMP_dir: 'Av. Siempre Viva 135', EMP_tel: '987654333', EMP_fec_ing: new Date('2022-01-01'), EMP_fec_ces: null, CAR_id: 3, AFP_id: 1, EMP_sld_bsc: 5400.00 },
            { _id: 14, CTB_id: 1, SDV_id: 9, EMP_nom: 'Marta', EMP_ape_p: 'Jimenez', EMP_ape_m: 'Rodriguez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345644' }, EMP_nac: new Date('1998-02-14'), EMP_sex: 'F', EMP_fec_nac: new Date('1998-02-14'), EMP_dir: 'Av. Siempre Viva 136', EMP_tel: '987654334', EMP_fec_ing: new Date('2023-02-01'), EMP_fec_ces: null, CAR_id: 3, AFP_id: 2, EMP_sld_bsc: 5600.00 },
            { _id: 15, CTB_id: 1, SDV_id: 8, EMP_nom: 'Jorge Raúl', EMP_ape_p: 'Ruiz', EMP_ape_m: 'Hernandez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345655' }, EMP_nac: new Date('1999-03-15'), EMP_sex: 'M', EMP_fec_nac: new Date('1999-03-15'), EMP_dir: 'Av. Siempre Viva 137', EMP_tel: '987654335', EMP_fec_ing: new Date('2024-03-01'), EMP_fec_ces: null, CAR_id: 3, AFP_id: 1, EMP_sld_bsc: 5800.00 },
            { _id: 16, CTB_id: 2, SDV_id: 3, EMP_nom: 'Carmen', EMP_ape_p: 'Ortiz', EMP_ape_m: 'Lopez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345666' }, EMP_nac: new Date('2000-04-16'), EMP_sex: 'F', EMP_fec_nac: new Date('2000-04-16'), EMP_dir: 'Av. Siempre Viva 138', EMP_tel: '987654336', EMP_fec_ing: new Date('2025-04-01'), EMP_fec_ces: null, CAR_id: 2, AFP_id: 2, EMP_sld_bsc: 6000.00 },
            { _id: 17, CTB_id: 1, SDV_id: 7, EMP_nom: 'Raul', EMP_ape_p: 'Morales', EMP_ape_m: 'Martinez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345677' }, EMP_nac: new Date('2001-05-17'), EMP_sex: 'M', EMP_fec_nac: new Date('2001-05-17'), EMP_dir: 'Av. Siempre Viva 139', EMP_tel: '987654337', EMP_fec_ing: new Date('2026-05-01'), EMP_fec_ces: null, CAR_id: 5, AFP_id: 1, EMP_sld_bsc: 6200.00 },
            { _id: 18, CTB_id: 2, SDV_id: 8, EMP_nom: 'Isabel', EMP_ape_p: 'Gutierrez', EMP_ape_m: 'Garcia', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345688' }, EMP_nac: new Date('2002-06-18'), EMP_sex: 'F', EMP_fec_nac: new Date('2002-06-18'), EMP_dir: 'Av. Siempre Viva 140', EMP_tel: '987654338', EMP_fec_ing: new Date('2027-06-01'), EMP_fec_ces: null, CAR_id: 1, AFP_id: 2, EMP_sld_bsc: 6400.00 },
            { _id: 19, CTB_id: 1, SDV_id: 9, EMP_nom: 'Alberto', EMP_ape_p: 'Navarro', EMP_ape_m: 'Rodriguez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345699' }, EMP_nac: new Date('2003-07-19'), EMP_sex: 'M', EMP_fec_nac: new Date('2003-07-19'), EMP_dir: 'Av. Siempre Viva 141', EMP_tel: '987654339', EMP_fec_ing: new Date('2028-07-01'), EMP_fec_ces: null, CAR_id: 8, AFP_id: 1, EMP_sld_bsc: 6600.00 },
            { _id: 20, CTB_id: 2, SDV_id: 10, EMP_nom: 'Patricia', EMP_ape_p: 'Dominguez', EMP_ape_m: 'Hernandez', EMP_ident: { EMP_tipo: 'DNI', EMP_num: '12345111' }, EMP_nac: new Date('2004-08-20'), EMP_sex: 'F', EMP_fec_nac: new Date('2004-08-20'), EMP_dir: 'Av. Siempre Viva 142', EMP_tel: '987654340', EMP_fec_ing: new Date('2029-08-01'), EMP_fec_ces: null, CAR_id: 8, AFP_id: 2, EMP_sld_bsc: 6800.00 }
        ]);

        await db.collection('Beneficios').insertMany([
            { _id: 1, EMP_id: 1, TBE_id: 1, BEN_fec: new Date('2023-01-15'), BEN_mon: 500.00 },
            { _id: 2, EMP_id: 2, TBE_id: 2, BEN_fec: new Date('2023-02-20'), BEN_mon: 1000.00 },
            { _id: 3, EMP_id: 3, TBE_id: 3, BEN_fec: new Date('2023-03-10'), BEN_mon: 200.00 },
            { _id: 4, EMP_id: 4, TBE_id: 4, BEN_fec: new Date('2023-04-25'), BEN_mon: 300.00 },
            { _id: 5, EMP_id: 5, TBE_id: 5, BEN_fec: new Date('2023-05-12'), BEN_mon: 150.00 },
            { _id: 6, EMP_id: 6, TBE_id: 6, BEN_fec: new Date('2023-06-01'), BEN_mon: 250.00 },
            { _id: 7, EMP_id: 7, TBE_id: 7, BEN_fec: new Date('2023-07-05'), BEN_mon: 1200.00 },
            { _id: 8, EMP_id: 8, TBE_id: 8, BEN_fec: new Date('2023-08-14'), BEN_mon: 800.00 },
            { _id: 9, EMP_id: 9, TBE_id: 9, BEN_fec: new Date('2023-09-23'), BEN_mon: 400.00 },
            { _id: 10, EMP_id: 10, TBE_id: 10, BEN_fec: new Date('2023-10-30'), BEN_mon: 700.00 }
        ]);

        await db.collection('Familiar').insertMany([
            { _id: 1, PAR_id: 1, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '81234567' }, FAM_nom: 'Carlos', FAM_ape_p: 'Perez', FAM_ape_m: 'Ramirez', FAM_fec_nac: new Date('1960-01-01'), FAM_fec_fall: null, FAM_sex: 'M' },
            { _id: 2, PAR_id: 2, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '98765432' }, FAM_nom: 'Maria', FAM_ape_p: 'Ramirez', FAM_ape_m: 'Lopez', FAM_fec_nac: new Date('1962-02-12'), FAM_fec_fall: null, FAM_sex: 'F' },
            { _id: 3, PAR_id: 3, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '11122233' }, FAM_nom: 'Jorge', FAM_ape_p: 'Perez', FAM_ape_m: 'Ramirez', FAM_fec_nac: new Date('1990-05-15'), FAM_fec_fall: null, FAM_sex: 'M' },
            { _id: 4, PAR_id: 4, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '44455566' }, FAM_nom: 'Laura', FAM_ape_p: 'Perez', FAM_ape_m: 'Ramirez', FAM_fec_nac: new Date('1992-08-30'), FAM_fec_fall: null, FAM_sex: 'F' },
            { _id: 5, PAR_id: 5, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '77788899' }, FAM_nom: 'David', FAM_ape_p: 'Perez', FAM_ape_m: 'Ramirez', FAM_fec_nac: new Date('2010-12-22'), FAM_fec_fall: null, FAM_sex: 'M' },
            { _id: 6, PAR_id: 6, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '11223344' }, FAM_nom: 'Lucia', FAM_ape_p: 'Perez', FAM_ape_m: 'Ramirez', FAM_fec_nac: new Date('2012-03-14'), FAM_fec_fall: null, FAM_sex: 'F' },
            { _id: 7, PAR_id: 7, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '22334455' }, FAM_nom: 'Juan', FAM_ape_p: 'Ramirez', FAM_ape_m: 'Lopez', FAM_fec_nac: new Date('1975-07-09'), FAM_fec_fall: null, FAM_sex: 'M' },
            { _id: 8, PAR_id: 8, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '33445566' }, FAM_nom: 'Ana', FAM_ape_p: 'Ramirez', FAM_ape_m: 'Lopez', FAM_fec_nac: new Date('1978-11-18'), FAM_fec_fall: null, FAM_sex: 'F' },
            { _id: 9, PAR_id: 9, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '44556677' }, FAM_nom: 'Luis', FAM_ape_p: 'Lopez', FAM_ape_m: 'Ramirez', FAM_fec_nac: new Date('1985-06-05'), FAM_fec_fall: null, FAM_sex: 'M' },
            { _id: 10, PAR_id: 10, FAM_ident: { FAM_tipo: 'DNI', FAM_num: '55667788' }, FAM_nom: 'Sofia', FAM_ape_p: 'Lopez', FAM_ape_m: 'Ramirez', FAM_fec_nac: new Date('1987-09-25'), FAM_fec_fall: null, FAM_sex: 'F' }
        ]);

        await db.collection('FAM_EMP').insertMany([
            { _id: 1, FAM_id: 1, EMP_id: 1 },
            { _id: 2, FAM_id: 2, EMP_id: 2 },
            { _id: 3, FAM_id: 3, EMP_id: 3 },
            { _id: 4, FAM_id: 4, EMP_id: 4 },
            { _id: 5, FAM_id: 5, EMP_id: 5 },
            { _id: 6, FAM_id: 6, EMP_id: 6 },
            { _id: 7, FAM_id: 7, EMP_id: 7 },
            { _id: 8, FAM_id: 8, EMP_id: 8 },
            { _id: 9, FAM_id: 9, EMP_id: 9 },
            { _id: 10, FAM_id: 10, EMP_id: 10 }
        ]);

        await db.collection('Licencia').insertMany([
            { _id: 1, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2024-08-01'), LIC_fec_ini: new Date('2024-08-05'), LIC_fic_fin: new Date('2024-08-15'), LIC_est: 1 },
            { _id: 2, EMP_id: 2, TLI_id: 2, LIC_fec_sol: new Date('2024-09-01'), LIC_fec_ini: new Date('2024-09-10'), LIC_fic_fin: new Date('2024-09-20'), LIC_est: 0 },
            { _id: 3, EMP_id: 3, TLI_id: 3, LIC_fec_sol: new Date('2024-10-01'), LIC_fec_ini: new Date('2024-10-05'), LIC_fic_fin: new Date('2024-10-15'), LIC_est: 1 },
            { _id: 4, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2024-11-01'), LIC_fec_ini: new Date('2024-11-10'), LIC_fic_fin: new Date('2024-11-20'), LIC_est: 1 },
            { _id: 5, EMP_id: 2, TLI_id: 2, LIC_fec_sol: new Date('2024-12-01'), LIC_fec_ini: new Date('2024-12-10'), LIC_fic_fin: new Date('2024-12-20'), LIC_est: 1 },
            { _id: 6, EMP_id: 3, TLI_id: 3, LIC_fec_sol: new Date('2025-01-01'), LIC_fec_ini: new Date('2025-01-10'), LIC_fic_fin: new Date('2025-01-20'), LIC_est: 1 },
            { _id: 7, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2025-02-01'), LIC_fec_ini: new Date('2025-02-10'), LIC_fic_fin: new Date('2025-02-20'), LIC_est: 1 },
            { _id: 8, EMP_id: 2, TLI_id: 2, LIC_fec_sol: new Date('2025-03-01'), LIC_fec_ini: new Date('2025-03-10'), LIC_fic_fin: new Date('2025-03-20'), LIC_est: 1 },
            { _id: 9, EMP_id: 3, TLI_id: 3, LIC_fec_sol: new Date('2025-04-01'), LIC_fec_ini: new Date('2025-04-10'), LIC_fic_fin: new Date('2025-04-20'), LIC_est: 0 },
            { _id: 10, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2025-05-01'), LIC_fec_ini: new Date('2025-05-10'), LIC_fic_fin: new Date('2025-05-20'), LIC_est: 1 },
            { _id: 11, EMP_id: 2, TLI_id: 2, LIC_fec_sol: new Date('2025-06-01'), LIC_fec_ini: new Date('2025-06-10'), LIC_fic_fin: new Date('2025-06-20'), LIC_est: 1 },
            { _id: 12, EMP_id: 3, TLI_id: 3, LIC_fec_sol: new Date('2025-07-01'), LIC_fec_ini: new Date('2025-07-10'), LIC_fic_fin: new Date('2025-07-20'), LIC_est: 1 },
            { _id: 13, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2025-08-01'), LIC_fec_ini: new Date('2025-08-10'), LIC_fic_fin: new Date('2025-08-20'), LIC_est: 1 },
            { _id: 14, EMP_id: 2, TLI_id: 2, LIC_fec_sol: new Date('2025-09-01'), LIC_fec_ini: new Date('2025-09-10'), LIC_fic_fin: new Date('2025-09-20'), LIC_est: 0 },
            { _id: 15, EMP_id: 3, TLI_id: 3, LIC_fec_sol: new Date('2025-10-01'), LIC_fec_ini: new Date('2025-10-10'), LIC_fic_fin: new Date('2025-10-20'), LIC_est: 1 },
            { _id: 16, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2025-11-01'), LIC_fec_ini: new Date('2025-11-10'), LIC_fic_fin: new Date('2025-11-20'), LIC_est: 1 },
            { _id: 17, EMP_id: 2, TLI_id: 2, LIC_fec_sol: new Date('2025-12-01'), LIC_fec_ini: new Date('2025-12-10'), LIC_fic_fin: new Date('2025-12-20'), LIC_est: 1 },
            { _id: 18, EMP_id: 3, TLI_id: 3, LIC_fec_sol: new Date('2026-01-01'), LIC_fec_ini: new Date('2026-01-10'), LIC_fic_fin: new Date('2026-01-20'), LIC_est: 0 },
            { _id: 19, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2026-02-01'), LIC_fec_ini: new Date('2026-02-10'), LIC_fic_fin: new Date('2026-02-20'), LIC_est: 1 },
            { _id: 20, EMP_id: 2, TLI_id: 2, LIC_fec_sol: new Date('2026-03-01'), LIC_fec_ini: new Date('2026-03-10'), LIC_fic_fin: new Date('2026-03-20'), LIC_est: 1 },
            { _id: 21, EMP_id: 3, TLI_id: 3, LIC_fec_sol: new Date('2026-04-01'), LIC_fec_ini: new Date('2026-04-10'), LIC_fic_fin: new Date('2026-04-20'), LIC_est: 1 },
            { _id: 22, EMP_id: 1, TLI_id: 1, LIC_fec_sol: new Date('2026-05-01'), LIC_fec_ini: new Date('2026-05-10'), LIC_fic_fin: new Date('2026-05-20'), LIC_est: 1 }
        ]);

        await db.collection('Asistencia').insertMany([
            { _id: 1, EMP_id: 1, AST_fec_ent: new Date('2024-10-04'), AST_hora_ent: new Date('2024-10-04T08:00:00Z'), AST_fec_sal: new Date('2024-10-04'), AST_hora_sal: new Date('2024-10-04T17:00:00Z') },
            { _id: 2, EMP_id: 2, AST_fec_ent: new Date('2024-10-05'), AST_hora_ent: new Date('2024-10-05T09:00:00Z'), AST_fec_sal: new Date('2024-10-05'), AST_hora_sal: new Date('2024-10-05T18:00:00Z') },
            { _id: 3, EMP_id: 3, AST_fec_ent: new Date('2024-10-06'), AST_hora_ent: new Date('2024-10-06T08:30:00Z'), AST_fec_sal: new Date('2024-10-06'), AST_hora_sal: new Date('2024-10-06T17:30:00Z') },
            { _id: 4, EMP_id: 1, AST_fec_ent: new Date('2024-10-07'), AST_hora_ent: new Date('2024-10-07T08:00:00Z'), AST_fec_sal: new Date('2024-10-07'), AST_hora_sal: new Date('2024-10-07T17:00:00Z') },
            { _id: 5, EMP_id: 2, AST_fec_ent: new Date('2024-10-08'), AST_hora_ent: new Date('2024-10-08T09:00:00Z'), AST_fec_sal: new Date('2024-10-08'), AST_hora_sal: new Date('2024-10-08T18:00:00Z') },
            { _id: 6, EMP_id: 3, AST_fec_ent: new Date('2024-10-09'), AST_hora_ent: new Date('2024-10-09T08:30:00Z'), AST_fec_sal: new Date('2024-10-09'), AST_hora_sal: new Date('2024-10-09T17:30:00Z') },
            { _id: 7, EMP_id: 1, AST_fec_ent: new Date('2024-10-10'), AST_hora_ent: new Date('2024-10-10T08:00:00Z'), AST_fec_sal: new Date('2024-10-10'), AST_hora_sal: new Date('2024-10-10T17:00:00Z') },
            { _id: 8, EMP_id: 2, AST_fec_ent: new Date('2024-10-11'), AST_hora_ent: new Date('2024-10-11T09:00:00Z'), AST_fec_sal: new Date('2024-10-11'), AST_hora_sal: new Date('2024-10-11T18:00:00Z') },
            { _id: 9, EMP_id: 3, AST_fec_ent: new Date('2024-10-12'), AST_hora_ent: new Date('2024-10-12T08:30:00Z'), AST_fec_sal: new Date('2024-10-12'), AST_hora_sal: new Date('2024-10-12T17:30:00Z') },
            { _id: 10, EMP_id: 1, AST_fec_ent: new Date('2024-10-13'), AST_hora_ent: new Date('2024-10-13T08:00:00Z'), AST_fec_sal: new Date('2024-10-13'), AST_hora_sal: new Date('2024-10-13T17:00:00Z') },
            { _id: 11, EMP_id: 2, AST_fec_ent: new Date('2024-10-14'), AST_hora_ent: new Date('2024-10-14T09:00:00Z'), AST_fec_sal: new Date('2024-10-14'), AST_hora_sal: new Date('2024-10-14T18:00:00Z') },
            { _id: 12, EMP_id: 3, AST_fec_ent: new Date('2024-10-15'), AST_hora_ent: new Date('2024-10-15T08:30:00Z'), AST_fec_sal: new Date('2024-10-15'), AST_hora_sal: new Date('2024-10-15T17:30:00Z') },
            { _id: 13, EMP_id: 1, AST_fec_ent: new Date('2024-10-16'), AST_hora_ent: new Date('2024-10-16T08:00:00Z'), AST_fec_sal: new Date('2024-10-16'), AST_hora_sal: new Date('2024-10-16T17:00:00Z') },
            { _id: 14, EMP_id: 2, AST_fec_ent: new Date('2024-10-17'), AST_hora_ent: new Date('2024-10-17T09:00:00Z'), AST_fec_sal: new Date('2024-10-17'), AST_hora_sal: new Date('2024-10-17T18:00:00Z') },
            { _id: 15, EMP_id: 3, AST_fec_ent: new Date('2024-10-18'), AST_hora_ent: new Date('2024-10-18T08:30:00Z'), AST_fec_sal: new Date('2024-10-18'), AST_hora_sal: new Date('2024-10-18T17:30:00Z') },
            { _id: 16, EMP_id: 1, AST_fec_ent: new Date('2024-10-19'), AST_hora_ent: new Date('2024-10-19T08:00:00Z'), AST_fec_sal: new Date('2024-10-19'), AST_hora_sal: new Date('2024-10-19T17:00:00Z') },
            { _id: 17, EMP_id: 2, AST_fec_ent: new Date('2024-10-20'), AST_hora_ent: new Date('2024-10-20T09:00:00Z'), AST_fec_sal: new Date('2024-10-20'), AST_hora_sal: new Date('2024-10-20T18:00:00Z') },
            { _id: 18, EMP_id: 3, AST_fec_ent: new Date('2024-10-21'), AST_hora_ent: new Date('2024-10-21T08:30:00Z'), AST_fec_sal: new Date('2024-10-21'), AST_hora_sal: new Date('2024-10-21T17:30:00Z') },
            { _id: 19, EMP_id: 1, AST_fec_ent: new Date('2024-10-22'), AST_hora_ent: new Date('2024-10-22T08:00:00Z'), AST_fec_sal: new Date('2024-10-22'), AST_hora_sal: new Date('2024-10-22T17:00:00Z') },
            { _id: 20, EMP_id: 2, AST_fec_ent: new Date('2024-10-23'), AST_hora_ent: new Date('2024-10-23T09:00:00Z'), AST_fec_sal: new Date('2024-10-23'), AST_hora_sal: new Date('2024-10-23T18:00:00Z') },
            { _id: 21, EMP_id: 3, AST_fec_ent: new Date('2024-10-24'), AST_hora_ent: new Date('2024-10-24T08:30:00Z'), AST_fec_sal: new Date('2024-10-24'), AST_hora_sal: new Date('2024-10-24T17:30:00Z') },
            { _id: 22, EMP_id: 1, AST_fec_ent: new Date('2024-10-25'), AST_hora_ent: new Date('2024-10-25T08:00:00Z'), AST_fec_sal: new Date('2024-10-25'), AST_hora_sal: new Date('2024-10-25T17:00:00Z') }
        ]);

        await db.collection('Vacaciones').insertMany([
            { _id: 1, EMP_id: 1, VAC_fec_sol: new Date('2024-10-29'), VAC_fec_ini: new Date('2024-11-07'), VAC_fec_fin: new Date('2024-11-21'), VAC_est: 1 },
            { _id: 2, EMP_id: 12, VAC_fec_sol: new Date('2024-10-30'), VAC_fec_ini: new Date('2024-11-08'), VAC_fec_fin: new Date('2024-11-22'), VAC_est: 0 },
            { _id: 3, EMP_id: 17, VAC_fec_sol: new Date('2024-10-31'), VAC_fec_ini: new Date('2024-11-09'), VAC_fec_fin: new Date('2024-11-23'), VAC_est: 1 },
            { _id: 4, EMP_id: 5, VAC_fec_sol: new Date('2024-11-01'), VAC_fec_ini: new Date('2024-11-10'), VAC_fec_fin: new Date('2024-11-24'), VAC_est: 1 },
            { _id: 5, EMP_id: 3, VAC_fec_sol: new Date('2024-11-02'), VAC_fec_ini: new Date('2024-11-11'), VAC_fec_fin: new Date('2024-11-25'), VAC_est: 0 },
            { _id: 6, EMP_id: 11, VAC_fec_sol: new Date('2024-03-14'), VAC_fec_ini: new Date('2024-04-01'), VAC_fec_fin: new Date('2024-04-14'), VAC_est: 1 },
            { _id: 7, EMP_id: 19, VAC_fec_sol: new Date('2024-09-11'), VAC_fec_ini: new Date('2024-09-15'), VAC_fec_fin: new Date('2024-09-19'), VAC_est: 0 },
            { _id: 8, EMP_id: 12, VAC_fec_sol: new Date('2024-01-02'), VAC_fec_ini: new Date('2024-04-10'), VAC_fec_fin: new Date('2024-04-20'), VAC_est: 1 },
            { _id: 9, EMP_id: 2, VAC_fec_sol: new Date('2024-10-22'), VAC_fec_ini: new Date('2024-10-24'), VAC_fec_fin: new Date('2024-10-30'), VAC_est: 1 },
            { _id: 10, EMP_id: 3, VAC_fec_sol: new Date('2024-07-20'), VAC_fec_ini: new Date('2024-07-29'), VAC_fec_fin: new Date('2024-07-30'), VAC_est: 0 },
            { _id: 11, EMP_id: 4, VAC_fec_sol: new Date('2024-02-21'), VAC_fec_ini: new Date('2024-02-24'), VAC_fec_fin: new Date('2024-02-28'), VAC_est: 0 },
            { _id: 12, EMP_id: 16, VAC_fec_sol: new Date('2024-12-23'), VAC_fec_ini: new Date('2024-12-31'), VAC_fec_fin: new Date('2024-12-31'), VAC_est: 1 }
        ]);

        await db.collection('Historial_Laboral').insertMany([
            { _id: 1, EMP_id: 6, CAR_id: 4, HIS_fec_in: new Date('2015-06-01'), HIS_fec_fin: new Date('2016-05-01'), HIS_sld_bsc: 3800.00 },
            { _id: 2, EMP_id: 6, CAR_id: 7, HIS_fec_in: new Date('2016-06-01'), HIS_fec_fin: new Date('2018-05-01'), HIS_sld_bsc: 4000.00 },
            { _id: 3, EMP_id: 7, CAR_id: 4, HIS_fec_in: new Date('2016-07-01'), HIS_fec_fin: new Date('2016-08-01'), HIS_sld_bsc: 4200.00 },
            { _id: 4, EMP_id: 3, CAR_id: 7, HIS_fec_in: new Date('2012-03-01'), HIS_fec_fin: new Date('2014-03-01'), HIS_sld_bsc: 3400.00 },
            { _id: 5, EMP_id: 3, CAR_id: 4, HIS_fec_in: new Date('2014-04-01'), HIS_fec_fin: new Date('2016-04-01'), HIS_sld_bsc: 3600.00 },
            { _id: 6, EMP_id: 4, CAR_id: 3, HIS_fec_in: new Date('2013-04-01'), HIS_fec_fin: new Date('2015-04-01'), HIS_sld_bsc: 3600.00 },
            { _id: 7, EMP_id: 9, CAR_id: 5, HIS_fec_in: new Date('2018-09-01'), HIS_fec_fin: new Date('2020-08-01'), HIS_sld_bsc: 4500.00 },
            { _id: 8, EMP_id: 9, CAR_id: 2, HIS_fec_in: new Date('2020-09-01'), HIS_fec_fin: new Date('2022-08-01'), HIS_sld_bsc: 4600.00 },
            { _id: 9, EMP_id: 7, CAR_id: 7, HIS_fec_in: new Date('2016-09-01'), HIS_fec_fin: new Date('2017-09-01'), HIS_sld_bsc: 4200.00 },
            { _id: 10, EMP_id: 7, CAR_id: 8, HIS_fec_in: new Date('2017-10-01'), HIS_fec_fin: new Date('2019-09-01'), HIS_sld_bsc: 4400.00 }
        ]);

        // Inserción de registros de Calculo_Salario. Se considera únicamente el sueldo básico y las deducciones por AFP.
        const employees = await db.collection('Empleado').find({ EMP_fec_ces: null }).toArray();

        for (const employee of employees) {
            const afp = await db.collection('AFP').findOne({ _id: employee.AFP_id });

            // Insert basic salary record
            await db.collection('Calculo_Salario').insertOne({
            EMP_id: employee._id,
            CSA_mon: employee.EMP_sld_bsc,
            CSA_desc: 'Sueldo básico',
            CSA_fec_ini: new Date('2024-10-01'),
            CSA_fec_fin: new Date('2024-10-31'),
            CSA_tipo: 1
            });

            // Calculate deductions
            const afpOblAmount = employee.EMP_sld_bsc * (afp.AFP_apor_obl / 100);
            const seguroAmount = employee.EMP_sld_bsc * (afp.AFP_seg / 100);
            const comisionAmount = employee.EMP_sld_bsc * (afp.AFP_com / 100);

            // Insert deduction records
            await db.collection('Calculo_Salario').insertOne({
            EMP_id: employee._id,
            CSA_mon: afpOblAmount,
            CSA_desc: 'Aporte obligatorio',
            CSA_fec_ini: new Date('2024-10-01'),
            CSA_fec_fin: new Date('2024-10-31'),
            CSA_tipo: 0
            });

            await db.collection('Calculo_Salario').insertOne({
            EMP_id: employee._id,
            CSA_mon: seguroAmount,
            CSA_desc: 'Seguro',
            CSA_fec_ini: new Date('2024-10-01'),
            CSA_fec_fin: new Date('2024-10-31'),
            CSA_tipo: 0
            });

            await db.collection('Calculo_Salario').insertOne({
            EMP_id: employee._id,
            CSA_mon: comisionAmount,
            CSA_desc: 'Comisión',
            CSA_fec_ini: new Date('2024-10-01'),
            CSA_fec_fin: new Date('2024-10-31'),
            CSA_tipo: 0
            });
        }

        await db.collection('Contrato').insertMany([
            { _id: 1, EMP_id: 1, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 2500.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 2, EMP_id: 2, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 2800.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 3, EMP_id: 3, CTR_tip_con: 'Temporal', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2024-12-31'), CTR_sld_bsc: 3000.00, CTR_per_prueb: 2, CTR_mot_ter: null },
            { _id: 4, EMP_id: 4, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 2600.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 5, EMP_id: 5, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 3200.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 6, EMP_id: 6, CTR_tip_con: 'Temporal', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2024-11-30'), CTR_sld_bsc: 2900.00, CTR_per_prueb: 2, CTR_mot_ter: 'Necesidad de aumento de personal' },
            { _id: 7, EMP_id: 7, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 3100.00, CTR_per_prueb: 3, CTR_mot_ter: 'Irresponsabilidad laboral prolongada' },
            { _id: 8, EMP_id: 8, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 2700.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 9, EMP_id: 9, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 3400.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 10, EMP_id: 10, CTR_tip_con: 'Temporal', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2024-10-31'), CTR_sld_bsc: 3000.00, CTR_per_prueb: 2, CTR_mot_ter: null },
            { _id: 11, EMP_id: 11, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-01'), CTR_fec_fin: new Date('2025-01-01'), CTR_sld_bsc: 3600.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 12, EMP_id: 12, CTR_tip_con: 'Temporal', CTR_fec_ini: new Date('2024-02-01'), CTR_fec_fin: new Date('2024-12-31'), CTR_sld_bsc: 2800.00, CTR_per_prueb: 2, CTR_mot_ter: null },
            { _id: 13, EMP_id: 13, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-03-01'), CTR_fec_fin: new Date('2025-03-01'), CTR_sld_bsc: 3300.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 14, EMP_id: 14, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-04-01'), CTR_fec_fin: new Date('2025-04-01'), CTR_sld_bsc: 3700.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 15, EMP_id: 15, CTR_tip_con: 'Temporal', CTR_fec_ini: new Date('2024-03-15'), CTR_fec_fin: new Date('2024-11-30'), CTR_sld_bsc: 2700.00, CTR_per_prueb: 2, CTR_mot_ter: null },
            { _id: 16, EMP_id: 16, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-01-15'), CTR_fec_fin: new Date('2025-01-15'), CTR_sld_bsc: 3200.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 17, EMP_id: 17, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-02-15'), CTR_fec_fin: new Date('2025-02-15'), CTR_sld_bsc: 3500.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 18, EMP_id: 18, CTR_tip_con: 'Temporal', CTR_fec_ini: new Date('2024-05-01'), CTR_fec_fin: new Date('2024-09-30'), CTR_sld_bsc: 2500.00, CTR_per_prueb: 2, CTR_mot_ter: null },
            { _id: 19, EMP_id: 19, CTR_tip_con: 'Indefinido', CTR_fec_ini: new Date('2024-06-01'), CTR_fec_fin: new Date('2025-06-01'), CTR_sld_bsc: 3400.00, CTR_per_prueb: 3, CTR_mot_ter: null },
            { _id: 20, EMP_id: 20, CTR_tip_con: 'Temporal', CTR_fec_ini: new Date('2024-07-01'), CTR_fec_fin: new Date('2024-12-31'), CTR_sld_bsc: 3100.00, CTR_per_prueb: 2, CTR_mot_ter: null }
        ]);

    } catch (error) {
        console.error('An error occurred:', error);
    } finally {
        // Close the connection
        await client.close();
    }

}

main().catch(console.error);