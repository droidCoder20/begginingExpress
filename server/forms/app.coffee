#config       = require('./config.json')[app.get('env')]
#namespace    = require 'express-namespace'
env          = process.env.NODE_ENV || 'production'
http         = require 'http'
express      = require 'express'
resource     = require 'express-resource'
fs           = require 'fs'
responseTime = require 'response-time'
errorHandler = require 'errorhandler'
bodyParser   = require 'body-parser'
router       = express.Router(['strict'])
app          = express()
#routes       = require('./routes')(app)

## Config
app.set('view engine', 'jade')
app.set('views', __dirname + '/views')

## Use
app.use(router)
app.use(responseTime())
app.use(require('stylus').middleware({
    src: '../../resources'
    compress: true
    dest: '../../public/css'
    }))
app.use(express.static('../../public'))
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
                        
## Load the resourceful route handlers
##app.resource('users', require('./handlers/users'))

app.get '/',(req,res) ->
    res.render('form_signup', {title: 'Forms in Express'})
    
app.get '/search-result', (req,res) ->
    name = req.query.name
    source = req.query.source
    console.log "Searching for #{name}"
    console.log "From: #{source}"
    res.send "#{name} : #{source}"

app.get '/skills', (req,res) ->
    skills = req.query.skills
    console.log 'Skills: '
    console.log "#{skill}" for skill in skills
        ##console.log "#{i+1}. #{skill}"
        
    res.json "#{req.query.skills}"

app.post '/signup', (req,res) ->
    name = req.body.name
    email = req.body.email
    console.log "Name: #{name}"
    console.log "Email: #{email}"
    console.log req.files
    res.json(req.files)
        
## Create Server
http.createServer(app).listen 3000, ->
  console.log 'app started on port 3000'