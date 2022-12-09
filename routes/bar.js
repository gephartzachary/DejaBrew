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

var nameSearch;
var tapNum;

barRouter.get("/bar", function(req, res, next) {
    var selectBarSQL = 'SELECT * '
    +'FROM ( '
    +'SELECT Bar.BarID as BarID, count(Beer.BeerID) as Beers FROM Bar '
        +'JOIN Buys JOIN Beer '
        +'ON Bar.BarID = Buys.BarID AND Buys.BeerID = Beer.BeerID '
        +'GROUP BY Bar.BarID '
        +'HAVING Beers > ? '
        +') as BeerAmount JOIN Bar '
    +'ON Bar.BarID = BeerAmount.BarID '
    +'WHERE Name LIKE ?'; // Add new query on searches with Equery1 for beers on tap 

    if (nameSearch == null) {
        nameSearch = '%';
    }

    if (tapNum == null) {
        tapNum = 0;
    }

    db.query(selectBarSQL, [tapNum, nameSearch], function(err, result, fields) {
        if (err) {throw err}
        res.render("bar", {
            barData: result,
            barChange: req.flash("barChange")
        });
    });
});

barRouter.post("/bar-search", function(req, res) {
    if (req.body.barName != ""){
        nameSearch = '%' + req.body.barName + '%';
    }
    tapNum = parseInt(req.body.beerOnTap);

    req.flash("barChange", ("Bar search name updated"))
    res.redirect('/bar');
});

module.exports = barRouter;