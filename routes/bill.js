var express = require('express');
var billRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

const db = require('./database.js');

billRouter.use(session({
    secret: "Confidential information",
    resave: false,
    saveUninitialized: false
}));

billRouter.use(flash());