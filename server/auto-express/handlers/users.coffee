iniparser = require 'iniparser'
config    = iniparser.parseSync('./config.ini')

exports.list = (req,res) ->
    res.send('Amar, Akbar, Anthoy')