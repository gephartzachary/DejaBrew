var mysql = require('mysql');

var db;

function connectDatabase() {
    if (!db) {

        /*
         * Zachs Data:
         *  "host": "localhost",
         *  "user": "zachgephart",
         *  "password": "Zg-55255",
         *  "database": "dejabrew"
         * 
         * Elijahs Data:
         *  "host": "localhost",
         *  "user": "elihelfen",
            "password": "DejaBrew4U",
         *  "database": "dejabrew"
         */

        db = mysql.createConnection({
            "host": "localhost",
            "user": "zachgephart",
            "password": "Zg-55255",
            "database": "dejabrew"
        });

        console.log("Database Connected");

        return db;
    }
}

module.exports = connectDatabase();