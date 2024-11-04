const { MongoClient, ObjectId } = require('mongodb');

async function main() {
    // Connection URI and Database name
    const uri = 'mongodb://localhost:27017'; // Change this to your connection string if needed
    const client = new MongoClient(uri);

    try {
        // Connect to the MongoDB cluster
        await client.connect();
        console.log('Connected successfully to server');

        // Specify the database and collection
        const db = client.db('myDatabase'); // Replace 'myDatabase' with your DB name
        /*
        db.collection("Empleado", {
            validator: {
              $jsonSchema: {
                bsonType: "object",
                title: "Empleado",
                required: ["EMP_cod", "EMP_cta"],
                properties: {
                  "EMP_cod": { bsonType: "objectId" },
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
                },
              },
            },
          });

        const empleadoCollection = db.collection('Empleado');

        const empleadoData = {
            EMP_cod: new ObjectId(),
            EMP_cta: [
                {
                    EMP_banc: 'Bank A',
                    EMP_num: '123456789',
                    EMP_es_CTS: true
                },
                {
                    EMP_banc: 'Bank B',
                    EMP_num: '987654321',
                    EMP_es_CTS: false
                }
            ]
        };

        const result = await empleadoCollection.insertOne(empleadoData);
        console.log(`New document inserted with _id: ${result.insertedId}`);
        */
        /*
        const update = {
            $unset: {
                EMP_cod: ""
            }
        };

        const result = await db.collection('Empleado').updateMany({}, update);
        console.log(`Documents updated: ${result.modifiedCount}`);


        */

        /*
        const empleadoCollection = db.collection('Empleado');
        const empleados = await empleadoCollection.find({}).toArray();
        console.log('All records:', empleados);
        */
    const empleadoCollection = db.collection('Empleado');

    const newEmpleadoData = {
        EMP_cta: [
            {
                EMP_banc: 'Bank C',
                EMP_num: '1122334455',
                EMP_es_CTS: true
            },
            {
                EMP_banc: 'Bank D',
                EMP_num: '5566778899',
                EMP_es_CTS: false
            }
        ]
    };

    const newResult = await empleadoCollection.insertOne(newEmpleadoData);
    console.log(`New document inserted with _id: ${newResult.insertedId}`);

    } catch (error) {
        console.error('An error occurred:', error);
    } finally {
        // Close the connection
        await client.close();
    }
}

main().catch(console.error);