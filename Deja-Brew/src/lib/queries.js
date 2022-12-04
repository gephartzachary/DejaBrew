import { connectDatabase }  from './database.js';

let database = connectDatabase();

/**
 * @param {string} input
 */
export function query(input) {

    database.query(input, function (err, result, fields) {
        if (err) throw err;
        return result;
    });
}