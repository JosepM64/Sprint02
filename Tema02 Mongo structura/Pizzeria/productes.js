
db.createCollection( 'productes', {validator: {$jsonSchema: {bsonType: 'object',title:'productes',properties: {pizza: {bsonType: 'array',items: {
title:'object',properties: {nom: {bsonType: 'string'},descripció: {bsonType: 'string'},imatge: {bsonType: 'binData'},preu: {bsonType: 'double'},category: {bsonType: 'array',items: {
title:'object',properties: {id_cat: {bsonType: 'objectId'},nom_cate: {bsonType: 'string'}}}}}}},haburguesa: {bsonType: 'array',items: {
title:'object',properties: {nom: {bsonType: 'string'},descripció: {bsonType: 'string'},imatge: {bsonType: 'binData'},preu: {bsonType: 'int'}}}},beguda: {bsonType: 'array',items: {
title:'object',properties: {nom: {bsonType: 'string'},descripció: {bsonType: 'string'},imatge: {bsonType: 'binData'},preu: {bsonType: 'double'}}}}}         }      },
capped:
});  