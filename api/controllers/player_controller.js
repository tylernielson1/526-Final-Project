const pool = require('../../db/connection')
const player = require('../../app/player')

const GET_ALL_PLAYERS_QUERY = "SELECT *\n"
                            + "FROM players;"

function getAllPlayers(req, res) {
    return new Promise((resolve, reject) => {
        //TODO: Handle what happens in here. Not quite sure, since I can't test from campus. (THANKS OBAMA)
    })
}

module.exports = {
    getAllPlayers
}