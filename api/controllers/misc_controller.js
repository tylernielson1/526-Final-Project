const db_conn = require('../../db/connection')
const mysql = require('mysql')
const config = require('../../config/config')

const connection = mysql.createConnection({
    host        : config.db.host,
    port        : config.db.port,
    user        : config.db.name,
    password    : config.db.pass,
    database    : config.db.database
})

connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack)
        return;
    }

    console.log('connected as id ' + connection.threadId)
})

const GET_COUNTRY_NAMES_QUERY = "SELECT countries.name\n"
                                + "FROM countries;"



function getCountries(req, res) {
    connection.query(GET_COUNTRY_NAMES_QUERY, function(error, results, fields) {
        if (error) {
            console.error('Error submitting database query.')
            res.statusCode = 404
        }
        res.json(results)
    })
}

module.exports = {
    getCountries
}