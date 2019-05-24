# Škoda zasedacky - database
App link: [Here](https://body0.ml/).
Github Front-end: [Here](https://github.com/body0/skoda_zasedcky_angular).
Github Back-end: [Here](https://github.com/Akr1j/skoda_zasedacky_database).

##Get started
###Front-end
-Download Angualr
-Clone front-end repository
-Cd to it 
-Build angular project (entry point -> dist/index.html)
```
ng build --prod --base-href ./
```
-Or run localy
```
ng serve
```
###Back-end
-Download nodejs and npm
-clone back-end repository
-Cd to it 
-install dependenci
-run npm
```
npm install
```
-serve servise on local port 3000
```
node index.js
```

## Reason why we made it
Simplicity and accessibility of booking conference hall in Škoda 

## Instructions how to use it
1. Open app
2. Scan QR code
3. Check availability of room
4. Book room for needed time interval

## Another features
1. Searching bar :white_check_mark:
2. Burger(Hamburger) menu 
    - QR-Code reader :white_check_mark: 
    - Add to home screen function :white_check_mark:
    - About app :white_check_mark:
    - User :x:
    - Last wieved :x:
3. Filtered search :x:
4. Map of conference rooms :x:
5. Cancellation of reservation :x:
6. Ofline mode :x:

## Unfinished
- In schedule component is made unnesseary request. Request response is already in parent component. 
I tried to change it, but i canť forse Angular to update view.
- Utility picture in not displayed if id demaged (code redy in room component)
- Not yet supported change betven day and mont view in shcedule component
- Frontend lack full support of add fault utility request and add new meeting request, database and front end is ready for handeling request and frontend have basic forms, but conection still dont work.
- in app conponent dont fork event, that lisen for popup to install app to homescreen (it should be possible to triger it with option in sidemenu)
-list of last viewed conference hall (nothing except unfinished GUI)
-unite css styles
- component side-nav not unused or finished
- login servise not unused or finished
- componenet meeting info should show info when click in schdule on gold/yellow element

##Description of front-end architecture
-2 modelus (src/app/app.module.ts; src/app/material/material.module.ts)
-every netrok request go through api ervise


## Used technology 
### Front-end
1. Angualr 7.3.4
   1.1 Angular Meterial 
   1.2 Angular PWA
2. QR Scanner (https://www.npmjs.com/package/qr-scanner)
   -!!! changed code (remove video element css transformation && changed WORKERDIR variable) !!!
### Back-end
1. nodejs 
2. nodejs liblary
   2.1 express
   2.2 mysql
   2.3 cors
   2.4 other libraries wasn't fully used
3. nginx
###Database
1. mysql
2. xamp (https://www.apachefriends.org/index.html)


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
-return "status":"Occupied" when  room is ocupied in requested term
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
-always return "status":"Succes"
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
