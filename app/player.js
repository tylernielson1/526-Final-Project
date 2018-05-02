const pool = require('../db/connection')
const mysql = require('mysql')

const GET_ALL_PLAYERS_QUERY = "SELECT players.firstName as firstName, players.lastName as lastName, players.number as number, players.position as position, countries.name as nationality, contract.value as salary, teams.name as team, players.photoPath as photoPath\n"
                            + "from players\n"
                            + "inner join countries on players.nationality=countries.code\n"
                            + "inner join contract on players.playerID=contract.player_ID\n"
                            + "inner join teams on contract.teamID=teams.teamID;"

const GET_PLAYERS_BY_NAME_QUERY = "SELECT players.firstName as firstName, players.lastName as lastName, players.number as number, players.position as position, countries.name as nationality, contract.value as salary, teams.name as team, players.photoPath as photoPath\n"
                                + "from players\n"
                                + "inner join countries on players.nationality=countries.code\n"
                                + "inner join contract on players.playerID=contract.player_ID\n"
                                + "inner join teams on contract.teamID=teams.teamID\n"
                                + "where players.firstName LIKE \"%?%\" OR players.lastName like \"%?%\";"

const GET_PLAYERS_ADVANCED_SEARCH_QUERY_BASE = "SELECT players.firstName as firstName, players.lastName as lastName, players.number as number, players.position as position, countries.name as nationality, contract.value as salary, teams.name as team, players.photoPath as photoPath\n"
                                            + "from players\n"
                                            + "inner join countries on players.nationality=countries.code\n"
                                            + "inner join contract on players.playerID=contract.player_ID\n"
                                            + "inner join teams on contract.teamID=teams.teamID\n"
                                            + "WHERE ("

/* portions of queries to assemble advanced search - Team Name */
const TEAM_QUERY_PORTION = "teams.name = \"?\""

/* portions of queries to assemble advanced search - Salary */
const SALARY_LESS_THAN_QUERY_PORTION = "contract.value < ?"

const SALARY_GREATER_THAN_QUERY_PORTION = "contract.value > ?"

const SALARY_EQUAL_TO_QUERY_PORTION = "contract.value = ?"

const SALARY_BETWEEN_QUERY_PORTION = "contract.value BETWEEN ? AND ?"

/* portionns of queries to assemble advanced search - Position */
const ONE_POSITION_QUERY_PORTION = "players.position LIKE \"%?%\""

const TWO_POSITION_QUERY_PORTION = "players.position LIKE \"%?%\" OR players.position LIKE \"%?%\""

const THREE_POSITION_QUERY_PORTION = "players.position LIKE \"%?%\" OR players.position LIKE \"%?%\" OR players.position LIKE \"%?%\""

const FOUR_POSITION_QUERY_PORTION = "players.position LIKE \"%?%\" OR players.position LIKE \"%?%\" OR players.position LIKE \"%?%\" OR players.position LIKE \"%?%\""

/* portions of queries to assemble advanced search - Number */
const NUMBER_QUERY_PORTION = "players.number = ?"

/* portions of queries to assemble advanced search - Nationality */
const NATIONALITY_QUERY_PORTION = "countries.name = \"?\""

function player(firstName, lastName, number, position, nationality, salary, team, path) {
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
    this.path = path
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
                players.push(createPlayer(results[i].firstName, results[i].lastName, results[i].number, results[i].position, results[i].nationality, results[i].salary, results[i].team, results[i].photoPath))
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
                players.push(createPlayer(results[i].firstName, results[i].lastName, results[i].number, convertPosition(results[i].position), results[i].nationality, results[i].salary, results[i].team, results[i].photoPath))
            }
            resolve(players)
        })
    })
}

function advancedSearchResultsPlayer(params) {
    return new Promise(function(resolve, reject) {
        var sql_query = GET_PLAYERS_ADVANCED_SEARCH_QUERY_BASE
        var teamFlag = false
        var salaryFlag = false
        var positionFlag = false
        var numberFlag = false
        var nationalityFlag = false

        if(params.teamSelector != "") {
            teamFlag = true
            sql_query += TEAM_QUERY_PORTION
            sql_query = mysql.format(sql_query, params.teamSelector)
        }
        
        console.log(sql_query)
        if(typeof params.typeOfSearch !== 'undefined') {
            salaryFlag = true
            if (teamFlag) sql_query += ") AND ("
            if (params.typeOfSearch === "greaterThan") {
                sql_query += SALARY_GREATER_THAN_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.playerSalary1)
            }
            else if(params.typeOfSearch === "equalTo") {
                sql_query += SALARY_EQUAL_TO_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.playerSalary1)
            }
            else if(params.typeOfSearch === "lessThan") {
                sql_query += SALARY_LESS_THAN_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.playerSalary1)
            }
            else if(params.typeOfSearch === "between") {
                sql_query += SALARY_BETWEEN_QUERY_PORTION
                var inserts = [params.playerSalary1, params.playerSalary2]
                sql_query = mysql.format(sql_query, inserts)
            }
        }

        console.log(sql_query)
        if(typeof params.positionPlayed !== 'undefined') {
            positionFlag = true
            if (teamFlag || salaryFlag) sql_query += ") AND ("
            if (typeof params.positionPlayed === 'string') {
                sql_query += ONE_POSITION_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.positionPlayed)
            }
            else if (params.positionPlayed.length == 2) {
                sql_query += TWO_POSITION_QUERY_PORTION
                var inserts = [params.positionPlayed[0], params.positionPlayed[1]]
                sql_query = mysql.format(sql_query, inserts)
            }
            else if (params.positionPlayed.length == 3) {
                sql_query += THREE_POSITION_QUERY_PORTION
                var inserts = [params.positionPlayed[0], params.positionPlayed[1], params.positionPlayed[2]]
                sql_query = mysql.format(sql_query, inserts)
            }
            else if (params.positionPlayed.length == 4) {
                sql_query += FOUR_POSITION_QUERY_PORTION
                var inserts = [params.positionPlayed[0], params.positionPlayed[1], params.positionPlayed[2], params.positionPlayed[3]]
                sql_query = mysql.format(sql_query, inserts)
            }
        }

        console.log(sql_query)
        if(params.playerNumber != "") {
            numberFlaglag = true
            if (teamFlag || salaryFlag || numberFlag) sql_query += ") AND ("
            sql_query += NUMBER_QUERY_PORTION
            sql_query = mysql.format(sql_query, params.playerNumber)
        }

        console.log(sql_query)
        if(params.nationalitySelector != "") {
            nationalityFlag = true
            if (teamFlag || salaryFlag || positionFlag || numberFlag) sql_query += ") AND ("
            sql_query += NATIONALITY_QUERY_PORTION
            sql_query = mysql.format(sql_query, params.nationalitySelector)
        }

        if (teamFlag || salaryFlag || positionFlag || numberFlag || nationalityFlag) {
            sql_query += ");"
        } else {
            sql_query += ");"
        }
        sql_query = sql_query.replace(/'/g, "")

        console.log(sql_query)
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.")
                reject(error)
            }
            var players = new Array()
            for (var i = 0; i < results.length; i++) {
                players.push(createPlayer(results[i].firstName, results[i].lastName, results[i].number, convertPosition(results[i].position), results[i].nationality, results[i].salary, results[i].team, results[i].photoPath))
            }
            resolve(players)
        })
    })
}

function createPlayer(fname, lname, num, pos, nat, sal, team, path) {
    return new player(fname, lname, num, pos, nat, sal, team, path)
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
    getPlayersByName,
    advancedSearchResultsPlayer
}