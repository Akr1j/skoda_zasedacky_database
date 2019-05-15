//Implementace knihovny express
const express = require('express')
const bodyParser = require("body-parser")

const app = express()
const apiRoute = express.Route()
//Nastavení portu pro express
const port = 3000

 console.log("in")
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
 console.log("in")
//app.use('/api', apiRoute);
 console.log("in")
app.use(bodyParser.json())

 console.log("in")

//Expres komunikace s klientem

//ROOM INFO
//Nastavení poslechu na adresu a výsledek
app.post('/api/roomData', function(req, res) {
  console.log(req.body)
  throw err;
  //pokus o vytáhnutí id z ***
  var databaseId = req.id;
  //request na databázi
  requestInfoRoom(databaseId);
  //Objekt
  var dataRaw = requestListIdRooms();
  //Konvert objektu do JSON
  var myJSON = JSON.stringify(dataRaw);
  //poslání JSONu
  res.send(myJSON);
});

//ROOM ID
//Nastavení poslechu na adresu a výsledek
app.post('/api/roomData', function(req, res) {

  //request na databázi
  requestListIdRooms();
  //Objekt
  var dataRaw = requestListIdRooms();
  //Konvert objektu do JSON
  var myJSON = JSON.stringify(dataRaw);
  //poslání JSONu
  res.send(myJSON);
});



//Zde čeká na příchod na PORT a pošle SENT (Nechává zapnutý průchod)
app.listen(port, () => console.log(`Example app listening on port ${port}!`))








//Komunikace s databází funkce

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

//Vypíše informace o místnosti s konkrétním id
function requestInfoRoom(data){
  con.query("SELECT * FROM rooms WHERE id = '" + con.escape(data) + "'", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
}

//Vypíše informace o uživately s konkrétním id
function requestInfoUser(data){
  con.query("SELECT * FROM users WHERE id = '" + con.escape(data) + "'", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
}

//Vypíše všechny události(název, od kdy, do kdy, kdo pořádá) na místnost s konkrétním id a konkrétním dnem
function requestOccupiedTime(dataID, dataDATE){
  new RegExp('dddd-dd-dd');
  con.query("SELECT occupied_from, occupied_to, name, description FROM occupied WHERE id = " + con.escape(dataID) + " AND occupied_date = " + con.escape(dataDATE), function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
}

