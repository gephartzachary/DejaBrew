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

brewRouter.get("/brewery", function(req, res, next) {
    var selectBrewSQL = 'SELECT * FROM Brewery WHERE Name LIKE ?';

    if (nameSearch == null) {
        nameSearch = '%';
    }

    db.query(selectBrewSQL, [nameSearch], function(err, result, fields) {
        if (err) {throw err}
        res.render("brewery", {
            breweryData: result,
            breweryChange: req.flash("breweryChange")
        });
    });
});

brewRouter.post("/brewery-search", function(req, res) {
    nameSearch = '%' + req.body.brewName + '%';

    req.flash("breweryChange", "Brewery search name updated");
    res.redirect("/brewery");
})

module.exports = brewRouter;