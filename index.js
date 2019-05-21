"use strict"

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
  user: "Guest",
  password: "Aa123456",
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
  var databaseRoomName = req.body.id
  //request na databázi
  //Objekt
  requestInfoRoom(databaseRoomName, function(rawData){
    var myJSON = JSON.stringify(rawData[0]);
    //poslání JSONu
    res.send(myJSON);
  });
});

//WRITE ROOM SCHEDULE
//Nastavení poslechu na adresu a výsledek
app.post('/api/roomSchedule', function(req, res) {
  //pokus o vytáhnutí id z ***
  var databaseRoomName = req.body.id_room;
  var databaseDate = req.body.date;
  //request na databázi
  //Objekt
  requestOccupiedTime(databaseRoomName, databaseDate, function(rawData){
  const outObj = Object.keys(rawData[0]).reduce( (acm, val) => {
      if(!NonUtilityEntry.includes(val)){
        if(rawData[0][val])
          acm.utility.push(val);
      }
      else
        acm[val] = rawData[0][val]
      return acm
    }, { utility:[] })
    var myJSON = JSON.stringify(outObj);
    //poslání JSONu
    res.send(myJSON);
  });
});


//CREAT NEW ROOM SCHEDULE
//Nastavení poslechu na adresu a výsledek
app.post('/api/addRoomReservation', function(req, res) {
  //pokus o vytáhnutí id z ***
  
  var databaseRoomName = req.body.id_room;
  var databaseUserName = req.body.name_user;
  var databaseDate = req.body.date;
  var databaseFrom = req.body.occupied_from;
  var databaseTo = req.body.occupied_to;
  var databaseName = req.body.name_reservation;
  var databaseDescription = req.body.description;

  //request na databázi
  //Objekt
  newRequestOccupiedTime(databaseRoomName, databaseUserName, databaseDate, databaseFrom, databaseTo, databaseName, databaseDescription, function(rawData){
    var myJSON = JSON.stringify(rawData);
    //poslání JSONu
    res.send(myJSON);
  });
});

//Zde čeká na příchod na PORT a pošle SENT (Nechává zapnutý průchod)
app.listen(port, () => console.log(`Example app listening on port ${port}!`))



//Komunikace s databází funkce

//Vypíše informace o místnosti s konkrétním jménem
function requestInfoRoom(dataRoomName, callback){
  con.query("SELECT room_name, contact, chair, tv, solid_door, speaker, dataprojector, whiteboard FROM rooms WHERE room_name = '" + dataRoomName + "'", function (err, result, fields) {
    if (err) throw err;
      con.query("SELECT fault, descriptio, date_fault FROM `defects` WHERE room_name = '" + dataRoomName +"'", function(error, result2, fields2){
        if(error) throw error;
        console.log(result, result2)
        result[0].reportedDefects = result2;
        callback(result);
      })
  });
}

//Vypíše všechny události(název, od kdy, do kdy, kdo pořádá) na místnost s konkrétním jménem a konkrétním dnem
function requestOccupiedTime(dataId, dataDate, callback){
  new RegExp('dddd-dd-dd');
  con.query("SELECT reservation_name, occupied_from, occupied_to, submitter, description FROM occupied WHERE room_name = '" + dataId + "' AND occupied_date = '" + dataDate + "'", function (err, result, fields) {
    if (err) throw err;
    callback(result);
  });
}
//Tvorba nové rezervace
function newRequestOccupiedTime(dataRoomId, dataUserName, dataDate, dataFrom, dataTo, dataReservationName, dataDescription, callback){
  con.query("select count(room_name) from occupied where occupied_date = '" + dataDate + "' and (room_name = '" + dataRoomId + "' and ((occupied_from BETWEEN '" + dataFrom + "' and '" + dataTo + "') or (occupied_to BETWEEN '" + dataFrom + "' and '" + dataTo + "')))", function(err, result, fields){
    if (err) throw err;

    if (result[0]['count(room_name)']  == 0) {
      con.query("INSERT INTO occupied (room_name, reservation_name, occupied_date, occupied_from, occupied_to, submitter, description) VALUES ( '"+ dataRoomId + "', '" + dataReservationName + "', '" + dataDate +"', '" + dataFrom +"', '" + dataTo +"', '" + dataUserName +"', '" + dataDescription +"')")
      callback("Succes");

    }else{
      callback("Occupied");
    }
  });
}