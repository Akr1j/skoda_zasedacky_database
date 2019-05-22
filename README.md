# Škoda zasedacky - database
Aplikaci naleznete [Zde](https://body0.ml/).

## Need instal:  
1.XAMPP -- https://www.apachefriends.org/index.html  

## XAMPP (database)  
1.Run XAMPP  
2.Start All Servers  
3.Open in browser http://localhost/phpmyadmin/index.php 

<br><br>
## Backend API

### Get room info
###### /api/roomData
Example request:
```
{
  "id":"M10-01",
}
```
Example response:
```
{
   "utility":[
      "tv",
      "whiteboard"
   ],
   "id":"M10-01",
   "contact":"dana.subrtova@skoda-auto.cz",
   "description":"",
   "chair":5,
   "reportedDefects":[
      {
         "fault_name":"Velká chyba",
         "description":"fvbnm",
         "date_fault":"2019-05-20T22:00:00.000Z",
         "email":""
      },
      {
         "fault_name":"Testovací Chyba",
         "description":"Popis testovací chyby",
         "date_fault":"2019-05-21T22:00:00.000Z",
         "email":"jirkajandourek@seznam.cz"
      }
   ]
}
```

### Get room schedule
###### /api/roomSchedule
Example request:
```
{
  "id": "M10-01",
  "date": "2019-05-21"
}
```
Example response:
```
{
   "schedule_list":[
      {
         "name":"Test Reservation",
         "owner":"Jan Nykl",
         "start":"15:00:00",
         "end":"17:00:00",
         "description":"Testovací rezervace"
      }
   ]
}
```

### Create new room reservation
###### /api/addRoomReservation
Example request:
```
{
  "id_room": "M10-01",
  "name_user": "Jiří Janďourek",
  "date":"2019-05-14",
  "occupied_from": "11:00:00",
  "occupied_to": "16:00:00",
  "name_reservation": "Důležitá schůzka",
  "description": "Popis důležité schůzky"
}
```
Example response:
```
{  
   "status":"Occupied"
}
```

### Create fault report
###### /api/newFault
Example request:
```
{
	"room_name": "M10-01",
  	"fault_name": "Testovací Chyba",
  	"utility": "chair",
  	"fault_description": "Popis testovací chyby",
  	"date_fault": "2019-05-22"
}
```
Examlpe response:
```
{
   "status":"Succes"
}
```
