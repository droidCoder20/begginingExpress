#config       = require('./config.json')[app.get('env')]
env          = process.env.NODE_ENV || 'production'
http         = require 'http'
fs           = require 'fs'
logger       = require('morgan')
responseTime = require 'response-time'
errorHandler = require 'errorhandler'
iniparser    = require 'iniparser'
config       = iniparser.parseSync('./config.ini')
express      = require 'express'
router       = express.Router(['strict'])
app          = express()

app.set('view engine', 'jade')
app.set('views', './views')

app.use(express.static('../../public'))

app.use(responseTime())
app.use(router)

if 'production' == env
    app.get '/', (req,res) ->
      res.render('index', {title: config.title, message: config.message})    

if 'development' == env
    app.use(errorHandler()) 
    app.get '/', (req,res) ->
      res.send 'Development mode test'    

app.get '/', (req,res) ->
    res.send 'Works on all environments'
    
http.createServer(app).listen config.port, ->
  console.log('app started on port ' + config.port)