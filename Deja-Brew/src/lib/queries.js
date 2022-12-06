import express from 'express';
import { connectDatabase }  from './database.js';
import flash from 'connect-flash/lib/flash';

let database = connectDatabase();
let queryRouter = express.Router();
queryRouter.use(flash);

// /**
//  * @param {string} input
//  * @param {function} callback
//  */
// export async function query(input, callback) {
//     let result = database.query(input, function (err, result, fields) {
//         if (err) throw err;
//     });

//     console.log(result);
// }

queryRouter.get("./bars", function(req, res, next) {
    let input = "SELECT * FROM bar"
    database.query(input, function (err, result, fields) {
        if (err) throw err;
        res.render("departments", {
            title: "Bar List", 
            barData: result,
            barChange: req.flash("barChange")
        });
    });
}); 