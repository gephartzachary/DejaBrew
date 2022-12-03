let mysql = require('mysql');

let db;

function connectDatabase() {
    if (db == null) {
        
        /* 
         * ZACHS SETUP:
         * {
         *      "host": "localhost",
         *      "user": "zachgephart",
         *      "password": "Zg-55255",
         *      "database": "dejabrew",
         *  }
         * 
         * ELIJAHS SETUP:
         * {
         *      "host": "localhost",
         *      "user": "",
         *      "password": "",
         *      "database": "dejabrew",
         *  }
         */

        db = mysql.createConnection({
            "host": "localhost",
            "user": "zachgephart",
            "password": "Zg-55255",
            "database": "dejabrew",
        });
    }

    db.connect(function(err){
        if(!err) {
            console.log('Database is connected!');

            console.log(db);

            db.query("SELECT * FROM bar", function (err, result, fields) {
                if (err) throw err;
                console.log(result);
                console.log(fields);
            });

        } else {
            console.log('Database could not be connected! :(')
        }
    });


    return db;
}

module.exports = connectDatabase();