const { MongoClient } = require('mongodb');

async function main() {
    // Connection URI and Database name
    const uri = 'mongodb://localhost:27017'; // Change this to your connection string if needed
    const client = new MongoClient(uri);

    try {
        // Connect to the MongoDB cluster
        await client.connect();
        console.log('Connected successfully to server');

        // Specify the database and collection
        const database = client.db('myDatabase'); // Replace 'myDatabase' with your DB name
        const collection = database.collection('myCollection'); // Replace 'myCollection' with your collection name

        // Insert a document
        const doc = { name: 'John Doe', age: 30, city: 'New York' };
        const result = await collection.insertOne(doc);
        console.log(`Document inserted with _id: ${result.insertedId}`);

        // Find the document
        const foundDoc = await collection.findOne({ name: 'John Doe' });
        console.log('Document found:', foundDoc);

    } catch (error) {
        console.error('An error occurred:', error);
    } finally {
        // Close the connection
        await client.close();
    }
}

main().catch(console.error);


/*
db.createCollection("AFP", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["AFP_cod", "AFP_desc", "AFP_apor_obl", "AFP_seg", "AFP_com"],
      properties: {
        AFP_cod: { bsonType: "int" },
        AFP_desc: { bsonType: "string" },
        AFP_apor_obl: { bsonType: "decimal" },
        AFP_seg: { bsonType: "decimal" },
        AFP_com: { bsonType: "decimal" }
      }
    }
  }
});

db.createCollection("Asistencia", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["AST_cod", "EMP_cod", "AST_fec_ent", "AST_hora_ent", "AST_fec_sal", "AST_hora_sal"],
      properties: {
        AST_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        AST_fec_ent: { bsonType: "date" },
        AST_hora_ent: { bsonType: "date" },
        AST_fec_sal: { bsonType: "date" },
        AST_hora_sal: { bsonType: "date" }
      }
    }
  }
});

db.createCollection("Banco", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["BAN_cod", "BAN_desc"],
      properties: {
        BAN_cod: { bsonType: "int" },
        BAN_desc: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Beneficios", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["BEN_cod", "EMP_cod", "TBE_cod", "BEN_fec", "BEN_mon"],
      properties: {
        BEN_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        TBE_cod: { bsonType: "int" },
        BEN_fec: { bsonType: "date" },
        BEN_mon: { bsonType: "decimal" }
      }
    }
  }
});

db.createCollection("Calculo_Salario", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["CSA_cod", "EMP_cod", "CSA_tipo", "CSA_mon", "CSA_desc", "CSA_fec_ini"],
      properties: {
        CSA_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        CSA_tipo: { bsonType: "bool" },
        CSA_mon: { bsonType: "decimal" },
        CSA_desc: { bsonType: "string" },
        CSA_fec_ini: { bsonType: "date" },
        CSA_fec_fin: { bsonType: "date" }
      }
    }
  }
});

db.createCollection("Cargo", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["CAR_cod", "CAR_desc"],
      properties: {
        CAR_cod: { bsonType: "int" },
        CAR_desc: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Condicion_Trabajo", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["CTB_cod", "CTB_desc"],
      properties: {
        CTB_cod: { bsonType: "int" },
        CTB_desc: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Contrato", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["CTR_cod", "EMP_cod", "CTR_tip_con", "CTR_fec_ini", "CTR_fec_fin", "CTR_sld_bsc"],
      properties: {
        CTR_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        CTR_tip_con: { bsonType: "string" },
        CTR_fec_ini: { bsonType: "date" },
        CTR_fec_fin: { bsonType: "date" },
        CTR_sld_bsc: { bsonType: "decimal" },
        CTR_per_prueb: { bsonType: "int" },
        CTR_mot_ter: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Cuenta_Bancaria", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["CBC_cod", "EMP_cod", "BAN_cod", "CBC_num_cta", "CBC_CTS"],
      properties: {
        CBC_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        BAN_cod: { bsonType: "int" },
        CBC_num_cta: { bsonType: "int" },
        CBC_CTS: { bsonType: "bool" }
      }
    }
  }
});

db.createCollection("Division", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["DIV_cod", "DIV_nom", "DIV_ubi_fis"],
      properties: {
        DIV_cod: { bsonType: "int" },
        DIV_nom: { bsonType: "string" },
        DIV_ubi_fis: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Empleado", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["EMP_cod", "CTB_cod", "SDV_cod", "EMP_nom", "EMP_ape_p", "EMP_ape_m", "TID_cod", "EMP_num_iden", "EMP_nac", "EMP_sex", "EMP_fec_nac", "EMP_dir", "EMP_tel", "EMP_fec_ing", "CAR_cod", "AFP_cod", "EMP_CUSPP", "EMP_sld_bsc"],
      properties: {
        EMP_cod: { bsonType: "int" },
        CTB_cod: { bsonType: "int" },
        SDV_cod: { bsonType: "int" },
        EMP_nom: { bsonType: "string" },
        EMP_ape_p: { bsonType: "string" },
        EMP_ape_m: { bsonType: "string" },
        TID_cod: { bsonType: "int" },
        EMP_num_iden: { bsonType: "string" },
        EMP_nac: { bsonType: "string" },
        EMP_sex: { bsonType: "string" },
        EMP_fec_nac: { bsonType: "date" },
        EMP_dir: { bsonType: "string" },
        EMP_tel: { bsonType: "string" },
        EMP_fec_ing: { bsonType: "date" },
        EMP_fec_ces: { bsonType: "date" },
        CAR_cod: { bsonType: "int" },
        AFP_cod: { bsonType: "int" },
        EMP_CUSPP: { bsonType: "string" },
        EMP_sld_bsc: { bsonType: "decimal" }
      }
    }
  }
});

db.createCollection("FAM_EMP", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["FAM_cod", "EMP_cod"],
      properties: {
        FAM_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" }
      }
    }
  }
});

db.createCollection("Familiar", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["FAM_cod", "PAR_cod", "TID_cod", "FAM_num_iden", "FAM_nom", "FAM_ape_p", "FAM_ape_m", "FAM_fec_nac", "FAM_sex"],
      properties: {
        FAM_cod: { bsonType: "int" },
        PAR_cod: { bsonType: "int" },
        TID_cod: { bsonType: "int" },
        FAM_num_iden: { bsonType: "string" },
        FAM_nom: { bsonType: "string" },
        FAM_ape_p: { bsonType: "string" },
        FAM_ape_m: { bsonType: "string" },
        FAM_fec_nac: { bsonType: "date" },
        FAM_fec_fall: { bsonType: "date" },
        FAM_sex: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Historial_Laboral", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["HIS_cod", "EMP_cod", "CAR_cod", "HIS_fec_in", "HIS_fec_fin", "HIS_sld_bsc"],
      properties: {
        HIS_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        CAR_cod: { bsonType: "int" },
        HIS_fec_in: { bsonType: "date" },
        HIS_fec_fin: { bsonType: "date" },
        HIS_sld_bsc: { bsonType: "decimal" }
      }
    }
  }
});

db.createCollection("Licencia", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["LIC_cod", "EMP_cod", "TLI_cod", "LIC_fec_sol"],
      properties: {
        LIC_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        TLI_cod: { bsonType: "int" },
        LIC_fec_sol: { bsonType: "date" },
        LIC_fec_ini: { bsonType: "date" },
        LIC_fic_fin: { bsonType: "date" },
        LIC_est: { bsonType: "bool" }
      }
    }
  }
});

db.createCollection("Parentesco", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["PAR_cod", "PAR_desc"],
      properties: {
        PAR_cod: { bsonType: "int" },
        PAR_desc: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Sub_division", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["SDV_cod", "SDV_nom", "DIV_cod"],
      properties: {
        SDV_cod: { bsonType: "int" },
        SDV_nom: { bsonType: "string" },
        DIV_cod: { bsonType: "int" }
      }
    }
  }
});

db.createCollection("Tipo_Beneficio", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["TBE_cod", "TBE_desc"],
      properties: {
        TBE_cod: { bsonType: "int" },
        TBE_desc: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Tipo_Identificacion", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["TID_cod", "TID_abr", "TID_desc"],
      properties: {
        TID_cod: { bsonType: "int" },
        TID_abr: { bsonType: "string" },
        TID_desc: { bsonType: "string" }
      }
    }
  }
});

db.createCollection("Tipo_Licencia", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["TLI_cod", "TLI_desc", "TLI_rem"],
      properties: {
        TLI_cod: { bsonType: "int" },
        TLI_desc: { bsonType: "string" },
        TLI_rem: { bsonType: "bool" }
      }
    }
  }
});

db.createCollection("Vacaciones", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["VAC_cod", "EMP_cod", "VAC_fec_sol", "VAC_fec_ini", "VAC_fec_fin", "VAC_est"],
      properties: {
        VAC_cod: { bsonType: "int" },
        EMP_cod: { bsonType: "int" },
        VAC_fec_sol: { bsonType: "date" },
        VAC_fec_ini: { bsonType: "date" },
        VAC_fec_fin: { bsonType: "date" },
        VAC_est: { bsonType: "bool" }
      }
    }
  }
});
*/