const pool = require("../db/connection")
const mysql = require("mysql")
const bcrypt = require("bcrypt")

const CREATE_USER_QUERY = "INSERT INTO users(username, password, isAdmin)\n"
                        + "VALUES(?, ?, 0);"

const GET_USERNAMES_QUERY = "SELECT users.username\n"
                            + "FROM users;"

const GET_USER_QUERY = "SELECT users.password, users.isAdmin\n"
                        + "FROM users\n"
                        + "WHERE users.username = \"?\";"

function user(username, password, adminStatus) {
    this.username = username
    this.password = password
    this.adminStatus = adminStatus
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
                console.log(hash)
                userData.password = hash
                console.log(userData.password)        
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

function userObject(username, password) {
    return new user(username, password, 0)
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
        var insert = userData.username
        var sql_query = mysql.format(GET_USER_QUERY, insert)
        sql_query = sql_query.replace(/'/g, "")
        pool.query(sql_query, function(error, results, fields) {
            if (error) {
                console.error("Error submitting database query.\n" + error)
                reject(error)
            }
            var user = userObject(results[0].username, results[0].password)
            bcrypt.compare(userData.password, user.password, function(err, result) {
                if (result) {
                    return resolve(user)
                } else {
                    return reject(err)
                }
            })
        })
    })
}

module.exports = {
    createNewUser,
    loginUser
}