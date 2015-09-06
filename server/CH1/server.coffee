http = require 'http'
express = require 'express'
app = express()
routes = require('./routes')(app)

http.createServer(app).listen 3000, ->
  console.log('Express server listening on port ' + 3000)

