const SwaggerExpress = require('swagger-express-mw')
const SwaggerUi = require('swagger-tools/middleware/swagger-ui')
const express = require('express')
const config = require('./config/config')
const path = require('path')
const server = express()

var swagger_config = {
    appRoot: __dirname // required config, do not delete
}

SwaggerExpress.create(swagger_config, function(err, swaggerExpress) {
    if (err) {
        throw err
    }

    //installs middleware
    swaggerExpress.register(server)
    server.use(SwaggerUi(swaggerExpress.runner.swagger))

    server.set('view engine', 'ejs')
    server.use('/static', express.static(path.join(__dirname, 'static')))

    server.get('/', function(req, res) {
        res.render(path.join(__dirname, 'public/index.ejs'), {name: "Tyler"})
    })

    server.get('/playerinfo', function(req, res) {
        res.render(path.join(__dirname, 'public/player.ejs'), {})
    })

    server.get('/teaminfo', function(req, res) {
        res.render(path.join(__dirname, 'public/team.ejs'), {})
    })

    server.get('/searchplayers', function(req, res) {
        res.render(path.join(__dirname, 'public/searchplayer.ejs'), {})
    })

    server.get('/searchteams', function(req, res) {
        res.render(path.join(__dirname, 'public/searchteam.ejs'), {})
    })

    server.get('/playerresults', function(req, res) {
        res.render(path.join(__dirname, 'public/playerresults.ejs'), {})
    })

    server.get('/teamresults', function(req, res) {
        res.render(path.join(__dirname, 'public/teamresults.ejs'), {})
    })

    var port = config.app.port
    server.listen(port, function() {
        console.log(`Listening on port ${port}`)
    })
})