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

beerRouter.get("/beer", function(req, res, next) {
    var selectBarSQL = 'SELECT * FROM Beer';

    db.query(selectBarSQL, function(err, result, fields) {
        if (err) {throw err}
        res.render("beer", {
            beerData: result,
            beerChange: req.flash("beerChange")
        });
    });
});

module.exports = beerRouter;