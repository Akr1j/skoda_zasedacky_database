//Implementace knihovny express
const express = require('express')
const bodyParser = require("body-parser")
const app = express()
const cookieParser = require('cookie-parser');
var cors = require('cors')
var jwt = require('jsonwebtoken');
var fs = require('fs');

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

app.use(cors())

//Express komunikace s klientem


//login
app.post('api/login', function(req, res){
  if(req.body.mane == null || req.body.password){
    res.status(401).send('Invalid Format')
  }
  let payload = {subject: 5}
  let token = jwt.sign(payload, 'secretKey')
  res.cookie("SESSIONID", jwtBearerToken, {httpOnly:true, secure:true});
  //res.status(200).send({token})
})


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
app.post('/api/roomSchedule', function(req, res) {
  //pokus o vytáhnutí id z ***
  var databaseId = req.body.id_room;
  var databaseDate = req.body.date;
  //request na databázi
  //Objekt
  requestOccupiedTime(databaseId, databaseDate, function(rawData){
    var myJSON = JSON.stringify(rawData);
    //poslání JSONu
    res.send(myJSON);
  });
});


//NEW ROOM SCHEDULE
//Nastavení poslechu na adresu a výsledek
app.post('/api/addRoomReservation', function(req, res) {
  //pokus o vytáhnutí id z ***
  /*
  var databaseUserName = req.body.name;
  var databaseDate = req.body.date;
  var databaseFrom = req.body.occupiedFrom;
  var databaseTo = req.body.occupiedTo;
  var databaseName = req.body.name;
  var databaseDescription = req.body.description;*/

  var databaseUserName = "Jiří Testík";
  var databaseDate = "2019-05-16";
  var databaseFrom = "12:00:00";
  var databaseTo = "13:00:00";
  var databaseName = "Testování místností";
  var databaseDescription = "Tato rezervace je zde pro účely testu";

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
function requestInfoRoom(dataId, callback){
  con.query("SELECT * FROM rooms WHERE id = '" + dataId + "'", function (err, result, fields) {
    if (err) throw err;
    
    callback(result);
  });
}

//Vypíše všechny události(název, od kdy, do kdy, kdo pořádá) na místnost s konkrétním id a konkrétním dnem
function requestOccupiedTime(dataId, dataDate, callback){
  new RegExp('dddd-dd-dd');
  con.query("SELECT name, occupied_from, occupied_to, submitter, description FROM occupied WHERE id_room = " + dataId + " AND occupied_date = '" + dataDate + "'", function (err, result, fields) {
  console.log("SELECT name, occupied_from, occupied_to, submitter, description FROM occupied WHERE id_room = " + dataId + " AND occupied_date = " + dataDate);
  console.log("Odpověď: " + result);
    if (err) throw err;
    callback(result);
  });
}

//Tvorba nové rezervace
function newRequestOccupiedTime(dataId, dataUserName, dataDate, dataFrom, dataTo, dataName, dataDescription, callback){
  if (con.query("SELECT name FROM occupied WHERE (occupied_date ="+ dataDate +") AND (" +  dataFrom +" BETWEEN occupied_from AND occupied_to) AND (" + dataTo + "BETWEEN occupied_from AND occupied_to)",
   function(err,result,fields) {
    console.log("xxx",result)
    con.query("INSERT INTO occupied VALUES ("+ dataId + ", " + dataName + ", " + dataDate +", " + dataFrom +", " + dataTo +", " + dataUserName +", " + dataDescription +")",
     function(err,result,fields){
      if (err) throw err;
      callback(result);
    });   
  }));
}

//

































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
