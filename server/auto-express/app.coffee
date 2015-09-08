#config       = require('./config.json')[app.get('env')]
#namespace    = require 'express-namespace'
env          = process.env.NODE_ENV || 'production'
http         = require 'http'
express      = require 'express'
resource     = require 'express-resource'
fs           = require 'fs'
logger       = require 'morgan'
responseTime = require 'response-time'
errorHandler = require 'errorhandler'
iniparser    = require 'iniparser'
config       = iniparser.parseSync('./config.ini')
router       = express.Router(['strict'])
app          = express()
routes       = require('./routes')(app)

## Config
app.set('view engine', 'jade')
app.set('views', __dirname + '/views')

## Use
app.use(express.static('../../public'))
app.use(responseTime())
app.use(router)
                        
## Load the resourceful route handlers
app.resource('users', require('./handlers/users'))

## Create Server
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

### Router Namespacing
app.namespace '/articles', ->
    app.get '/', (req,res) ->
        res.send('index of articles')
    app.get '/new', (req,res) ->
        res.send('new of articles')
    app.get '/edit/:id', (req,res) ->
        res.send("edit with id #{req.params.id} of articles")
    app.get '/delete/:id', (req,res) ->
        res.send("delete with id #{req.params.id} of articles")
    app.get '/2013', (req,res) ->
        res.send('articles from 2013')
    ##Nested namedspaces
    app.namespace '/2013/jan', (req,res) ->
        app.get '/', (req,res) ->
            res.send('articles from jan 2013')
        app.get '/nodejs', (req,res) ->
            res.send('articles from jan 2013 about nodejs')
        app.get '/yolo', (req,res) ->
            res.send('YOLO SWAG')    
###