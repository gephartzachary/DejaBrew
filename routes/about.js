var express = require('express');
var aboutRouter = express.Router();

aboutRouter.get("/about", function(req, res) {
    res.render("about");
});

module.exports = aboutRouter;