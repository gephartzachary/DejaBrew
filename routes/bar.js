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

barRouter.get("/bar", function(req, res, next) {
    var selectBarSQL = 'SELECT * FROM Bar WHERE Name LIKE ?'; // Add new query on searches with Equery1 for beers on tap

    if (nameSearch == null) {
        nameSearch = '%';
    }

    db.query(selectBarSQL, [nameSearch], function(err, result, fields) {
        if (err) {throw err}
        res.render("bar", {
            barData: result,
            barChange: req.flash("barChange")
        });
    });
});

barRouter.post("/bar-search", function(req, res) {
    nameSearch = '%' + req.body.barName + '%';

    req.flash("barChange", ("Bar search name updated"))
    res.redirect('/bar');
});

module.exports = barRouter;