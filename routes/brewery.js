var express = require('express');
var brewRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

const db = require('./database.js');

brewRouter.use(session({
    secret: "Confidential information",
    resave: false,
    saveUninitialized: false
}));

brewRouter.use(flash());