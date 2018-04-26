const pool = require('../db/connection')
const mysql = require('mysql')

const GET_ALL_PLAYERS_QUERY = "SELECT players.firstName as firstName, players.lastName as lastName, players.number as number, players.position as position, countries.name as nationality, contract.salary as salary, teams.name as team\n"
                            + "from players\n"
                            + "inner join countries on players.nationality=countries.code\n"
                            + "inner join contract on players.playerID=contract.player_ID\n"
                            + "inner join teams on contract.teamID=teams.teamID;"

const GET_PLAYERS_BY_NAME_QUERY = "SELECT players.firstName as firstName, players.lastName as lastName, players.number as number, players.position as position, countries.name as nationality, contract.salary as salary, teams.name as team\n"
                                + "from players\n"
                                + "inner join countries on players.nationality=countries.code\n"
                                + "inner join contract on players.playerID=contract.player_ID\n"
                                + "inner join teams on contract.teamID=teams.teamID\n"
                                + "where players.firstName LIKE \"%?%\" OR players.lastName like \"%?%\";"

const GET_PLAYERS_ADVANCED_SEARCH_QUERY_BASE = "SELECT players.firstName as firstName, players.lastName as lastName, players.number as number, players.position as position, countries.name as nationality, contract.salary as salary, teams.name as team\n"
                                            + "from players\n"
                                            + "inner join countries on players.nationality=countries.code\n"
                                            + "inner join contract on players.playerID=contract.player_ID\n"
                                            + "inner join teams on contract.teamID=teams.teamID;"



function player(firstName, lastName, number, position, nationality, salary, team) {
    if (firstName == null) {
        this.name = `${lastName}`
    } else if (lastName == null) {
        this.name = `${firstName}`
    } else {
        this.name = `${firstName} ${lastName}`
    }
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
            var players = new Array()
            for (var i = 0; i < results.length; i++) {
                players.push(createPlayer(results[i].firstName, results[i].lastName, results[i].number, results[i].position, results[i].nationality, results[i].salary, results[i].team))
            }
            resolve(players)
        })
    })
}

function getPlayersByName(searchParam) {
    return new Promise(function(resolve, reject) {
        var inserts = [searchParam, searchParam]
        var sql_query = mysql.format(GET_PLAYERS_BY_NAME_QUERY, inserts)
        sql_query = sql_query.replace(/'/g, "")
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.")
                reject(error)
            }
            var players = new Array()
            for (var i = 0; i < results.length; i++) {
                players.push(createPlayer(results[i].firstName, results[i].lastName, results[i].number, convertPosition(results[i].position), results[i].nationality, results[i].salary, results[i].team))
            }
            resolve(players)
        })
    })
}

function createPlayer(fname, lname, num, pos, nat, sal, team) {
    return new player(fname, lname, num, pos, nat, sal, team)
}

function convertPosition(position) {
    switch(position) {
        case "GK":
            return "Goalkeeper"
            break
        case "DF":
            return "Defender"
            break
        case "MF":
            return "Midfielder"
            break
        case "FW":
            return "Forward"
            break
        default:
            return position
    }
}

function printInfo(player) {
    console.log(`Name: ${player.name}
                Number: ${player.number}
                Position: ${player.position}
                Nationality: ${player.nationality}
                Salary: ${player.salary}
                Team: ${player.team}`)
}

module.exports = {
    player,
    getAllPlayers,
    getPlayersByName
}