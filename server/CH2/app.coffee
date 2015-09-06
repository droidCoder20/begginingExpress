http = require 'http'
express = require 'express'
app = express()

app.set 'view engine', 'jade'

app.set 'views', './views'

app.use(express.static('../../public'))

app.get '/', (req,res) ->
  res.render('index')

http.createServer(app).listen 3000, ->
  console.log 'Express app started'