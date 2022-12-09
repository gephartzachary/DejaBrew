var express = require('express');
var billRouter = express.Router();

const flash = require("connect-flash");
const session = require('express-session');

const db = require('./database.js');

billRouter.use(session({
    secret: "Confidential information",
    resave: false,
    saveUninitialized: false
}));

billRouter.use(flash());

billRouter.get("/bill", function(req, res, next) {
    var selectBarSQL = "SELECT Person.Name as Name, Tab.TabID as TabID, Tab.DateAdded as Date, Tabs.Price as Price "
    +"FROM ( "
        +"SELECT Tablist.TabID as TabID, sum(Quantity*Cost) AS Price "
        +"FROM Tablist JOIN Beer "
        +"ON TabList.BeerID = Beer.BeerID "
        +"GROUP BY TabID "
    +") as Tabs "
    +"JOIN Tab JOIN Pay JOIN Person "
    +"ON Tabs.TabID = Tab.TabID AND Tabs.TabID = Pay.TabID AND Pay.PID = Person.PID "
    +"ORDER BY Name ASC, Date ASC, Price DESC";

    db.query(selectBarSQL, function(err, result, fields) {
        if (err) {throw err}
        res.render("bill", {
            billData: result,
            billChange: req.flash("billChange")
        });
    });
});

module.exports = billRouter;