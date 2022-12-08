var express = require('express');
var homeRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

const db = require('./database.js');

homeRouter.use(session({
    secret: "Confidential information",
    resave: false,
    saveUninitialized: false
}));

homeRouter.use(flash());

homeRouter.get("/", function(req, res) {

    let selectTopBeersSQL = "SELECT * FROM Beer ORDER BY Rating DESC LIMIT 5";
    let selectTopBarsSQL = "SELECT * FROM Bar ORDER BY Rating DESC LIMIT 5";
    let selectTopBreweriesSQL = "SELECT * FROM Brewery ORDER BY Rating DESC LIMIT 5";

    db.query(selectTopBeersSQL, function(err, tBeers, fields) {
        if (err) {throw err}

        db.query(selectTopBarsSQL, function (err, tBars, fields) {
            if (err) {throw err}

            db.query(selectTopBreweriesSQL, function (err, tBreweries, fields) {
                if (err) {throw err}

                res.render("home", {
                    topBeers: tBeers,
                    topBars: tBars,
                    topBreweries: tBreweries,
                    homeChange: req.flash("homeChange")
                });
            })
        });
    });
});

module.exports = homeRouter;