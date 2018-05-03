const SwaggerExpress = require('swagger-express-mw')
const SwaggerUi = require('swagger-tools/middleware/swagger-ui')
const express = require('express')
const config = require('./config/config')
const path = require('path')
const bodyParser = require('body-parser')
const http = require('http')
const player = require('./app/player')
const team = require('./app/team')
const user = require('./app/user')
const session = require('express-session')
const bcrypt = require('bcrypt')
const server = express()

var swagger_config = {
    appRoot: __dirname // required config, do not delete
}

var nations = require('./config/nations.json')
var teams = require('./config/teams.json')

var http_request = {
    hostname: config.app.host,
    port: config.app.port,
    path: "",
    method: "",
    json: true
}

SwaggerExpress.create(swagger_config, function(err, swaggerExpress) {
    if (err) {
        throw err
    }

    //installs middleware
    swaggerExpress.register(server)
    server.use(SwaggerUi(swaggerExpress.runner.swagger))
    server.use(bodyParser.urlencoded({ extended: true }))

    //admin middleware
    function requiresAdmin(req, res, next) {
        if(!req.session.admin && !req.session.username) {
            res.statusCode = 401
            res.send('You must be an administrator to view this page.')
        } else {
            next()
        }
    }

    function isLoggedIn(req, res, next) {
        var loggedIn = false
        if(!req.session.username) {
            req.loggedIn = loggedIn
            next()
        } else {
            loggedIn = true
            req.loggedIn = loggedIn
            next()
        }
    }

    /* establishes session */
    server.use(session({
        secret: config.app.secret,
        resave: true,
        saveUninitialized: false
    }))

    //sets the view engine to use ejs and sets the static directory for css, js, and images.
    server.set('view engine', 'ejs')
    server.use('/static', express.static(path.join(__dirname, 'static')))

    //establishes all of the get endpoints.
    server.get('/', isLoggedIn, function(req, res) {
        res.render(path.join(__dirname, 'public/index.ejs'), {loggedIn: req.loggedIn})
    })

    server.get('/addPlayer', requiresAdmin, function(req, res) {
        res.render(path.join(__dirname, 'public/player.ejs'), {})
    })

    server.get('/addTeam', requiresAdmin, function(req, res) {
        res.render(path.join(__dirname, 'public/team.ejs'), {})
    })

    server.get('/searchplayers', isLoggedIn, function(req, res) {
        res.render(path.join(__dirname, 'public/searchplayer.ejs'), {loggedIn: req.loggedIn, nations: nations, teams: teams})
    })

    server.get('/searchteams', isLoggedIn, function(req, res) {
        res.render(path.join(__dirname, 'public/searchteam.ejs'), {loggedIn: req.loggedIn})
    })

    server.all('/playerresults', isLoggedIn, function(req, res) {
        if(req.method == "POST") {
            if (typeof req.body.typeOfSearch !== 'undefined' || typeof req.body.positionPlayed !== 'undefined' || req.body.playerNumber != "" || req.body.teamSelector != "" || req.body.nationalitySelector != "") {
                console.log(req.body.nationalitySelector)
                player.advancedSearchResultsPlayer(req.body)
                .then(players => {
                    res.render(path.join(__dirname, 'public/playerresults.ejs'), {loggedIn: req.loggedIn, nations: nations, teams: teams, players: players})
                })
                .catch(error => {
                    console.error(error)
                    res.statusCode = 404
                    res.end()
                })
            }
            else if(req.body.playerName === "") {
                player.getAllPlayers()
                .then(players => {
                    res.render(path.join(__dirname, 'public/playerresults.ejs'), {loggedIn: req.loggedIn, nations: nations, teams: teams, players: players})
                })
                .catch(error => {
                    console.error(error)
                    res.statusCode = 404
                    res.end()
                })
            }
            else {
                player.getPlayersByName(req.body.playerName)
                .then(players => {
                    res.render(path.join(__dirname, 'public/playerresults.ejs'), {loggedIn: req.loggedIn, nations: nations, teams: teams, players: players})
                })
                .catch(error => {
                    console.error(error)
                    res.statusCode = 404
                    res.end()
                })
            }
        }
        else if (req.method != "GET") {
            res.end();
        }
    })

    server.all('/teamresults', isLoggedIn, function(req, res) {
        if(req.method == "POST") {
            if (req.body.stadiumNameToSearch != "" || typeof req.body.typeOfSearch !== 'undefined' || typeof req.body.league !== 'undefined') {
                console.log(req.body.league)
                team.advancedSearchResultsTeams(req.body)
                .then(teams => {
                    res.render(path.join(__dirname, 'public/teamresults.ejs'), {loggedIn: req.loggedIn, teams: teams})
                })
                .catch(error => {
                    console.error(error)
                    res.statusCode = 404
                    res.end()
                })
            }
            else if(req.body.teamName === "") {
                team.getAllTeams()
                .then(teams => {
                    res.render(path.join(__dirname, 'public/teamresults.ejs'), {loggedIn: req.loggedIn, teams: teams})
                })
                .catch(error => {
                    console.error(error)
                    res.statusCode = 404
                    res.end()
                })
            }
            else {
                team.getTeamsByName(req.body.teamName)
                .then(teams => {
                    res.render(path.join(__dirname, 'public/teamresults.ejs'), {loggedIn: req.loggedIn, teams: teams})
                })
                .catch(error => {
                    console.error(error)
                    res.statusCode = 404
                    res.end()
                })

            }
        }
        else if (req.method != "GET") {
            res.end()
        }
    })

    server.get('/loader', function(req, res) {
        res.render(path.join(__dirname, 'public/loader.ejs'), {})
    })

    server.get('/login', function(req, res) {
        res.render(path.join(__dirname, 'public/login.ejs'), {})
    })

    server.get('/signup', function(req, res) {
        res.render(path.join(__dirname, 'public/signup.ejs'), {})
    })

    server.get('/profile', isLoggedIn, function(req, res) {
        if (req.loggedIn) {
            var favoritePlayers
            var favoriteTeams
            user.getFavoritePlayers(req.session.username)
            .then(players => {
                favoritePlayers = players
                user.getFavoriteTeams(req.session.username)
                .then(teams => {
                    favoriteTeams = teams
                    res.render(path.join(__dirname, 'public/profile.ejs'), {players: favoritePlayers, teams: favoriteTeams})
                })
            })
            .catch(error => {
                console.error(error)
                res.redirect('/')
            })
        } else {
            res.redirect('/')
        }
    })
    
    server.get('/logout', function(req, res, next) {
        if (req.session) {
            req.session.destroy(function(err) {
                if(err) {
                    return next(err)
                } else {
                    return res.redirect('/')
                }
            })
        }
    })

    server.get('/admin', requiresAdmin, function(req, res) {
        var allPlayers
        var allTeams
        player.getAllPlayers()
        .then(players => {
            allPlayers = players
            team.getAllTeams()
            .then(teams => {
                allTeams = teams
                res.render(path.join(__dirname, 'public/admin.ejs'), {players: allPlayers, teams: allTeams})
            })
        })
    })

    /* Establishes post endpoints for login and signup */
    server.post('/register', function(req, res) {
        var userData
        if (req.body.password !== req.body.confirmPassword && req.body.password !== "" && req.body.confirmPassword !== "") {
            var error = new Error("Passwords do not match.")
            error.statusCode = 400
            res.redirect('/signup')
        }

        if (req.body.username && req.body.password && req.body.confirmPassword) {
            userData = {
                username: req.body.username,
                password: req.body.password
            }
        }
        user.createNewUser(userData)
        .then(user => {
            res.redirect('/')
        })
        .catch(error => {
            console.error(error)
            res.statusCode = 404
            res.redirect('/signup')
        })

    })

    server.post('/checklogin', function(req, res) {
        console.log("logging in")
        var userData
        if (typeof req.body.username === 'undefined' || typeof req.body.password === 'undefined') {
            var error = new Error("Username or password box is empty.")
            error.statusCode = 400
            res.redirect('/login')
        }
        userData = {
            username: req.body.username,
            password: req.body.password
        }
        user.loginUser(userData)
        .then(user => {
            req.session.admin = user.adminStatus
            req.session.username = user.username
            console.log("logged in as ")
            console.log(req.session.username)
            res.redirect('/')
        })
        .catch(error => {
            console.error(error)
            res.statusCode = 404
            res.redirect('/login')
        })
    })

    /* Establishes post endpoints for deleting players and teams */
    server.post('/deletePlayer', function(req, res) {
        player.deletePlayerFromDatabase(req.body.playerID)
        .then(x => {
            res.redirect('/admin')
        })
        .catch(error => {
            console.log(error)
        })
    })

    server.post('/deleteTeam', function(req, res) {
        team.deleteTeamFromDatabase(req.body.teamID)
        .then(x => {
            res.redirect('/admin')
        })
        .catch(error => {
            console.log(error)
        })
    })

    /* Establishes post endpoints for adding favorite players */
    server.post('/addFavoritePlayer', function(req, res) {
        user.addFavoritePlayer(req.session.username, req.body.playerID)
        .then(x => {
            res.redirect('/profile')
        })
        .catch(error => {
            console.log(error)
        })
    })

    server.post('/addFavoriteTeam', function(req, res) {
        user.addFavoriteTeam(req.session.username, req.body.teamID)
        .then(x => {
            res.redirect('/profile')
        })
        .catch(error => {
            console.log(error)
        })
    })

    /* Establishes post endpoints for deleting favorite players */
    server.post('/deleteFavoritePlayer', function(req, res) {
        user.removeFavoritePlayer(req.session.username, req.body.playerID)
        .then(x => {
            res.redirect('/profile')
        })
        .catch(error => {
            console.log(error)
        })
    })

    server.post('/deleteFavoriteTeam', function(req, res) {
        user.removeFavoriteTeam(req.session.username, req.body.teamID)
        .then(x => {
            res.redirect('/profile')
        })
        .catch(error => {
            console.log(error)
        })
    })

    //configures the port number and starts the server.
    var port = config.app.port
    server.listen(port, function() {
        console.log(`Listening on port ${port}`)
    })
})