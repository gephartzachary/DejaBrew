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

var nameSearch;
var tapNum;

brewRouter.get("/brewery", function(req, res, next) {
    var selectBrewSQL = 'SELECT * '
    +'FROM ( '
    +'SELECT Brewery.BreweryID as BreweryID, count(Beer.BeerID) as Beers FROM Brewery '
        +'JOIN Brews JOIN Beer '
        +'ON Brewery.BreweryID = Brews.BreweryID AND Brews.BeerID = Beer.BeerID '
        +'GROUP BY Brewery.BreweryID '
        +'HAVING Beers > ? '
        +') as BeerAmount JOIN Brewery '
    +'ON Brewery.BreweryID = BeerAmount.BreweryID '
    +'WHERE Name LIKE ?';

    if (nameSearch == null) {
        nameSearch = '%';
    }

    if (tapNum == null) {
        tapNum = 0;
    }

    db.query(selectBrewSQL, [tapNum, nameSearch], function(err, result, fields) {
        if (err) {throw err}
        res.render("brewery", {
            breweryData: result,
            breweryChange: req.flash("breweryChange")
        });
    });
});

brewRouter.post("/brewery-search", function(req, res) {
    if (req.body.brewName != ""){
        nameSearch = '%' + req.body.brewName + '%';
    }
    tapNum = parseInt(req.body.beerOnTap);

    req.flash("breweryChange", "Brewery search name updated");
    res.redirect("/brewery");
})

module.exports = brewRouter;