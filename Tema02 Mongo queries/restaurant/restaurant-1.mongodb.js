/* global use, db */
// MongoDB Playground
// To disable this template go to Settings | MongoDB | Use Default Template For Playground.
// Make sure you are connected to enable completions and to be able to run a playground.
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.
// The result of the last command run in a playground is shown on the results panel.
// By default the first 20 documents will be returned with a cursor.
// Use 'console.log()' to print to the debug output.
// For more documentation on playgrounds please refer to
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/

// Select the database to use and clear the scrren.
cls;
use('Restaurant');
//01. Escriu una consulta per mostrar tots els documents en la col·lecció Restaurants.
db.Nuevayork.find({});
//02.Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine de tots els documents en la col·lecció Restaurants.
db.Nuevayork.find({}, {restaurant_id: 1, borough: 1, cuisine: 1});
//03.Escriu una consulta per mostrar el restaurant_id, name, borough i cuisine, però excloent el camp _id per tots els documents en la col·lecció Restaurants.
db.Nuevayork.find({}, {_id: 0, restaurant_id: 1, borough: 1, cuisine: 1});
// 04.Escriu una consulta per mostrar restaurant_id, name, borough i zip code, però excloent el camp _id per tots els documents en la col·lecció Restaurants.
db.Nuevayork.find ({},{_id:0, restaurant_id:1, name:1, borough:1,zip_code:1});
//05.Escriu una consulta per mostrar tots els restaurants que estan en el Bronx.
db.Nuevayork.find({borough:'Bronx'});
//06.Escriu una consulta per mostrar els primers 5 restaurants que estan en el Bronx.
db.Nuevayork.find({borough: "Bronx"}).limit(5);
//07.Escriu una consulta per mostrar els 5 restaurants després de saltar els primers 5 que siguin del Bronx.
db.Nuevayork.find({borough: "Bronx"}).skip(5).limit(5);
//08.Escriu una consulta per trobar els restaurants que tenen algun score més gran de 90.
db.Nuevayork.find({"grades.score": {$gt: 90}});
//09.Escriu una consulta per trobar els restaurants que tenen un score més gran que 80 però menys que 100.
// Aquesta no la tinc clara 
db.Nuevayork.find({"grades.score": {$gt: 80, $lt:100}});
db.Nuevayork.find({$and:[{"grades.score":{$gt:80}},{"grades.score":{$lt:100}}]}); 
//10.Escriu una consulta per trobar els restaurants que estan situats en una longitud inferior a -95.754168.
db.Nuevayork.find({"address.coord.1":{$gt:-95.754168}},{name:1,"address.coord":1});
//11.Escriu una consulta de MongoDB per a trobar els restaurants que no cuinen menjar 'American ' i tenen algun score superior a 70 i latitud inferior a -65.754168.
db.Nuevayork.find ({ $and: [{ 'cuisine': {$ne:'American'} },{"grades.score": {$gt: 70,}},{"address.coord":{$lt:-65.754168}} ] }); 
//12.Escriu una consulta per trobar els restaurants que no preparen menjar 'American' i tenen algun score superior a 70 i que, a més, es localitzen en longituds inferiors a -65.754168. Nota: Fes aquesta consulta sense utilitzar operador $and.
db.Nuevayork.find({cuisine: {$ne: "American "}, "grades.score": {$gt: 70}, "address.coord": {$lt: -65.754168}}); 
//13.Escriu una consulta per trobar els restaurants que no preparen menjar 'American ', tenen alguna nota 'A' i no pertanyen a Brooklyn. S'ha de mostrar el document segons la cuisine en ordre descendent.
db.Nuevayork.find({cuisine: {$ne:'American'}, "grades.grade": {$eq:'A'}, 'borough':{$ne: "Brooklyn"}}).sort({cuisine:-1});  
//14.Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Wil' en les tres primeres lletres en el seu nom.
db.Nuevayork.find({name: /^Wil/}, {restaurant_id:1, name:1, borough:1, cuisine:1})  
//15.Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'ces' en les últimes tres lletres en el seu nom.
db.Nuevayork.find({name: /ces$/}, {restaurant_id:1, name:1, borough:1, cuisine:1})
//16.Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Reg' en qualsevol lloc del seu nom.
db.Nuevayork.find({name: /.*Reg.*/}, {restaurant_id:1, name:1, borough:1, cuisine:1})
//17.Escriu una consulta per trobar els restaurants que pertanyen al Bronx i preparen plats Americans o xinesos.
db.Nuevayork.find({ borough: "Bronx", cuisine: { $in: ["American ", "Chinese"]}})
//18.Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per aquells restaurants que pertanyen a Staten Island, Queens, Bronx o Brooklyn.
db.Nuevayork.find({borough: {$in: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, {restaurant_id:1, name:1, borough:1, cuisine:1})
//19.Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que NO pertanyen a Staten Island, Queens, Bronx o Brooklyn.
db.Nuevayork.find({borough: { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"]}}, {restaurant_id:1, name:1, borough:1, cuisine:1})
//20.Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que aconsegueixin una nota menor que 10.
db.Nuevayork.find({"grades.score": {$lt: 10}}, {restaurant_id:1, name:1, borough:1, cuisine:1})
