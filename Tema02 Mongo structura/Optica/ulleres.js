
db.createCollection( 'ulleres', {validator: {$jsonSchema: {bsonType: 'object',title:'ulleres',required: [         'marca',          'graduacio',          'color_montura',          'color_vidre'],properties: {marca: {bsonType: 'string'},graduacio: {bsonType: 'array',items: {
title:'object',required: [         'esquerra',          'dret'],properties: {esquerra: {bsonType: 'double'},dret: {bsonType: 'double'}}}},muntura: {bsonType: 'array',items: {
title:'object',properties: {flotant: {enum: },pasta: {enum: },metàlica: {enum: }}}},color_montura: {bsonType: 'string'},color_vidre: {bsonType: 'array',items: {
title:'object',properties: {dret: {bsonType: 'string'},esquerra: {bsonType: 'string'}}}},preu: {bsonType: 'double'}}         }      },
capped:
});  