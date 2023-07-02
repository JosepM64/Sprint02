
db.createCollection( 'comanda', {validator: {$jsonSchema: {bsonType: 'object',title:'comanda',required: [         'client',          'botiga'],properties: {data: {bsonType: 'timestamp'},entrega: {enum: domicili, botiga},client: {bsonType: 'objectId'},botiga: {bsonType: 'objectId'}}         }      },
capped:
});  