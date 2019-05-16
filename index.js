//Implementace knihovny express
const express = require('express');
const bodyParser = require("body-parser");
var app = express();
const apiRoute = express.Route();
var passport = require('passport');


app.post('/login',
  passport.authenticate('local'),
  function(req, res) {
    // If this function gets called, authentication was successful.
    // `req.user` contains the authenticated user.
    res.redirect('/users/' + req.user.username);
  });


app.listen(3000, function() {

console.log('Hey there from the server on port 3000');
})