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

brewRouter.get("/brewery", function(req, res, next) {
    var selectBrewSQL = 'SELECT * FROM Brewery JOIN Brews JOIN Beer ON Brewery.BreweryID = Brews.BreweryID AND Brews.BeerID = Beer.BeerID ';

    db.query(selectBrewSQL, function(err, result, fields) {
        if (err) {throw err}
        res.render("brewery", {
            breweryData: result,
            breweryChange: req.flash("breweryChange")
        });
    });
});

module.exports = brewRouter;