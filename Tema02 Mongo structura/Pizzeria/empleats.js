
db.createCollection( 'empleats', {validator: {$jsonSchema: {bsonType: 'object',title:'empleats',properties: {nom: {bsonType: 'string'},cognom: {bsonType: 'string'},NIF: {bsonType: 'string'},telèfon: {bsonType: 'string'},tipus: {enum: }}         }      },
capped:
});  