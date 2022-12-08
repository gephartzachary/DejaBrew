var express = require('express');
var barRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

barRouter.use(session({
    secret: "Confidential information",
    resave: false,
    saveUninitialized: false
}));

barRouter.use(flash());

const db = require('./database.js');

barRouter.get("/bar", function(req, res, nexrt) {
    var selectBarSQL = 'SELECT * FROM Bar';

    db.query(selectBarSQL, function(err, result, fields) {
        if (err) {throw err}
        res.render("bar", {
            barData: result,
            barChange: req.flash("barChange")
        });
    });
});

module.exports = barRouter;