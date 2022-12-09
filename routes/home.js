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

var topBeerOffset;
var topBarOffset;
var topBrewOffset;

homeRouter.get("/", function(req, res) {

    if (topBeerOffset == null) {
        topBeerOffset = 0;
        topBarOffset = 0;
        topBrewOffset = 0;
    }

    let selectTopBeersSQL = "SELECT *,((Beer.Likes/(Beer.Likes+Beer.Dislikes))*100) as Rating FROM Beer ORDER BY Rating DESC LIMIT 5 OFFSET ?";// make offset variable = 0 at start and then add or subtract 5 on button press
    let selectTopBarsSQL = "SELECT *, (Ratings.Rating/beers) as barRating "
        + "FROM ( "
            + "SELECT sum(((Beer.Likes/(Beer.Likes+Beer.Dislikes))*100)) as Rating, count(Beer.BeerID) as beers, Buys.BarID as BarID " 
            + "FROM Beer "
            + "JOIN Buys "
            + "ON Beer.BeerID = Buys.BeerID "
            + "GROUP BY Buys.BarID "
            + ") as Ratings "
        + "JOIN Bar ON Ratings.BarID = Bar.BarID "
        + "ORDER BY barRating DESC "
        + "LIMIT 5 OFFSET ?";// make offset variable = 0 at start and then add or subtract 5 on button press
    let selectTopBreweriesSQL = "SELECT *, (Ratings.Rating/beers) as breweryRating "
        + "FROM ( "
            + "SELECT sum(((Beer.Likes/(Beer.Likes+Beer.Dislikes))*100)) as Rating, count(Beer.BeerID) as beers, brews.BreweryID as BreweryID "
            + "FROM Beer "
            + "JOIN Brews "
            + "ON Beer.BeerID = Brews.BeerID "
            + "GROUP BY brews.BreweryID "
            + ") as Ratings "
        + "JOIN Brewery "
        + "ON Ratings.BreweryID = Brewery.BreweryID "
        + "ORDER BY breweryRating DESC "
        + "LIMIT 5 OFFSET ?";// make offset variable = 0 at start and then add or subtract 5 on button press

    db.query(selectTopBeersSQL, [topBeerOffset], function(err, tBeers, fields) {
        if (err) {throw err}

        db.query(selectTopBarsSQL, [topBarOffset], function (err, tBars, fields) {
            if (err) {throw err}

            db.query(selectTopBreweriesSQL, [topBrewOffset], function (err, tBreweries, fields) {
                if (err) {throw err}

                res.render("home", {
                    topBeers: tBeers,
                    topBars: tBars,
                    topBreweries: tBreweries,
                    BeerOffset: topBeerOffset,
                    BarOffset: topBarOffset,
                    BreweryOffset: topBrewOffset,
                    homeChange: req.flash("homeChange")
                });
            })
        });
    });
});

homeRouter.post("/topBeerOffsetDown", function(req, res) {
    topBeerOffset = parseInt(req.body.BeersOffset) - 5;

    if (topBeerOffset < 0) {
        topBeerOffset += 5;
    }

    req.flash("homeChange", "Beer Offset decreased");
    res.redirect("/");
});

homeRouter.post("/topBeerOffsetUp", function(req, res) {
    topBeerOffset = parseInt(req.body.BeersOffset) + 5;

    req.flash("homeChange", "Beer Offset increased");
    res.redirect("/");
});

homeRouter.post("/topBarOffsetDown", function(req, res) {
    topBarOffset = parseInt(req.body.BarOffset) - 5;

    if (topBarOffset < 0) {
        topBarOffset += 5;
    }

    req.flash("homeChange", "Bar Offset decreased");
    res.redirect("/");
});

homeRouter.post("/topBarOffsetUp", function(req, res) {
    topBarOffset = parseInt(req.body.BarOffset) + 5;

    req.flash("homeChange", "Bar Offset increased");
    res.redirect("/");
});

homeRouter.post("/topBreweryOffsetDown", function(req, res) {
    topBrewOffset = parseInt(req.body.BreweriesOffset) - 5;

    if (topBrewOffset < 0) {
        topBrewOffset += 5;
    }

    req.flash("homeChange", "Brew Offset decreased");
    res.redirect("/");
});

homeRouter.post("/topBreweryOffsetUp", function(req, res) {
    topBrewOffset = parseInt(req.body.BreweriesOffset) + 5;

    req.flash("homeChange", "Brew Offset increased");
    res.redirect("/");
});
module.exports = homeRouter;