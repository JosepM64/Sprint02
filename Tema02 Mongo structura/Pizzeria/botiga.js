
db.createCollection( 'botiga', {validator: {$jsonSchema: {bsonType: 'object',title:'botiga',required: [         'empleats'],properties: {nom: {bsonType: 'string'},adreça: {bsonType: 'array',items: {
title:'object',properties: {carrer: {bsonType: 'string'},codi: {bsonType: 'int'},localitat: {bsonType: 'string'},provincia: {bsonType: 'string'}}}},empleats: {bsonType: 'objectId'}}         }      },
capped:
});  