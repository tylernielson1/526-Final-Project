const pool = require('../db/connection')

const GET_ALL_PLAYERS_QUERY = "SELECT *\n"
                            + "FROM players;"

function player(firstName, lastName, number, position, nationality, salary, team) {
    this.name = firstName + ' ' + lastName
    this.number = number
    this.position = position
    this.nationality = nationality
    this.salary = salary
    this.team = team
}

function getAllPlayers() {
    return new Promise(function(resolve, reject) {
        pool.query(GET_ALL_PLAYERS_QUERY, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.")
                reject(error)
            }
            playersJson = json(results)
            var players = new Array()
            for (var i = 0; i < playersJson.length; i++) {
                players.push(createPlayer(playersJson[i].firstName, playersJson[i].lastName, playersJson[i].number, playersJson[i].position, playersJson[i].nationality, playersJson[i].salary, playersJson[i].team))
            }
            resolve(players)
        })
    })
}

function createPlayer(fname, lname, num, pos, nat, sal, team) {
    return player(fname, lname, num, pos, nat, sal, team)
}

module.exports = {
    player,
    getAllPlayers
}