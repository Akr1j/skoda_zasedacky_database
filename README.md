# skoda_zasedacky_database

## Need instal:  
1.XAMPP -- https://www.apachefriends.org/index.html  

## XAMPP (database)  
1.Run XAMPP  
2.Start All Servers  
3.Open in browser http://localhost/phpmyadmin/index.php  

### Room info
Example request

```
{
  "id_room":1,
  "date":"2019-05-14"
}
```

### Add new room reservation
Example request
```
{
  "id_room": "1",
  "name_user": "Jiří Janďourek",
  "date":"2019-05-14",
  "occupied_from": "11:00:00",
  "occupied_to": "16:00:00",
  "name_reservation": "Důležitá schůzka",
  "description": "Popis důležité schůzky"
}
```
