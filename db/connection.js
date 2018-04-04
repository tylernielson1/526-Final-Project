const mysql = require('mysql')
const config = require('../config/config')

const connection = mysql.createConnection({
    host        : config.db.host,
    port        : config.db.port,
    user        : config.db.name,
    password    : config.db.pass,
    database    : config.db.database
})

connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack)
        return;
    }

    console.log('connected as id ' + connection.threadId)
})

module.exports = connection;