const pool = require('../../db/connection')

const GET_COUNTRY_NAMES_QUERY = "SELECT countries.name\n"
                                + "FROM countries;"

const GET_TEAM_NAMES_QUERY = "SELECT teams.name\n"
                            + "FROM teams;"

function getCountries(req, res) {
    pool.query(GET_COUNTRY_NAMES_QUERY, function(error, results, fields) {
        if (error) {
            console.error('Error submitting database query.')
            res.statusCode = 404
        }
        res.json(results)
    })
}

function getTeamNames(req, res) {
    pool.query(GET_TEAM_NAMES_QUERY, function(error, results, fields) {
        if (error) {
            console.error("Error submitting database query.")
            res.statusCode = 404
        }
        res.json(results)
    })
}

module.exports = {
    getCountries,
    getTeamNames
}