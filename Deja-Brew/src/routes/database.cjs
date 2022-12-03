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
        } else {
            console.log('Error connecting database!');
        }
    });

    let query = db.query(`SHOW Tables`);

    console.log(query);

    return db;
}

module.exports = connectDatabase();