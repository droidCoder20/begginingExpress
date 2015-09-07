#config       = require('./config.json')[app.get('env')]
env          = process.env.NODE_ENV || 'production'
http         = require 'http'
express      = require 'express'
fs           = require 'fs'
logger       = require 'morgan'
responseTime = require 'response-time'
errorHandler = require 'errorhandler'
iniparser    = require 'iniparser'
config       = iniparser.parseSync('./config.ini')
routes       = require('./routes')(app)
router       = express.Router(['strict'])
app          = express()

## Config
app.set('view engine', 'jade')
app.set('views', './views')

## Use
app.use(express.static('../../public'))
app.use(responseTime())
app.use(router)


http.createServer(app).listen config.port, ->
  console.log('app started on port ' + config.port)

  
### Environments test 
if 'production' == env
    app.get '/', (req,res) ->
      res.render('index', {title: config.title, message: config.message})    

if 'development' == env
    app.use(errorHandler()) 
    app.get '/', (req,res) ->
      res.send 'Development mode test'    
###  