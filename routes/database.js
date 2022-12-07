var mysql = require('mysql');

var db;

function createDatabase() {
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
         *  "user": "",
         *  "password: "",
         *  "database": "dejabrew"
         */

        db = mysql.createConnection({
            "host": "localhost",
            "user": "zachgephart",
            "password": "Zg-55255",
            "database": "dejabrew"
        });

        return db;
    }
    module.exports = connectDatabase();
}