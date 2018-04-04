const pool = require('../../db/connection')

const GET_COUNTRY_NAMES_QUERY = "SELECT countries.name\n"
                                + "FROM countries;"

function getCountries(req, res) {
    pool.query(GET_COUNTRY_NAMES_QUERY, function(error, results, fields) {
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