const SwaggerExpress = require('swagger-express-mw')
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

    server.set('view engine', 'ejs')
    server.use('/static', express.static(path.join(__dirname, 'static')))

    server.get('/', function(req, res) {
        res.render(path.join(__dirname, 'public/index.ejs'),{name: "Tyler"})
    })

    var port = config.app.port
    server.listen(port, function() {
        console.log(`Listening on port ${port}`)
    })
})