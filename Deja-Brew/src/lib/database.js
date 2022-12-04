import {createConnection} from "mysql";

export function connectDatabase() {
    let db; 
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
         *      "user": "elihelfen",
         *      "password": "DejaBrew4U",
         *      "database": "dejabrew",
         *  }
         */

        db = createConnection({
            "host": "localhost",
            "user": "elihelfen",
            "password": "DejaBrew4U",
            "database": "dejabrew",
        });
    }
    
    db.connect(function(err){
        if(!err) {
            console.log('Database is connected!');
        } else {
            console.log('Database could not be connected! :(');
            throw(err);
        }
    });

    return db;
}
