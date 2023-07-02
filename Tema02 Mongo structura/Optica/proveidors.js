
db.createCollection( 'proveidors', {validator: {$jsonSchema: {bsonType: 'object',title:'proveidors',required: [         'Nom',          'Adreça',          'ulleres'],properties: {Nom: {bsonType: 'string'},Adreça: {bsonType: 'array',items: {
title:'object',properties: {carrer: {bsonType: 'string'},número: {bsonType: 'int'},pis: {bsonType: 'int'},porta: {bsonType: 'int'},ciutat: {bsonType: 'string'},pais: {bsonType: 'string'}}}},ulleres: {bsonType: 'objectId'}}         }      },
capped:
});  