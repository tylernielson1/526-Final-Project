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
            res.send('You must be logged in to view this page.')
        } else {
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
    server.get('/', function(req, res) {
        res.render(path.join(__dirname, 'public/index.ejs'), {})
    })

    server.get('/player-info/:player', function(req, res) {
        res.render(path.join(__dirname, 'public/player.ejs'), {})
    })

    server.get('team-info/:team', function(req, res) {
        res.render(path.join(__dirname, 'public/team.ejs'), {})
    })

    server.get('/searchplayers', function(req, res) {
        res.render(path.join(__dirname, 'public/searchplayer.ejs'), {nations: nations, teams: teams})
    })

    server.get('/searchteams', function(req, res) {
        res.render(path.join(__dirname, 'public/searchteam.ejs'), {})
    })

    server.all('/playerresults', function(req, res) {
        if(req.method == "POST") { 
            if(req.body.playerName === "") {
                player.getAllPlayers()
                .then(players => {
                    res.render(path.join(__dirname, 'public/playerresults.ejs'), {nations: nations, teams: teams, players: players})
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
                    res.render(path.join(__dirname, 'public/playerresults.ejs'), {nations: nations, teams: teams, players: players})
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

    server.all('/teamresults', function(req, res) {
        if(req.method == "POST") {
            if (req.body.stadiumNameToSearch != "" || typeof req.body.typeOfSearch !== 'undefined' || typeof req.body.league !== 'undefined') {
                console.log(req.body.league)
                team.advancedSearchResultsTeams(req.body)
                .then(teams => {
                    res.render(path.join(__dirname, 'public/teamresults.ejs'), {teams: teams})
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
                    res.render(path.join(__dirname, 'public/teamresults.ejs'), {teams: teams})
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
                    res.render(path.join(__dirname, 'public/teamresults.ejs'), {teams: teams})
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
            req.session.admin = user.adminStatus
            req.session.username = user.username
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

    //configures the port number and starts the server.
    var port = config.app.port
    server.listen(port, function() {
        console.log(`Listening on port ${port}`)
    })
})