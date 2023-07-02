
db.createCollection( 'client', {validator: {$jsonSchema: {bsonType: 'object',title:'client',required: [         'nom',          'cognom',          'adreça'],properties: {nom: {bsonType: 'string'},cognom: {bsonType: 'string'},adreça: {bsonType: 'array',items: {
title:'object',properties: {carrer: {bsonType: 'string'},codi: {bsonType: 'int'},ciutat: {bsonType: 'string'},provincia: {bsonType: 'string'}}}},phone: {bsonType: 'int'}}         }      },
capped:
});  