
// Require packages for the server that were installed.
const express = require("express");
var path = require("path");
const ejs = require("ejs");
const _ = require("lodash");

// Require additional security packages for login information
const session = require('express-session');
const passport = require("passport");
var path = require('path');

// Require packages for error checks and sessions.
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var expressValidator = require('express-validator');

// Utilize the body parser package.
var bodyParser = require('body-parser');

// Use the file and error packages.
const { appendFile } = require("fs");
var createError = require('http-errors');

// Create web app using express. Set view engine to EJS.
// Utilize the body parser packages to parse data.
const app = express();
app.use(express.static("public"));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

// Add modules for the web application here.
const homeRoutes = require('./routes/home.js');
const listRoutes = require('./routes/list.js');
const breweryRoutes = require('./routes/brewery.js');
const beerRoutes = require('./routes/beer.js');
const barRoutes = require('./routes/bar.js');
const peopleRoutes = require('./routes/people.js');

// Use the route modules via app.use() below.
// We use the database route in the other files.
app.use('/', homeRoutes);
app.use('/', listRoutes);
app.use('/', breweryRoutes);
app.use('/', beerRoutes);
app.use('/', barRoutes);
app.use('/', peopleRoutes);

// Create a variable for listening on a port
// for Heroku or on the localhost port 3000.
const port = process.env.PORT || 3000;

// Begin listening for server requests on port 3000.
app.listen(port, function() {
    console.log("Server for DejaBrew Web App started on port 3000.");
});