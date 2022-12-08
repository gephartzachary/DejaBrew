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
    let selectTopBarsSQL = "SELECT *, (Ratings.rating/beers) as barRating "
        + "FROM ( "
            + "SELECT sum(Beer.Rating) as rating, count(Beer.BeerID) as beers, Buys.BarID as BarID " 
            + "FROM Beer "
            + "JOIN Buys "
            + "ON Beer.BeerID = Buys.BeerID "
            + "GROUP BY Buys.BarID "
            + ") as Ratings "
        + "JOIN Bar ON Ratings.BarID = Bar.BarID "
        + "ORDER BY barRating DESC "
        + "LIMIT 5";
    let selectTopBreweriesSQL = "SELECT *, (Ratings.rating/beers) as breweryRating "
        + "FROM ( "
            + "SELECT sum(Beer.Rating) as rating, count(Beer.BeerID) as beers, brews.BreweryID as BreweryID "
            + "FROM Beer "
            + "JOIN Brews "
            + "ON Beer.BeerID = Brews.BeerID "
            + "GROUP BY brews.BreweryID "
            + ") as Ratings "
        + "JOIN Brewery "
        + "ON Ratings.BreweryID = Brewery.BreweryID "
        + "ORDER BY breweryRating DESC "
        + "LIMIT 5";

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