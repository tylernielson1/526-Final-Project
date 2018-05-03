const pool = require("../db/connection")
const mysql = require("mysql")

const GET_ALL_TEAMS_QUERY = "SELECT teams.teamID, teams.name as name, teams.yearFounded as foundedIn, leagues.name as league, stadiums.name as stadium, teams.photoPath as photoPath\n"
                            + "from teams\n"
                            + "inner join leagues on teams.playsInLeague=leagues.leagueID\n"
                            + "inner join stadiums on teams.homeStadium=stadiums.stadiumID;"

const GET_TEAMS_BY_NAME_QUERY = "SELECT teams.teamID, teams.name as name, teams.yearFounded as foundedIn, leagues.name as league, stadiums.name as stadium, teams.photoPath as photoPath\n"
                                + "from teams\n"
                                + "inner join leagues on teams.playsInLeague=leagues.leagueID\n"
                                + "inner join stadiums on teams.homeStadium=stadiums.stadiumID\n"
                                + "where teams.name LIKE \"%?%\";"

const GET_TEAMS_ADVANCED_SEARCH_QUERY_BASE = "SELECT teams.teamID, teams.name as name, teams.yearFounded as foundedIn, leagues.name as league, stadiums.name as stadium, teams.photoPath as photoPath\n"
                                            + "from teams\n"
                                            + "inner join leagues on teams.playsInLeague=leagues.leagueID\n"
                                            + "inner join stadiums on teams.homeStadium=stadiums.stadiumID\n"
                                            + "WHERE ("

const DELETE_TEAM_QUERY = "DELETE FROM teams\n"
                        + "WHERE teams.teamID = ?;"

/* portions of queries to assemble advanced search - Year Founded */
const YEAR_FOUNDED_LESS_THAN_QUERY_PORTION = "teams.yearFounded < ?"

const YEAR_FOUNDED_GREATER_THAN_QUERY_PORTION = "teams.yearFounded > ?"

const YEAR_FOUNDED_EQUAL_TO_QUERY_PORTION = "teams.yearFounded = ?"

const YEAR_FOUNDED_BETWEEN_QUERY_PORTION = "teams.yearFounded BETWEEN ? AND ?"

/* portions of queries to assemble advanced search - League */
const ONE_LEAGUE_QUERY_PORTION = "leagues.name LIKE \"%?%\""

const TWO_LEAGUE_QUERY_PORTION = "leagues.name LIKE \"%?%\" OR league LIKE \"%?%\""

const THREE_LEAGUE_QUERY_PORTION = "leagues.name LIKE \"%?%\" OR league LIKE \"%?%\" OR league LIKE \"%?%\""

/* portions of queries to assemble advanced search - Stadium */
const STADIUM_NAME_QUERY_PORTION = "stadiums.name LIKE \"%?%\""

function team(id, teamName, foundedIn, league, stadium, path) {
    this.teamID = id
    this.name = teamName
    this.foundedIn = foundedIn
    this.league = league
    this.stadium = stadium
    this.path = path
}

function getAllTeams() {
    return new Promise(function(resolve, reject) {
        pool.query(GET_ALL_TEAMS_QUERY, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.\n" + error)
                reject(error)
            }
            var teams = new Array()
            for (var i = 0; i < results.length; i++) {
                teams.push(createTeam(results[i].teamID, results[i].name, results[i].foundedIn, results[i].league, results[i].stadium, results[i].photoPath))
            }
            resolve(teams)
        })
    })
}

function getTeamsByName(searchParam) {
    return new Promise(function(resolve, reject) {
        var sql_query = mysql.format(GET_TEAMS_BY_NAME_QUERY, searchParam)
        sql_query = sql_query.replace(/'/g, "")
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.")
                reject(error)
            }
            var teams = new Array()
            for (var i = 0; i < results.length; i++) {
                teams.push(createTeam(results[i].teamID, results[i].name, results[i].foundedIn, results[i].league, results[i].stadium, results[i].photoPath))
            }
            resolve(teams)
        })
    })
}

function advancedSearchResultsTeams(params) {
    return new Promise(function(resolve, reject) {
        var sql_query = GET_TEAMS_ADVANCED_SEARCH_QUERY_BASE
        var typeOfSearchFlag = false
        var leagueFlag = false
        var stadiumFlag = false
        console.log(sql_query)
        if (typeof params.typeOfSearch !== 'undefined') {
            typeOfSearchFlag = true
            if (params.typeOfSearch === "greaterThan") {
                sql_query += YEAR_FOUNDED_GREATER_THAN_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.foundedYear1)
            }
            else if(params.typeOfSearch === "equalTo") {
                sql_query += YEAR_FOUNDED_EQUAL_TO_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.foundedYear1)
            }
            else if(params.typeOfSearch === "lessThan") {
                sql_query += YEAR_FOUNDED_LESS_THAN_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.foundedYear1)
            }
            else if(params.typeOfSearch === "between") {
                sql_query += YEAR_FOUNDED_BETWEEN_QUERY_PORTION
                var inserts = [params.foundedYear1, params.foundedYear2]
                sql_query = mysql.format(sql_query, inserts)
            }
        }
        // For Testing, remove later
        console.log(sql_query)
        if (typeof params.league !== 'undefined') {
            leagueFlag = true
            if (typeOfSearchFlag) sql_query += ") AND ("
            if (typeof params.league === 'string') {
                sql_query += ONE_LEAGUE_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.league)
            }
            else if (params.league.length == 2) {
                sql_query += TWO_LEAGUE_QUERY_PORTION
                var inserts = [params.league[0], params.league[1]]
                sql_query = mysql.format(sql_query, inserts)
            }
            else if (params.league.length == 3) {
                sql_query += THREE_LEAGUE_QUERY_PORTION
                var inserts = [params.league[0], params.league[1], params.league[2]]
                sql_query = mysql.format(sql_query, inserts)
            }
        }
        // For testing, remove later
        console.log(sql_query)
        if (params.stadiumNameToSearch != "") {
            stadiumFlag = true
            if (leagueFlag || typeOfSearchFlag) sql_query += ") AND ("
            sql_query += STADIUM_NAME_QUERY_PORTION
            sql_query = mysql.format(sql_query, params.stadiumNameToSearch)
        }
        if (typeOfSearchFlag || leagueFlag || stadiumFlag) sql_query += ");"
        else sql_query += ");"
        sql_query = sql_query.replace(/'/g, "")
        // for testing, remove later
        console.log(sql_query)
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.")
                reject(error)
            }
            var teams = new Array()
            for (var i = 0; i < results.length; i++) {
                teams.push(createTeam(results[i].teamID, results[i].name, results[i].foundedIn, results[i].league, results[i].stadium, results[i].photoPath))
            }
            resolve(teams)
        })
    })
}

function createTeam(id, name, yearFounded, leagueName, stadiumName, path) {
    return new team(id, name, yearFounded, leagueName, stadiumName, path)
}

function deleteTeamFromDatabase(teamID) {
    return new Promise(function(resolve, reject) {
        var inserts = teamID
        var sql_query = mysql.format(DELETE_TEAM_QUERY, inserts)
        sql_query = sql_query.replace(/'/g, "")
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.\n" + error)
                reject(error)
            }
            resolve()
        })
    })
}

module.exports = {
    team,
    getAllTeams,
    getTeamsByName,
    advancedSearchResultsTeams,
    createTeam,
    deleteTeamFromDatabase
}