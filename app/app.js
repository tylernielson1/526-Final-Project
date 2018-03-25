const express = require("express")
const path = require("path")
const server = express()

server.use('/static', express.static(path.join(__dirname, 'static')));

server.get('/', function(req, res) {
	res.sendFile(path.join(__dirname, 'public/index.html'))
})

server.listen(3000)