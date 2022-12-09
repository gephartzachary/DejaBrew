var express = require('express');
var beerRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

const db = require('./database.js');

beerRouter.use(session({
    secret: "Confidential information",
    resave: false,
    saveUninitialized: false
}));

beerRouter.use(flash());

var nameSearch;

beerRouter.get("/beer", function(req, res, next) {
    var selectBarSQL = 'SELECT *, ((Likes/(Likes+Dislikes))*100) as Rating FROM Beer WHERE Name LIKE ?';

    if (nameSearch == null) {
        nameSearch = '%';
    }

    db.query(selectBarSQL, [nameSearch], function(err, result, fields) {
        if (err) {throw err}
        res.render("beer", {
            beerData: result,
            beerChange: req.flash("beerChanged")
        });
    });
});

beerRouter.get("/beer-new", function(req, res, next) {
    res.render("beer-new");
});

beerRouter.post("/beer-search", function(req, res) {
    if (req.body.beerName != ""){
        nameSearch = '%' + req.body.beerName + '%';
    }

    req.flash("beerChange", "Beer search name updated");
    res.redirect("/beer");
});

beerRouter.post("/beer-like", function(req, res) {
    var beerID = parseInt(req.body.LikeBeerID);
    var newLikes = parseInt(req.body.Likes) + 1;

    var incremntBeerSQL = "UPDATE BEER SET Likes = ? WHERE BeerID = ? ";

    db.query(incremntBeerSQL, [newLikes, beerID], function (err, result, fields) {
        if (err) {throw err}

        req.flash("beerChanged", "Beer liked");
        res.redirect("/beer");
    });
});

beerRouter.post("/beer-dislike", function(req, res) {
    var beerID = parseInt(req.body.DislikeBeerID);
    var newDislikes = parseInt(req.body.Dislikes) + 1;

    var decremntBeerSQL = "UPDATE BEER SET Dislikes = ? WHERE BeerID = ? ";

    db.query(decremntBeerSQL, [newDislikes, beerID], function (err, result, fields) {
        if (err) {throw err}

        req.flash("beerChanged", "Beer disliked");
        res.redirect("/beer");
    });
});

beerRouter.post("/beer-remove", function(req, res) {

    var removeBeer = parseInt(req.body.DeleteBeerID);

    var removeBuysJOIN = "DELETE FROM Buys WHERE BeerID = ? ";
    var removeBrewsJOIN = "DELETE FROM Brews WHERE BeerID = ? ";
    var removeTabListJOIN = "DELETE FROM TabList WHERE BeerID = ?";
    var removeBeerSQL = "DELETE FROM Beer WHERE BeerID = ?";

    db.query(removeBuysJOIN, [removeBeer], function (err, result, fields) {
        if (err) { throw err }

        db.query(removeBrewsJOIN, [removeBeer], function(err, result, fields) {
            if (err) { throw err }

            db.query(removeTabListJOIN, [removeBeer], function(err, result, fields) {
                db.query(removeBeerSQL, [removeBeer], function (err, result, fields) {
                    if (err) { throw err}
    
                    req.flash("beerChanged", "Beer removed");
                    res.redirect("/beer");
                });
            });
        });
    });
});


beerRouter.post("/beer-add", function(req, res) {
    var beerName = req.body.Name;
    var dateAdded = new Date();
    var beerType = req.body.Type;
    var beerCost = req.body.Cost;
    var beerPic = "/picture";
    var beerLikes = 1;
    var beerDislikes = 0;
    var beerAlcVol = req.body.AlcVol;

    var beerAddQuery = "INSERT INTO Beer (Name, DateAdded, Type, Cost, Picture, Likes, Dislikes, AlcVol) "
    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?) ";

    db.query (beerAddQuery, [beerName, dateAdded, beerType, beerCost, beerPic, beerLikes, beerDislikes, beerAlcVol], function(err, result, field) {
        if (err) { throw err }

        req.flash("beerChanged", "Beer added");
        res.redirect("/beer");
    });
});



module.exports = beerRouter;