const express = require("express")
const path = require("path")
const server = express()

server.set('view engine', 'ejs');
server.use('/static', express.static(path.join(__dirname, 'static')));

server.get('/', function(req, res) {
	res.render(path.join(__dirname, 'public/index.ejs'),{name: "Tyler"})
})

server.listen(3000, function() {
	console.log("Listening on port 3000")
})