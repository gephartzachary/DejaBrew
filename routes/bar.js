var express = require('express');
var barRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

const db = require('./database.js');

barRouter.use(session({
    secret: "Confidential information",
    resave: false,
    saveUninitialized: false
}));

barRouter.use(flash());

barRouter.get("/bar", function(req, res, next) {
    var selectBarSQL = 'SELECT * FROM Bar JOIN Buys JOIN Beer ON Bar.BarID = Buys.BarID AND Buys.BeerID = Beer.BeerID ';

    db.query(selectBarSQL, function(err, result, fields) {
        if (err) {throw err}
        res.render("bar", {
            barData: result,
            barChange: req.flash("barChange")
        });
    });
});

module.exports = barRouter;