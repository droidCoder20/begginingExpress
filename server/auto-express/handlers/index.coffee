iniparser = require 'iniparser'
config    = iniparser.parseSync('./config.ini')

exports.index = (req,res) ->
    res.render('index', {title: config.title, message: config.message}) 
