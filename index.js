const express = require('express');
var path = require('path');
const ejs = require('ejs');

var bodyParser = require('body-parser');

const {appendFile} = require("fs");
var createError = require('http-errors');

const app = express();
app.use(express.static("public"));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: false}));
app.use(bodyParser.json());

const homeRoutes = require('./routes/home-about');
const barRoutes = require('./routes/bars');

app.use('/', homeRoutes);
app.use('/', barRoutes);

const port = 3000;
app.listen(port, function() {
    console.log("Server for DejaBrew Web App started on port 3000.");
});