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

billRouter.get("/bill", function(req, res, next) {
    var selectBarSQL = 'SELECT * FROM Bar';

    db.query(selectBarSQL, function(err, result, fields) {
        if (err) {throw err}
        res.render("bill", {
            billData: result,
            billChange: req.flash("billChange")
        });
    });
});

module.exports = billRouter;