const SwaggerExpress = require('swagger-express-mw')
const SwaggerUi = require('swagger-tools/middleware/swagger-ui')
const express = require('express')
const config = require('./config/config')
const path = require('path')
const bodyParser = require('body-parser')
const http = require('http')
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

    //sets the view engine to use ejs and sets the static directory for css, js, and images.
    server.set('view engine', 'ejs')
    server.use('/static', express.static(path.join(__dirname, 'static')))

    //establishes all of the get endpoints.
    server.get('/', function(req, res) {
        res.render(path.join(__dirname, 'public/index.ejs'), {})
    })

    server.get('/playerinfo', function(req, res) {
        res.render(path.join(__dirname, 'public/player.ejs'), {})
    })

    server.get('/teaminfo', function(req, res) {
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
            console.log(req.body.playerName)
        }
        else if (req.method != "GET") {
            res.end();
        }
        res.render(path.join(__dirname, 'public/playerresults.ejs'), {nations: nations, teams: teams})
    })

    server.get('/loader', function(req, res) {
        res.render(path.join(__dirname, 'public/loader.ejs'), {})
    })

    server.get('/teamresults', function(req, res) {
        res.render(path.join(__dirname, 'public/teamresults.ejs'), {})
    })

    server.get('/login', function(req, res) {
        res.render(path.join(__dirname, 'public/login.ejs'), {})
    })

    server.get('/signup', function(req, res) {
        res.render(path.join(__dirname, 'public/signup.ejs'), {})
    })

    //establishes all of the post endpoints.

    /*server.post('/playerresults', function(req, res) {
        res.render(path.join(__dirname, 'public/playerresults.ejs'), {user: req.body.playerName})
    })*/

    server.post('/teamresults', function(req, res) {
        res.render(path.join(__dirname, 'public/teamresults.ejs'), {})
    })

    //configures the port number and starts the server.
    var port = config.app.port
    server.listen(port, function() {
        console.log(`Listening on port ${port}`)
    })
})