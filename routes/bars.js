var express = require('express');
var barRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

barRouter.use(flash());

const db = require('./database.js');

barRouter.get("/bars", function(req, res, nexrt) {
    var selectBarSQL = 'SELECT * FROM bars';

    db.query(selectBarSQL, function(err, result, fields) {
        if (err) {throw err}
        res.render("bars", {
            barData: result,
            barChange: req.flash("barChange")
        });
    });
});

module.exports = barRouter;