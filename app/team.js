const pool = require("../db/connection")
const mysql = require("mysql")

const GET_ALL_TEAMS_QUERY = "SELECT teams.name as name, teams.yearFounded as foundedIn, leagues.name as league, stadiums.name as stadium\n"
                            + "from teams\n"
                            + "inner join leagues on teams.playsInLeague=leagues.leagueID\n"
                            + "inner join stadiums on teams.homeStadium=stadiums.stadiumID;"

const GET_TEAMS_BY_NAME_QUERY = "SELECT teams.name as name, teams.yearFounded as foundedIn, leagues.name as league, stadiums.name as stadium\n"
                                + "from teams\n"
                                + "inner join leagues on teams.playsInLeague=leagues.leagueID\n"
                                + "inner join stadiums on teams.homeStadium=stadiums.stadiumID\n"
                                + "where teams.name LIKE \"%?%\";"

const GET_TEAMS_ADVANCED_SEARCH_QUERY_BASE = "SELECT teams.name as name, teams.yearFounded as foundedIn, leagues.name as league, stadiums.name as stadium\n"
                                            + "from teams\n"
                                            + "inner join leagues on teams.playsInLeague=leagues.leagueID\n"
                                            + "inner join stadiums on teams.homeStadium=stadiums.stadiumID\n"
                                            + "WHERE ("

/* portions of queries to assemble advanced search - Year Founded */
const YEAR_FOUNDED_LESS_THAN_QUERY_PORTION = "teams.yearFounded < ?"

const YEAR_FOUNDED_GREATER_THAN_QUERY_PORTION = "teams.yearFounded > ?"

const YEAR_FOUNDED_EQUAL_TO_QUERY_PORTION = "teams.yearFounded = ?"

const YEAR_FOUNDED_BETWEEN_QUERY_PORTION = "teams.yearFounded BETWEEN ? AND ?"

/* portions of queries to assemble advanced search - League */
const ONE_LEAGUE_QUERY_PORTION = "league LIKE \"%?%\""

const TWO_LEAGUE_QUERY_PORTION = "league LIKE \"%?%\" OR league LIKE \"%?%\""

const THREE_LEAGUE_QUERY_PORTION = "league LIKE \"%?%\" OR league LIKE \"%?%\" OR league LIKE \"%?%\""

/* portions of queries to assemble advanced search - Stadium */
const STADIUM_NAME_QUERY_PORTION = "stadium LIKE \"%?%\""

function team(teamName, foundedIn, league, stadium) {
    this.name = teamName
    this.foundedIn = foundedIn
    this.league = league
    this.stadium = stadium
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
                teams.push(createTeam(results[i].name, results[i].foundedIn, results[i].league, results[i].stadium))
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
                teams.push(createTeam(results[i].name, results[i].foundedIn, results[i].league, results[i].stadium))
            }
            resolve(teams)
        })
    })
}

function advancedSearchResultsTeams(params) {
    return new Promise(function(resolve, reject) {
        var sql_query = ""
        var typeOfSearchFlag = false
        var leagueFlag = false
        var stadiumFlag = false
        if (typeof params.typeOfSearch !== 'undefined') {
            typeOfSearchFlag = true
            if (params.typeOfSearch === "greaterThan") {
                sql_query = GET_TEAMS_ADVANCED_SEARCH_QUERY_BASE + YEAR_FOUNDED_GREATER_THAN_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.foundedYear1)
            }
            else if(params.typeOfSearch === "equalTo") {
                sql_query = GET_TEAMS_ADVANCED_SEARCH_QUERY_BASE + YEAR_FOUNDED_EQUAL_TO_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.foundedYear1)
            }
            else if(params.typeOfSearch === "lessThan") {
                sql_query = GET_TEAMS_ADVANCED_SEARCH_QUERY_BASE + YEAR_FOUNDED_LESS_THAN_QUERY_PORTION
                sql_query = mysql.format(sql_query, params.foundedYear1)
            }
            else if(params.typeOfSearch === "between") {
                sql_query = GET_TEAMS_ADVANCED_SEARCH_QUERY_BASE + YEAR_FOUNDED_BETWEEN_QUERY_PORTION
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
        else sql_query += ";"
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
                teams.push(createTeam(results[i].name, results[i].foundedIn, results[i].league, results[i].stadium))
            }
            resolve(teams)
        })
    })
}

function createTeam(name, yearFounded, leagueName, stadiumName) {
    return new team(name, yearFounded, leagueName, stadiumName)
}

module.exports = {
    team,
    getAllTeams,
    getTeamsByName,
    advancedSearchResultsTeams
}