//Implementace knihovny express
const express = require('express')
const bodyParser = require("body-parser")
const app = express()
const apiRoute = express.Route()

//Nastavení portu pro express
const port = 3000


//Implementace knihovny mysql
var mysql = require('mysql');

//Node.js komiunikace s databází
//Definování propojení s databází + login
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "room_database",
});



//Připojení k databázi
con.connect(function(err){
  if (err) throw err;
});

//Použití knihovny na převodu z JSON do objektu
app.use(bodyParser.json())

//Express komunikace s klientem

//ROOM INFO
//Nastavení poslechu na adresu a výsledek
app.post('/api/roomData', function(req, res) {
  //pokus o vytáhnutí id z ***
  var databaseId = req.body.id;
  //request na databázi
  //Objekt
  requestInfoRoom(databaseId, function(rawData){
    var myJSON = JSON.stringify(rawData[0]);
    //poslání JSONu
    res.send(myJSON);
  });
});

//ROOM SCHEDULE
//Nastavení poslechu na adresu a výsledek
app.post('/api/roomSchedule ', function(req, res) {
  //pokus o vytáhnutí id z ***
  var databaseId = req.body.id;
  var databaseDate = req.body.date;
  //request na databázi
  //Objekt
  requestO(databaseId, databaseDate, function(rawData){
    var myJSON = JSON.stringify(rawData[0]);
    //poslání JSONu
    res.send(myJSON);
  });
});

//Zde čeká na příchod na PORT a pošle SENT (Nechává zapnutý průchod)
app.listen(port, () => console.log(`Example app listening on port ${port}!`))



//Komunikace s databází funkce

//Vypíše informace o místnosti s konkrétním id
function requestInfoRoom(data, callback){
  con.query("SELECT * FROM rooms WHERE id = '" + con.escape(data) + "'", function (err, result, fields) {
    if (err) throw err;
    callback(result);
  });
}

//Vypíše všechny události(název, od kdy, do kdy, kdo pořádá) na místnost s konkrétním id a konkrétním dnem
function requestOccupiedTime(dataID, dataDATE, callback){
  new RegExp('dddd-dd-dd');
  con.query("SELECT occupied_from, occupied_to, name, description FROM occupied WHERE id = " + con.escape(dataID) + " AND occupied_date = " + con.escape(dataDATE), function (err, result, fields) {
    if (err) throw err;
    callback(result);
  });
}



//DUMP


/*
//Vypíše informace o uživately s konkrétním id
function requestInfoUser(data){
  con.query("SELECT * FROM users WHERE id = '" + con.escape(data) + "'", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
}
*/

/*
//Vypíše list id místnosní
function requestListIdRooms(){
  con.query("SELECT id FROM rooms", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
    return result
  });
}
*/
