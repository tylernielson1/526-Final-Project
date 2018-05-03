const pool = require("../db/connection")
const mysql = require("mysql")
const bcrypt = require("bcrypt")
const player = require("./player")
const team = require("./team")

const CREATE_USER_QUERY = "INSERT INTO users(username, password, isAdmin)\n"
                        + "VALUES(?, ?, 0);"

const GET_USERNAMES_QUERY = "SELECT users.username\n"
                            + "FROM users;"

const GET_USER_QUERY = "SELECT users.userID, users.username, users.password, users.isAdmin\n"
                        + "FROM users\n"
                        + "WHERE users.username = \"?\";"

const GET_USER_ID_QUERY = "SELECT users.userID\n"
                        + "FROM users\n"
                        + "WHERE users.username = \"?\";"

const INSERT_FAVORITE_PLAYER_QUERY = "INSERT INTO user_favorite_players(userID, favoritePlayer)\n"
                                    + "VALUES(?, ?);"

const INSERT_FAVORITE_TEAM_QUERY = "INSERT INTO user_favorite_teams(userID, favoriteTeam)\n"
                                    + "VALUES(?, ?);"

const DELETE_FAVORITE_PLAYER_QUERY = "DELETE FROM user_favorite_players\n"
                                    + "WHERE (userID = ?) AND (favoritePlayer = ?);"

const DELETE_FAVORITE_TEAM_QUERY = "DELETE FROM user_favorite_teams\n"
                                    + "WHERE (userID = ?) AND (favoriteTeam = ?);"

const GET_FAVORITE_PLAYERS_QUERY = "SELECT players.playerID, players.firstName as firstName, players.lastName as lastName, players.number as number, players.position as position, countries.name as nationality, contract.value as salary, teams.name as team, players.photoPath as photoPath\n"
                                    + "from players\n"
                                    + "inner join countries on players.nationality=countries.code\n"
                                    + "inner join contract on players.playerID=contract.player_ID\n"
                                    + "inner join teams on contract.teamID=teams.teamID\n"
                                    + "WHERE players.playerID in (SELECT user_favorite_players.favoritePlayer from user_favorite_players where user_favorite_players.userID = ?);"

const GET_FAVORITE_TEAMS_QUERY = "SELECT teams.teamID, teams.name as name, teams.yearFounded as foundedIn, leagues.name as league, stadiums.name as stadium, teams.photoPath as photoPath\n"
                                + "from teams\n"
                                + "inner join leagues on teams.playsInLeague=leagues.leagueID\n"
                                + "inner join stadiums on teams.homeStadium=stadiums.stadiumID\n"
                                + "WHERE teams.teamID in (SELECT user_favorite_teams.favoriteTeam from user_favorite_teams where user_favorite_teams.userID = ?);"

function user(username, password, adminStatus, id) {
    this.username = username
    this.password = password
    this.adminStatus = adminStatus
}

function getUserID(username) {
    return new Promise(function(resolve, reject) {
        var inserts = username
        var sql_query = mysql.format(GET_USER_ID_QUERY, inserts)
        sql_query = sql_query.replace(/'/g, "")
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.\n" + error)
                reject(error)
            }
            resolve(results[0].userID)
        })
    })

}

function createNewUser(userData) {
    return new Promise(function(resolve, reject) {
        if (checkIfUserExists(userData.username)) {
            reject(new Error("User Exists already"))
        } else {
            bcrypt.hash(userData.password, 10, function(err, hash) {
                if (err) {
                    reject(err)
                }
                userData.password = hash  
                var inserts = [userData.username, userData.password]
                var sql_query = mysql.format(CREATE_USER_QUERY, inserts)
                pool.query(sql_query, function(error, results, fields) {
                    if (error) {
                        console.error("Error submitting database query.\n" + error)
                        reject(error)
                    }
                    var user = userObject(userData.username, userData.password)
                    resolve(user)
                })
            })
        }
    })
}

function userObject(username, password, adminStatus) {
    if (typeof adminStatus === 'undefined') {
        return new user(username, password, 0)
    } else {
        return new user(username, password, 1)
    }
    
}

function checkIfUserExists(username) {
    pool.query(GET_USERNAMES_QUERY, function(error, results, fields) {
        if (error) {
            console.error("Error submitting database query.\n" + error)
            return false
        }
        for (var i = 0; i < results.length; i++) {
            if (username === results[i].username) {
                return true
            }
        }
        return false
    }) 
}

function loginUser(userData) {
    return new Promise(function(resolve, reject) {
        var flag = checkIfUserExists(userData.username)
        if (flag == false) {
            var error = new Error("User does not exist")
            reject(error)
        }
        var insert = userData.username
        var sql_query = mysql.format(GET_USER_QUERY, insert)
        sql_query = sql_query.replace(/'/g, "")
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.\n" + error)
                reject(error)
            }
            var user = userObject(results[0].username, results[0].password, results[0].adminStatus)
            bcrypt.compare(userData.password, user.password, function(err, result) {
                if(err) {
                    reject(err)
                }
                resolve(user)
            })
        })
    })
}

function addFavoritePlayer(username, playerID) {
    return new Promise(function(resolve, reject) {
        getUserID(username)
        .then(userID => {
            console.log(userID)
            var inserts = [userID, playerID]
            var sql_query = mysql.format(INSERT_FAVORITE_PLAYER_QUERY, inserts)
            sql_query = sql_query.replace(/'/g, "")
            pool.query(sql_query, function(error, results, fields) {
                if (error) {
                    console.error("Error submitting database query.\n" + error)
                    reject(error)
                }
                resolve()
            })
        })
        .catch(error => {
            reject(error)
        })
    })
}

function removeFavoritePlayer(username, playerID) {
    return new Promise(function(resolve, reject) {
        getUserID(username)
        .then(userID => {
            var inserts = [userID, playerID]
            var sql_query = mysql.format(DELETE_FAVORITE_PLAYER_QUERY, inserts)
            sql_query = sql_query.replace(/'/g, "")
            pool.query(sql_query, function(error, results, fields) {
                if (error) {
                    console.error("Error submitting database query.\n" + error)
                    reject(error)
                }
                resolve()
            })
        })
        .catch(error => {
            reject(error)
        })
    })
}

function addFavoriteTeam(username, teamID) {
    return new Promise(function(resolve, reject) {
        getUserID(username)
        .then(userID => {
            var inserts = [userID, teamID]
            var sql_query = mysql.format(INSERT_FAVORITE_TEAM_QUERY, inserts)
            sql_query = sql_query.replace(/'/g, "")
            pool.query(sql_query, function(error, results, fields) {
                if (error) {
                    console.error("Error submitting database query.\n" + error)
                    reject(error)
                }
                resolve()
            })
        })
        .catch(error => {
            reject(error)
        })
    })
}

function removeFavoriteTeam(username, teamID) {
    return new Promise(function(resolve, reject) {
        getUserID(username)
        .then(userID => {
            var inserts = [userID, teamID]
            var sql_query = mysql.format(DELETE_FAVORITE_TEAM_QUERY, inserts)
            sql_query = sql_query.replace(/'/g, "")
            pool.query(sql_query, function(error, results, fields) {
                if (error) {
                    console.error("Error submitting database query.\n" + error)
                    reject(error)
                }
                resolve()
            })
        })
        .catch(error => {
            reject(error)
        })

    })
}

function getFavoritePlayers(username) {
    return new Promise(function(resolve, reject) {
        getUserID(username)
        .then(userID => {
            var inserts = userID
            var sql_query = mysql.format(GET_FAVORITE_PLAYERS_QUERY, inserts)
            sql_query = sql_query.replace(/'/g, "")
            pool.query(sql_query, function(error, results, fields) {
                if (error) {
                    console.error("Error submitting database query.\n" + error)
                    reject(error)
                }
                var players = new Array()
                for (var i = 0; i < results.length; i++) {
                    players.push(player.createPlayer(results[i].playerID, results[i].firstName, results[i].lastName, results[i].number, player.convertPosition(results[i].position), results[i].nationality, results[i].salary, results[i].team, results[i].photoPath))
                }
                resolve(players)
            })
        })
    })
}

function getFavoriteTeams(username) {
    return new Promise(function(resolve, reject) {
        getUserID(username)
        .then(userID => {
            var inserts = userID
            var sql_query = mysql.format(GET_FAVORITE_TEAMS_QUERY, inserts)
            sql_query = sql_query.replace(/'/g, "")
            pool.query(sql_query, function(error, results, fields) {
                if (error) {
                    console.error("Error submitting database query.\n" + error)
                    reject(error)
                }
                var teams = new Array()
                for (var i = 0; i < results.length; i++) {
                    teams.push(team.createTeam(results[i].teamID, results[i].name, results[i].foundedIn, results[i].league, results[i].stadium, results[i].photoPath))
                }
                resolve(teams)
            })
        })
    })
}

module.exports = {
    createNewUser,
    loginUser,
    getUserID,
    addFavoritePlayer,
    removeFavoritePlayer,
    addFavoriteTeam,
    removeFavoriteTeam,
    getFavoritePlayers,
    getFavoriteTeams
}