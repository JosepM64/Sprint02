
db.createCollection( 'empleat', {validator: {$jsonSchema: {bsonType: 'object',title:'empleat',required: [         'ulleres'],properties: {nom: {bsonType: 'string'},vendes: {bsonType: 'array',items: {
title:'object',properties: {ullera_id: {bsonType: 'objectId'},client_id: {bsonType: 'objectId'},data: {bsonType: 'date'}}}},ulleres: {bsonType: 'objectId'}}         }      },
capped:
});  