http         = require 'http'
express      = require 'express'
responseTime = require 'response-time'
errorHandler = require 'errorhandler'
router       = express.Router(['strict'])
app          = express()

app.set('view engine', 'jade')
app.set('views', './views')

app.use(express.static('../../public'))

app.use(responseTime())
app.use(router)
app.use(errorHandler())

app.get '/', (req,res) ->
  #res.render('index')
  fail()

http.createServer(app).listen 3000, ->
  console.log('app started')