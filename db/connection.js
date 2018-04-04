const mysql = require('mysql')
const config = require('../config/config')

const pool = mysql.createPool({
    host        : config.db.host,
    port        : config.db.port,
    user        : config.db.name,
    password    : config.db.pass,
    database    : config.db.database
})

module.exports = pool